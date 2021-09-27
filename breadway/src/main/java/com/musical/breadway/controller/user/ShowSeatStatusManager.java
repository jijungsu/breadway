package com.musical.breadway.controller.user;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class ShowSeatStatusManager implements HttpSessionBindingListener {
	private static ShowSeatStatusManager seat_mgr = null;

	private static Hashtable<String, String> storage = new Hashtable<String, String>();
	
	private ShowSeatStatusManager() {}	
	public static synchronized ShowSeatStatusManager getInstance() {
		if(seat_mgr==null) {
			seat_mgr = new ShowSeatStatusManager();
		}
		return seat_mgr;
	}	
	
	//�ش� �¼��� �̹� ������ ���� ������ �ߴ��� üũ
	public boolean checkCurrentStatusOfSeat(String seat_key) {
		return storage.containsKey(seat_key);
	}
	
	//�ش� �¼� üũ ����
	public void setStatusOfSeat(String seat_key, String user) {
		storage.put(seat_key, user);
	}
	
	//user session ����
	public void setSeatSession(HttpSession session, String user) {
		session.setAttribute(user, this);
	}
	
	//�ش� ������ session �ð��� �ʰ��ϰų� �ֹ� ���� ��ҽ� ��Ʈ ��� �����
	public void removeStatusOfSeat(String user) {
		 Enumeration<String> e = storage.keys();
		 
		 while (e.hasMoreElements()) {
			 String key = e.nextElement();
			 
			 if(storage.get(key).equals(user)) {
				 storage.remove(key);
			 }
		 }
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		System.out.println(event.getName() + "����");
	}
	
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		//�ش� ������ session �ð� �ʰ��� �ش� ������ ������ ��� �¼��� ������ ��Ұ� �ȴ�.
		System.out.println(event.getName() + "����");
		removeStatusOfSeat(event.getName());
	}
}
