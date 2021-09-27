package com.musical.breadway.controller.user;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.mapper.user.UserConsumerMapper;
import com.musical.breadway.mapper.user.UserReserveMapper;

@Controller
public class UserMyInfoController {
	
	HttpSession session;

	@Autowired UserReserveMapper reserveMapper;
	
		//���� ���ų��� ����Ʈ �����ֱ�
		@RequestMapping("/musical_myBuyPage.do")
		public String MyReservePage(HttpServletRequest req) {
			session = req.getSession();
			if(session.getAttribute("consumer") == null ){
				String msg = "�α����� ���� ���ּ���.";
				String url="login.do";
						req.setAttribute("msg", msg);
						req.setAttribute("url", url);
						return "message";
				}

			ConsumerDTO dto = (ConsumerDTO)session.getAttribute("consumer");
			List<Map<String, String>> reserveList = reserveMapper.getReserveList(dto.getConsumer_UID());
			System.out.println("reserveList:"+reserveList);
			req.setAttribute("reserveList", reserveList);
			return "musical/myBuyPage";
		}
		
		//���� ���� ��� ���� ����Ʈ �����ֱ�
		@RequestMapping("/musical_myCancelPage.do")
		public String MyReserveCancelPage(HttpServletRequest req) {
			session = req.getSession();
			if(session.getAttribute("consumer") == null ){
				String msg = "�α����� ���� ���ּ���.";
				String url="login.do";
						req.setAttribute("msg", msg);
						req.setAttribute("url", url);
						return "message";}

			ConsumerDTO dto = (ConsumerDTO)session.getAttribute("consumer");
			System.out.println("controller consumer_UID:"+dto.getConsumer_UID());
			List<Map<String, String>> reserveCancelList = reserveMapper.getReserveCancelList(dto.getConsumer_UID());
			System.out.println(reserveCancelList);
			req.setAttribute("reserveCancelList", reserveCancelList);
			return "musical/myCancelPage";
		}

	//���� ������ ������ �󼼳���
		@RequestMapping("/musical_musicalInfo.do")
		public String MyReserveInfoPage(HttpServletRequest req) {
			session = req.getSession();
			if(session.getAttribute("consumer") == null ){
				String msg = "�α����� ���� ���ּ���.";
				String url="login.do";
						req.setAttribute("msg", msg);
						req.setAttribute("url", url);
						return "message";}
			int order_num = Integer.parseInt(req.getParameter("order_Num"));
			List<Map<String, String>> reserveShow = reserveMapper.getReserveShow(order_num);
			System.out.println("������ �� : " + reserveShow);
			req.setAttribute("show", reserveShow);
			return "musical/musicalInfo";
		}
		
		//���� ����� ������ �󼼳���
		@RequestMapping("/musical_musicalCancelInfo.do")
		public String MyReserveCancelInfoPage(HttpServletRequest req) throws ParseException {
			session = req.getSession();
			if(session.getAttribute("consumer") == null ){
				String msg = "�α����� ���� ���ּ���.";
				String url="login.do";
						req.setAttribute("msg", msg);
						req.setAttribute("url", url);
						return "message";}
				int order_num = Integer.parseInt(req.getParameter("order_Num"));
				System.out.println("�󼼺��� �������� �Ѿ�� order_num : " + order_num);
				List<Map<String, String>> reserveShow = reserveMapper.getReserveCancelShow(order_num);
				System.out.println("������ �� : " + reserveShow);
				req.setAttribute("show", reserveShow);
				//������¥�� ���� ��¥ ���� ���
				int MILLI_SECONDS_PER_DAY = 24 * 60 * 60 * 1000;
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date startDate = sdf.parse(reserveShow.get(0).get("RESERVE_CANCEL_DATE"));
				Date endDate = sdf.parse(reserveShow.get(0).get("SCHEDULE_DATE"));
				long difference = (endDate.getTime() - startDate.getTime()) / MILLI_SECONDS_PER_DAY;
				System.out.println(difference);
				req.setAttribute("difference", difference);
				int percent;
				if(difference > 29) {
					percent = 100; //30�����ĺ��� ����� ����
					req.setAttribute("percent", percent);
				} else if(6 < difference &&  difference< 30) {
					percent = 90; //7�������� 30�� �������� 90���� ȯ��
					req.setAttribute("percent", percent);
				}	else if(3 < difference && difference < 7) {
					percent =80; //6�� ������ 4���������� 80���� ȯ��
					req.setAttribute("percent", percent);
				} else if(0<difference  && difference < 4) {
					percent =60; //3�� ������ �Ϸ��������� 60���� ȯ��
					req.setAttribute("percent", percent);
				}
				return "musical/MyCancelInfoPage";
		}
		
		//������ ���� ��ҷ� �̵��ϱ�
		@RequestMapping("/musical_reserveCancel.do")
		public String ReserveCancel(HttpServletRequest req) throws ParseException {
			session = req.getSession();
			if(session.getAttribute("consumer") == null ){
				String msg = "�α����� ���� ���ּ���.";
				String url="login.do";
						req.setAttribute("msg", msg);
						req.setAttribute("url", url);
						return "message";}
			String order_num = req.getParameter("order_Num");
			System.out.println("order_num�� : " + order_num);
			List<Map<String, String>> list = reserveMapper.getReserveData(Integer.parseInt(order_num));
			System.out.println(String.valueOf(list.get(0).get("ORDER_NUM")));
			List<Map<String, String>> reserveShow = reserveMapper.getReserveShow(Integer.parseInt(String.valueOf(list.get(0).get("ORDER_NUM"))));
			System.out.println("������ �� : " + reserveShow);
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(date);
			System.out.println(today);
			req.setAttribute("today", today);
			System.out.println(reserveShow.get(0).get("SCHEDULE_DATE"));
		
			//������¥�� ���� ��¥ ���� ���
			int MILLI_SECONDS_PER_DAY = 24 * 60 * 60 * 1000;
			String inputStartDate = today;
			Date startDate = sdf.parse(inputStartDate);
			Date endDate = sdf.parse(reserveShow.get(0).get("SCHEDULE_DATE"));
			long difference = (endDate.getTime() - startDate.getTime()) / MILLI_SECONDS_PER_DAY;
			System.out.println(difference);
			req.setAttribute("difference", difference);
			int percent;
			if(difference > 9) {
				percent = 100; //10�����ĺ��� ����� ����
				req.setAttribute("percent", percent);
			} else if(6 < difference &&  difference< 10) {
				percent = 90; //9�������� 7�� �������� 90���� ȯ��
				req.setAttribute("percent", percent);
			}	else if(2 < difference && difference < 7) {
				percent =80; //6�� ������ 3���������� 80���� ȯ��
				req.setAttribute("percent", percent);
			} else if(0<difference  && difference < 3) {
				percent =70; //2�� ������ �Ϸ��������� 70���� ȯ��
				req.setAttribute("percent", percent);
			}
			System.out.println(reserveShow);
			req.setAttribute("reserveData", reserveShow);
			return "musical/reserveCancelPage";
		}
		
		@RequestMapping("/musical_reserveCancelOk.do")
		public String ReserveCancelOk(HttpServletRequest req) {
			session = req.getSession();
			if(session.getAttribute("consumer") == null ){
				String msg = "�α����� ���� ���ּ���.";
				String url="login.do";
						req.setAttribute("msg", msg);
						req.setAttribute("url", url);
						return "message";}
			String order_num = req.getParameter("order_Num");
			String cancelPrice = req.getParameter("cancelPrice");
			System.out.println("ȯ�ұݾ�: " + cancelPrice);
			System.out.println("���� �� : " + order_num);
			List<Map<String, String>> list = reserveMapper.getReserveData(Integer.parseInt(order_num));
			System.out.println("��Ʈid : " + String.valueOf(list.get(0).get("SEAT_ID")));
			for(Map<String, String> num : list) {
			int res1 = reserveMapper.reserveCancel(Integer.parseInt(String.valueOf(num.get("ORDER_NUM"))));
			int res2 = reserveMapper.deleteSeat(Integer.parseInt(String.valueOf(num.get("SEAT_ID"))));
			}
			String msg = "���Ÿ� ����Ͽ����ϴ�.";
			String url="musical_myBuyPage.do";
					req.setAttribute("msg", msg);
					req.setAttribute("url", url);
					return "message";
		}
		
		
}
