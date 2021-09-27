package com.musical.breadway.controller.user;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.musical.breadway.dto.CastInfoDTO;
import com.musical.breadway.dto.QuestDTO;
import com.musical.breadway.dto.ReserveDTO;
import com.musical.breadway.dto.ReviewDTO;
import com.musical.breadway.dto.ScheduleDTO2;
import com.musical.breadway.dto.ShowDTO;
import com.musical.breadway.dto.TheatreDTO;
import com.musical.breadway.mapper.marketer.MarketerScheduleMapper;
import com.musical.breadway.mapper.marketer.MarketerShowMapper;
import com.musical.breadway.mapper.user.UserScheduleMapper;
import com.musical.breadway.mapper.user.UserShowMapper;


@Controller
public class UserShowController {
	@Autowired
	private UserShowMapper showMapper;
	@Autowired
	private UserScheduleMapper scheduleMapper;
	@Autowired
	private MarketerShowMapper marketerShowMapper;
	@Autowired
	private MarketerScheduleMapper marketerScheduleMapper;
	
	
	@RequestMapping("/top.do")
    public String top(HttpServletRequest req) {
		String title = req.getParameter("title");
		req.setAttribute("title", title);
    
		return "show/top";
    }

	@RequestMapping("/show_summary.do")
	 public String getShowSummaryPage(HttpServletRequest req) {
	      //���� ���Ű��� ���������� �������� ������ db�� �ҷ����� ����� ���̱� ���� session�� ����
	      HttpSession session = req.getSession();
	            
	      String page = req.getParameter("page");
	      
	      if(page.equals("seats")) {
	         int schedule_id = Integer.parseInt(req.getParameter("schedule_id"));
	         ScheduleDTO2 schedule = scheduleMapper.fineScheduleOne(schedule_id);
	         
	         //������ ĳ���� ���� ��������
	         String role_table_name = req.getParameter("role_table_name");
	         Integer role_set = schedule.getRole_Set();
	         
	         Map<String, String> role = marketerShowMapper.get_roleList(role_table_name);
	         Map<String, String> actor = marketerScheduleMapper.get_scheduledCasts(role_table_name, role_set);
	         
	         req.setAttribute("role", role);   
	         req.setAttribute("actor", actor);

	         session.setAttribute("schedule_date", schedule);
	      }      
	      
	      if(page.equals("content")) {   
	         String show_ID = req.getParameter("show_ID");
	         List<Map<String, String>> list = showMapper.getShow(Integer.parseInt(show_ID));         
	         session.setAttribute("getShow",list.get(0));
	      }

	      req.setAttribute("page", page);
	      
	      return "show/summary";
	   }
	   
	@RequestMapping("/musical_content.do")
	public String content(HttpServletRequest req, @RequestParam(value="show_ID") int show_ID){
	      List<Map<String, String>> list = showMapper.getShow(show_ID);
	      List<CastInfoDTO> castList = showMapper.getPart(show_ID);
	      System.out.println(list);
	      System.out.println(castList);
	      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); //����Ʈ ����
	      String startDate = dateFormat.format(list.get(0).get("STARTDATE"));
	      String endDate = dateFormat.format( list.get(0).get("ENDDATE"));
	      System.out.println(startDate);
	      System.out.println(endDate);
	      req.setAttribute("startDate", startDate);
	      req.setAttribute("endDate", endDate);
	      req.setAttribute("getShow",list.get(0));
	      req.setAttribute("getPart",castList);
	      System.out.println(String.valueOf(list.get(0).get("SHOW_ID")));
	      req.setAttribute("show_ID", list.get(0).get("SHOW_ID"));
	      return "show/content";
	   }
	
	@RequestMapping("/mapload.do")
	public String map(HttpServletRequest req){
			int theatre_ID = Integer.parseInt(req.getParameter("placenum"));
			System.out.println(theatre_ID);
			TheatreDTO dto= showMapper.getTheatre(theatre_ID);
			req.setAttribute("theatre", dto);
		return "addrexample";
	}

	//������ ���� �� �˻��� �̸��� ������ �����ֱ�
	@RequestMapping("/musicalFind.do")
	public String MusicalFind(HttpServletRequest req) {
		String show_name = req.getParameter("show_Name");
		String area = req.getParameter("area");
		Map<String, String> map = new HashMap<String, String>();
		map.put("area", area);
		map.put("show_Name", show_name);
		System.out.println("1"+show_name);
		System.out.println("area:"+area);
		List<Map<String, String>> findList = showMapper.getFindList(map);
		System.out.println("�Ѿ�Ӵ�?");
		System.out.println(findList.isEmpty());
			if(findList.isEmpty()) {
			String isEmpty = "null";
			req.setAttribute("isEmpty", isEmpty);
			System.out.println("isEmpty ����" + isEmpty);
			return "musical/categoryPage_area";
		}
		req.setAttribute("findList", findList);
		return "musical/categoryPage_area";
	}
		
	//������ �������� �ϴ� ������ ����Ʈ �����ֱ�
	@RequestMapping("/musical_categoryPage_area.do")
	public String CategoryPage_area(HttpServletRequest req) {
		String show_name = req.getParameter("show_Name");
		String area = req.getParameter("area");
		System.out.println(show_name);
		System.out.println(area);
		return "musical/categoryPage_area";
	}
	
	//������ ��¥�� ����� �̵�
	@RequestMapping("/musical_categoryPage_date.do")
	public String CategoryPage_date(HttpServletRequest req) {
		return "musical/categoryPage_date";
	}
	
	//������ ��¥�� ������ ����Ʈ ��������
	@RequestMapping("/musical_musicalDateFind.do")
	public String MusicalDateFind(HttpServletRequest req) {
		String startDate = 
				req.getParameter("datepicker1").replace("-", "");
		String endDate = 
				req.getParameter("datepicker2").replace("-", "");
		System.out.println("������ �����Ͻ� �Ⱓ: ������"+startDate+" ������ :" + endDate);
		Map<String, String> map = new HashMap<String, String>();
		map.put("selectStartDate", startDate);
		map.put("selectEndDate", endDate);
		List<ShowDTO> list  = showMapper.getDateShowList(map);
		System.out.println(list);
		req.setAttribute("dateShowList", list);
		return "musical/categoryPage_date";
	}
	
	
	//�帣�� ������ ����Ʈ ������
	@RequestMapping("/musical_categoryPage.do")
	public String CategoryPage(HttpServletRequest req) {
		String genre = req.getParameter("genre");
		if(genre == null || genre.trim().contentEquals("") || genre.equals("action")) {
			genre = "drama";
		}

		List<ShowDTO> showList = showMapper.getListShow(genre);
		req.setAttribute("showList", showList);
		req.setAttribute("genre", genre);
		return "musical/categoryPage";
	}
	
	//������ ���� Ȯ��
	@RequestMapping("/musical_reserveCheck.do")
	public ModelAndView reserveCheck(HttpServletRequest req) {
		int show_ID =Integer.parseInt(req.getParameter("show_ID"));
		int consumer_UID = Integer.parseInt(req.getParameter("consumer_UID"));
		int res = showMapper.getReserveCheck(show_ID,consumer_UID);
		String msg = null, url = null;
		if(res>0) {
			msg = "�����ۼ��Ϸ� ���ϴ�~";
			url = "musical_reviewForm.do?consumer_UID="+consumer_UID;
		}else {
			msg = "���� ������ �����ϴ�!!!!";
			url = "musical_reviewlist.do?show_ID="+show_ID;
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName("message");
		
		return mav;
	}
	//������ �����ۼ�
	@RequestMapping("/musical_reviewForm.do")
	public ModelAndView reviewForm(HttpServletRequest req) {
		String consumer_UID = req.getParameter("consumer_UID");
		List<ReserveDTO> list = showMapper.getDate(Integer.parseInt(consumer_UID));
		req.setAttribute("view", list);
		System.out.println("view�� : " + list);	
		ModelAndView mav = new ModelAndView("show/reviewForm");

		return mav;
	}
	@RequestMapping("/musical_review_ok.do")
	public ModelAndView reviewOk(HttpServletRequest req, ReviewDTO dto) {
		String msg = null, url = null;
		ReviewDTO review = showMapper.writeCheck(dto.getShow_ID(),dto.getView_date(),dto.getWriter());
		if(review != null) {
			msg = "�̹� �ۼ��� �ıⰡ �ֽ��ϴ�.";
			url = "musical_reviewlist.do?show_ID="+dto.getShow_ID();
		}else {
			int res = showMapper.insertReview(dto);
			if(res>0) {
				msg = "�ıⰡ ���������� �ԷµǾ����ϴ�.";
				url = "musical_reviewlist.do?show_ID="+dto.getShow_ID();
				}
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName("message");
		
		return mav;
	}
	
	//������ �������
	@RequestMapping("/review_update.do")
	public String reviewUpdate(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		List<ReviewDTO> dto = showMapper.getReview(num);
		req.setAttribute("getReview",dto.get(0));
		System.out.println("reviewupdate:"+dto.get(0));
		return "show/reviewUpdate";
	}
	
	@RequestMapping("review_update_ok.do")
	public String reviewUpdateOk(HttpServletRequest req, ReviewDTO dto) {
		int res = showMapper.updateReview(dto);
		System.out.println(dto.getShow_ID());
		req.setAttribute("show_ID", dto.getShow_ID());
		String msg = "���� ������ �Ϸ��Ͽ����ϴ�.";
		String url = "musical_reviewlist.do?show_ID="+dto.getShow_ID();
		req.setAttribute("msg" ,msg);
		req.setAttribute("url", url);
		return "message";
	}
	//���� ����Ʈ
	@RequestMapping("/musical_reviewlist.do")
	public ModelAndView listReview(HttpServletRequest req, @RequestParam(value="show_ID") int show_ID){
		System.out.println(show_ID);
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if(pageNum == null || pageNum.trim().equals("")){
			pageNum = "1";
		}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage-1)*pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int rowCount;
			rowCount = showMapper.getReviewCount(show_ID);
			int number = rowCount - startRow + 1;
			
			int pageCount = rowCount/pageSize +(rowCount%pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
			int startPage =((currentPage-1)/pageBlock)*pageBlock+1;
			int endPage = startPage + pageBlock - 1;
			
			List<ReviewDTO> list = showMapper.listReview(show_ID,startRow, endRow);
			ModelAndView mav = new ModelAndView("show/reviewlist");
			System.out.println(list);
			mav.addObject("show_ID", show_ID);
			mav.addObject("listReview", list);
			mav.addObject("endRow",endRow);
			mav.addObject("number", number);
			mav.addObject("rowCount",rowCount);
			mav.addObject("pageBlock", pageBlock);
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("pageCount",pageCount);
			
			return mav;
		}
	//�������
	@RequestMapping("/review_delete.do")
	public ModelAndView deleteReview(HttpServletRequest req) {
		String num = req.getParameter("num");
		String show_ID = req.getParameter("show_ID");
		showMapper.deleteReview(Integer.parseInt(num));
		ModelAndView mav = new ModelAndView();
		mav.addObject("show_ID",show_ID);
		mav.setViewName("redirect:musical_reviewlist.do");
		return mav;
	}
	
	//����˻�
	@RequestMapping("/musical_findReivew.do")
	public String findReview(HttpServletRequest req) {
		String search = req.getParameter("search");
		String searchString = req.getParameter("searchString");
		List<ReviewDTO> list = showMapper.findReview(search,searchString);
		req.setAttribute("listReview", list);
		req.setAttribute("show_ID", req.getParameter("show_ID"));
		return "show/reviewlist";
	}
	
	
	
	//���� ���ǻ���
	@RequestMapping("/musical_qnalist.do")
	public ModelAndView listQuest(HttpServletRequest req,@RequestParam(value="show_ID") int show_ID){
		ShowDTO dto = showMapper.showMarketer(show_ID);
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if(pageNum == null || pageNum.trim().equals("")){
			pageNum = "1";
		}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage-1)*pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int rowCount;
			rowCount = showMapper.getQuestCount(show_ID);
			int number = rowCount - startRow + 1;
			
			int pageCount = rowCount/pageSize +(rowCount%pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
			int startPage =((currentPage-1)/pageBlock)*pageBlock+1;
			int endPage = startPage + pageBlock - 1;
			
			List<QuestDTO> list = showMapper.listQuest(show_ID,startRow, endRow);
			ModelAndView mav = new ModelAndView("show/qnalist");
			System.out.println(list);
			mav.addObject("show_ID", show_ID);
			mav.addObject("listQuest", list);
			mav.addObject("endRow",endRow);
			mav.addObject("number", number);
			mav.addObject("rowCount",rowCount);
			mav.addObject("pageBlock", pageBlock);
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("pageCount",pageCount);
			mav.addObject("showMarketer",dto.getMarketer_UID());
			return mav;
		}
	//qna �˻����
	@RequestMapping("/musical_findqna.do")
	public String findQuest(HttpServletRequest req) {
		String searchString = req.getParameter("searchString");
		List<QuestDTO> list = showMapper.findQuest(searchString);
		req.setAttribute("listQuest", list);
		//req.setAttribute("show_ID", req.getParameter("show_ID"));
		return "show/qnalist";
	}
	//�Ϲ�ȸ�� qna�ۼ�
	@RequestMapping("/musical_QNAForm.do")
	public ModelAndView qnAForm(HttpServletRequest req) {
		String show_ID = req.getParameter("show_ID");
		System.out.println("show id�� = " + show_ID);
		
		ModelAndView mav = new ModelAndView("show/qnaForm");
		mav.addObject("show_ID", show_ID);
		return mav;
	}
	
	@RequestMapping("/musical_QNAForm_ok.do")
	public ModelAndView qnAOk(HttpServletRequest req, QuestDTO dto) {
		String show_ID = req.getParameter("show_ID");
		System.out.println("show_ID�� : " + show_ID);
		int res = showMapper.insertQuest(dto);
		String msg = null, url = null;
		
		if(res>0) {
			msg = "���� ���������� ���� �Ǿ����ϴ�.";
			url = "musical_qnalist.do?show_ID="+dto.getShow_ID();
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName("message");
		return mav;
	}
	@RequestMapping("/quest_updateForm.do")
	public String questUpdate(HttpServletRequest req,@RequestParam int qnanum, @RequestParam int show_ID) {
		QuestDTO dto = showMapper.getQuest(qnanum);
		req.setAttribute("getQuest",dto);
		req.setAttribute("show_ID", show_ID);
		return "show/qnaUpdateForm";
	}
	@RequestMapping("/quest_delete.do")
	   public ModelAndView questDelete(HttpServletRequest req) {
	      String num = req.getParameter("qnanum");
	      String show_ID = req.getParameter("show_ID");
	      int res = showMapper.deleteQuest(Integer.parseInt(num));
	      String msg = null, url = null;  
	      if(res>0){
	    	  msg="���ǰ� �����Ǿ����ϴ�.";
	    	  url = "redirect:musical_qnalist.do";
	      }
	      ModelAndView mav = new ModelAndView();
	      
	      mav.addObject("show_ID",show_ID);
	      mav.addObject("msg",msg);
	      mav.addObject("url",url);
	      mav.setViewName("message");
	      return mav;
	   }
	@RequestMapping("/quest_update_ok.do")
	public ModelAndView questUpdateOk(QuestDTO dto) {
		String msg=null, url=null;
		int res = showMapper.updateQuest(dto);
		if(res>0) {
			msg="���� ������ �Ϸ�Ǿ����ϴ�.";
			url ="musical_qnalist.do?show_ID="+dto.getShow_ID();
		}
		ModelAndView mav = new ModelAndView();
		 mav.addObject("msg",msg);
	     mav.addObject("url",url);
	     mav.setViewName("message");
		return mav;
	}
	//�Ǹ��� ����ۼ�
	@RequestMapping("/quest_reContent.do")
	public String qnaAnswer(HttpServletRequest req,@RequestParam int qnanum, @RequestParam int show_ID) {
		QuestDTO dto = showMapper.getQuest(qnanum);
		req.setAttribute("getQuest", dto);
		req.setAttribute("show_ID", show_ID);
		return "show/qnaAnswer";
	}

	@RequestMapping("/quest_reContent_ok.do")
	public String qnaAnswerPro(QuestDTO dto) {
		int res = showMapper.reContent(dto);
		return "redirect:/musical_qnalist.do?show_ID="+dto.getShow_ID();
	}
	//�Ǹ��� ��ۼ���
	@RequestMapping("/marketer_quest_updateForm.do")
	public String marketerQnaUpdate(HttpServletRequest req,@RequestParam int qnanum, @RequestParam int show_ID) {
		QuestDTO dto = showMapper.getQuest(qnanum);
		req.setAttribute("getQuest",dto);
		req.setAttribute("show_ID", show_ID);
		return "show/qnaAnswerUpdateForm";
	}
	@RequestMapping("/marketer_quest_updateForm_ok.do")
	public String marketerUpdateOk(QuestDTO dto) {
		int res = showMapper.reContent(dto);
		return "redirect:/musical_qnalist.do?show_ID="+dto.getShow_ID();
	}
	//�Ǹ��� ��ۻ���
	@RequestMapping("/marketer_quest_delete.do")
	public String deleteqna(HttpServletRequest req,@RequestParam int qnanum, @RequestParam int show_ID) {
		QuestDTO dto = showMapper.getQuest(qnanum);
		dto.setQna_reContent(" ");
		int res = showMapper.reContent(dto);
		return "redirect:/musical_qnalist.do?show_ID="+dto.getShow_ID();
	}
	
	
	
}
