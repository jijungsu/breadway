package com.musical.breadway.controller.marketer;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class marketerInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception{
		HttpSession ses = req.getSession();
		System.out.println("������ ���ͼ��� �Դ� ��~");
		if(ses.getAttribute("marketer") == null){
			//resp.setContentType("text/html; charset=UTF-8");
			//PrintWriter out = resp.getWriter();
			//out.println("<script>alert('�α��� ���� ���ּ���!'); location.href='login.do';</script>");
			//out.flush();
			
			resp.sendRedirect("login.do");
		    return false;
		}
		return true;
	}
	
	
}
