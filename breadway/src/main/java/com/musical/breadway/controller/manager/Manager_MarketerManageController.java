package com.musical.breadway.controller.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.musical.breadway.dto.MarketerDTO;
import com.musical.breadway.mapper.manager.Manager_MarketerManageMapper;


@Controller
public class Manager_MarketerManageController {
	
	@Autowired
	private Manager_MarketerManageMapper marketermanageMapper;
	
	
	@RequestMapping("/showmanage_managermypage.do")
	public ModelAndView managermypage(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "�α����� ���� ���ּ���.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		MarketerDTO dto = marketermanageMapper.ManagerMypageInfo();
		mav.setViewName("manager/managermypage");
		mav.addObject("managerinfo",dto);
		return mav;
	}
	
	@RequestMapping("/showmanage_managermypageupdate.do")
	public ModelAndView managermypageupdate(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		ModelAndView mav = new ModelAndView();
		if(ses.getAttribute("admin") == null){
	         String msg = "�α����� ���� ���ּ���.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		MarketerDTO dto = marketermanageMapper.ManagerMypageInfo();
		mav.setViewName("manager/managermypageupdate");
		mav.addObject("managerinfo",dto);
		return mav;
	}
	
	@RequestMapping("/showmanage_managermypageupdateok.do")
	public String managermypageupdateok(HttpServletRequest req,MarketerDTO dto) {
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "�α����� ���� ���ּ���.";
	         String url="login.do";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	         return "message";
		}
		String msg = "������ ������ ���������� �����Ǿ����ϴ�";
		String url = "showmanage_managermypageupdate.do";
		int update = marketermanageMapper.ManagerMypageInfoUpdate(dto);
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "manager/message";
	}
	
	@RequestMapping("/managermarketer_index.do")//���������������� �Ǹ��� ���� �������� �Ǹ��ڵ��� ����Ʈ�� ������ �̵�
	public String index(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "�α����� ���� ���ּ���.";
	         String url="login.do";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	         return "message";
		}
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum.trim().equals("")){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int rowCount = marketermanageMapper.ManagermarketergetCount();
		int number = rowCount - startRow + 1;
		if (endRow > rowCount) endRow = rowCount;
		List<MarketerDTO> list = marketermanageMapper.ManagerlistMarketer(String.valueOf(startRow),String.valueOf(endRow));
		int pageCount = rowCount / pageSize + (rowCount%pageSize == 0 ? 0 : 1);
		int pageBlock = 3;
		int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) endPage = pageCount;
		
		req.setAttribute("number", number);
		req.setAttribute("rowCount", rowCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("listMarketer", list);
		
		return "manager/marketermanage/marketermanage_index";
	}
	
	@RequestMapping("/managermarketer_search.do")
	public ModelAndView search(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "�α����� ���� ���ּ���.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String marketersearch = req.getParameter("marketersearch");
		String marketerString = req.getParameter("marketerString");
		List<MarketerDTO> list = marketermanageMapper.ManagersearchMarketer(marketersearch,marketerString);
		mav.setViewName("manager/marketermanage/marketermanage_search");
		mav.addObject("searchList", list);
		mav.addObject("marketersearch", marketersearch);
		mav.addObject("marketerString", marketerString);
		return mav;
	}
	
	
	@RequestMapping("/managermarketer_Statuscheck.do")
	public ModelAndView statuscheck(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "�α����� ���� ���ּ���.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String msg = "��û�� ���� �Ͻðڽ��ϱ�?";
		String url = "managermarketer_statuscheckOK.do";
		String uid = req.getParameter("managermarketer_uid");
		HttpSession session = req.getSession();
		session.setAttribute("managerstatuscheckmarketer_uid", uid);
		mav.setViewName("manager/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
	}
	
	@RequestMapping("/managermarketer_statuscheckOK.do")
	public String statuscheckOK(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "�α����� ���� ���ּ���.";
	         String url="login.do";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	         return "message";
		}
		HttpSession session = req.getSession();
		String uid = (String)session.getAttribute("managerstatuscheckmarketer_uid");
		System.out.println(uid);
		int res = marketermanageMapper.ManagerstatusCheck(Integer.parseInt(uid));
		return "redirect:managermarketer_index.do";
	}
	
	@RequestMapping("/managermarketer_update.do")
	public String update(HttpServletRequest req){//getmarketer()
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "�α����� ���� ���ּ���.";
	         String url="login.do";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	         return "message";
		}
		HttpSession session = req.getSession();
		Integer marketer_uid = (Integer)session.getAttribute("managermarketer_uid");
		String uid = req.getParameter("uid");
		if(marketer_uid != null) {
			MarketerDTO dto = marketermanageMapper.ManagergetMarketer(marketer_uid);
			req.setAttribute("getMarketer", dto);
			return "manager/marketermanage/marketermanage_update";//���� â���� �̵�
		}
		System.out.println(uid);
		MarketerDTO dto = marketermanageMapper.ManagergetMarketer(Integer.parseInt(uid));
		req.setAttribute("getMarketer", dto);
		return "manager/marketermanage/marketermanage_update";//���� â���� �̵�
	}
	
	@RequestMapping("/managermarketer_update_ok.do")
	public String updateok(MarketerDTO dto,HttpServletRequest req) {
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "�α����� ���� ���ּ���.";
	         String url="login.do";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	         return "message";
		}
		HttpSession session = req.getSession();
		String msg = null;
		String url = null;
		int res1 = marketermanageMapper.Managermarketeridcheck(dto.getMarketer_ID());
		if (res1 == 1) {
			msg = "�ߺ��Ǵ� ���̵� �Դϴ�. �ٽ� �Է��� �ּ���.";
			url = "managermarketer_update.do";
			session.setAttribute("managermarketer_uid", dto.getMarketer_UID());
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "manager/message";
		}
		int res2 = marketermanageMapper.ManagerupdateMarketer(dto);
		return "redirect:managermarketer_index.do";
	}
	
	@RequestMapping("/managermarketer_delete.do")
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "�α����� ���� ���ּ���.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String uid = req.getParameter("uid");
		int res = marketermanageMapper.ManagerdeleteMarketer(uid);
		String msg = "�����Ǿ����ϴ�.";
		String url = "managermarketer_index.do";
		mav.setViewName("manager/message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}

}
