package com.musical.breadway.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.musical.breadway.dto.ConsumerDTO;

public class ShowSeatInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		int show_id = Integer.parseInt(request.getParameter("show_id"));
		String schedule = request.getParameter("schedule");	
		String[] seat_num = request.getParameterValues("seatNum");
		String[] seat_key = new String[seat_num.length];
		for(int i=0; i<seat_num.length; i++) {
			seat_key[i] = schedule + seat_num[i];
			
			//�ش� �¼��� �̹� ������ ���� ������ �ߴ��� üũ
			if(ShowSeatStatusManager.getInstance().checkCurrentStatusOfSeat(seat_key[i])) {
				response.sendRedirect(request.getContextPath() + "/show_seats.do?schedule=" + schedule + "&msg=select");
				return false;
				}
			}
		
		//��Ʈ ���� ��� �ǿ� ������ ���� session �߰�	
		HttpSession session = request.getSession();
		ConsumerDTO consumer = (ConsumerDTO) session.getAttribute("consumer");
		String consumer_id = consumer.getConsumer_ID();
		
		for(int i=0; i<seat_num.length; i++) {
			//�ƹ��� �¼��� ���� ������ �� �¼� üũ ����� �����.	
			ShowSeatStatusManager.getInstance().setStatusOfSeat(seat_key[i], consumer_id);
			System.out.println(seat_key[i] + "��Ʈ�� ���� �Ͽ����ϴ�.");
		}	
		
		ShowSeatStatusManager.getInstance().setSeatSession(session, consumer_id);
		
		return true;
	}

}
