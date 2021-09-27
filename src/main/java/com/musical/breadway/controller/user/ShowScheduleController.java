package com.musical.breadway.controller.user;

import java.text.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.dto.ScheduleDTO2;
import com.musical.breadway.dto.Venue_SeatsDTO;
import com.musical.breadway.mapper.user.UserScheduleMapper;
import com.musical.breadway.mapper.user.SeatMapper;

@Controller
public class ShowScheduleController {
	@Autowired
	UserScheduleMapper scheduleMapper;
	@Autowired
	SeatMapper seatMapper;
	
	private Calendar cal = Calendar.getInstance();
	
	@RequestMapping(value="/show_calendar.do", method={RequestMethod.GET, RequestMethod.POST})
	public String moveShowSchedulePage(HttpServletRequest req,
										@RequestParam(value="month", defaultValue="first") String month_param,
										@RequestParam(value="last_date") String last_param,
										@RequestParam(value="theatre_id") int theatre_id) {		
		int show_id = Integer.parseInt(req.getParameter("show_id"));
		int current_month = getCurrentMonth();
		int last_month = getLastMonth(last_param);		
		int month = getMonth(month_param);
		int year = cal.get(Calendar.YEAR);
		int venue_seat_qty = getVenueSeatQty(theatre_id);
		
		HttpSession session = req.getSession();
		ConsumerDTO consumer = (ConsumerDTO) session.getAttribute("consumer");
		
		if(consumer==null) {
			return "redirect:login.do";
		}
		
		Map<Integer, List<ScheduleDTO2>> days = makeShowScheduleCalendar(year, month, show_id);

		req.setAttribute("month", month+1);
		req.setAttribute("year", year);
		req.setAttribute("days", days);
		//���� ������ ��ȸ�ϰԲ� ���� �ް� ���� ������ �� req�� �����ֱ�
		req.setAttribute("currentMonth", current_month);
		req.setAttribute("lastMonth", last_month);
		req.setAttribute("venue_seat_qty", venue_seat_qty);
		
		return "show/schedule";
	}
	
	private Map<Integer, List<ScheduleDTO2>> makeShowScheduleCalendar(int year, int month, int show_id) {		
		cal.set(year, month, 1);
		int first_day = cal.get(Calendar.DAY_OF_WEEK);
		int last_day = cal.getActualMaximum(Calendar.DAY_OF_MONTH);		
		String start_date = getDateFormat("start");

		cal.set(year, month, last_day);
		int last_week = cal.get(Calendar.WEEK_OF_MONTH);		
		String end_date = getDateFormat("end");
		
		List<ScheduleDTO2> schedule = scheduleMapper.findSchedule(start_date, end_date, show_id);		
		Map<Integer, List<ScheduleDTO2>> days = new TreeMap<Integer, List<ScheduleDTO2>>();
		
		//��¥���� ������ �����Ͱ� �ִ��� ��Ƴ���.
		for(int i=1; i<=(last_week*7); i++) {
			if(first_day > i || (last_day+first_day) <= i) {
        		days.put(i-(first_day-1), null);
        	}else {
        		addScheduleOnDate(schedule, days, i-(first_day-1));
        	}
		}
		
		return days;
	}
	
	//��¥���� ������ ��ȸ �� ������ ��Ƴ���
	private void addScheduleOnDate(List<ScheduleDTO2> schedule,
									Map<Integer, List<ScheduleDTO2>> days, int day) {
		List<ScheduleDTO2> sList= new ArrayList<ScheduleDTO2>();
        for(ScheduleDTO2 list : schedule) { 
        	int getDay = list.getSchedule_date().toLocalDate().getDayOfMonth();
        	if(getDay == day) {
        		sList.add(list);
        	}       	
		}
        
        days.put(day, sList); 
	}
	
	//����Ŭ �� ��¥ ���� ��ȸ ������ day �Ű����� �߰�
	private String getDateFormat(String day) {
		SimpleDateFormat month_format = new SimpleDateFormat("yyyy-MM");
		SimpleDateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");
		
		String current_date = month_format.format(System.currentTimeMillis());
		String cal_date = month_format.format(cal.getTime());		
		String date = null;	
		
		//�޷� ��¥�� �ý��� ��¥�� ���� ��� ���� ��¥����
		if(current_date.equals(cal_date) && day.equals("start")) {
			date = date_format.format(System.currentTimeMillis());
		}else {
			date = date_format.format(cal.getTime());
		}
		
		return date;
	}
	
	//�̹��� ��������
	private int getCurrentMonth() {
		SimpleDateFormat month_format = new SimpleDateFormat("MM");
		String month_str = month_format.format(System.currentTimeMillis());
		int month = Integer.parseInt(month_str);

		return month;
	}
	
	//������ ���� �� ��������
	private int getLastMonth(String last_param) {
		Date date;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(last_param);
			String date_str = new SimpleDateFormat("MM").format(date);
			int month = Integer.parseInt(date_str);

			return month;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return 0;
	}
	
	private int getMonth(String month) {
		if(month.equals("next")) {
			cal.add(Calendar.MONTH, 1);
		}else if(month.equals("last")) {
			cal.add(Calendar.MONTH, -1);
		}else {
			cal.set(Calendar.MONTH , getCurrentMonth()-1);
		}
		
		return cal.get(Calendar.MONTH);
	}
	
	//����ó���� ���� ������ ��Ʈ �� ��������
	private int getVenueSeatQty(int theatre_id) {
		int qty = 0;
		
		List<Venue_SeatsDTO> seats = seatMapper.findVenueSeatQty(theatre_id);
		for(Venue_SeatsDTO dto : seats) {
			qty += dto.getSeat_Qty();
		}
		
		return qty;
	}
}
