package com.musical.breadway.mapper.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.dto.MailUtils;
import com.musical.breadway.dto.TempKey;
import org.springframework.mail.javamail.JavaMailSender;


@Service
public class UserConsumerMapper {
	
	
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	public ConsumerDTO CheckLogin(Map<String, String> params) {
		ConsumerDTO dto = sqlSession.selectOne("loginCheck", params);
		
			return dto;
	}
	

	public boolean checkConsumer(String consumer_Name, String consumer_Email) {
		java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
		map.put("consumer_Name",consumer_Name);
		map.put("consumer_Email",consumer_Email);
		ConsumerDTO dto = sqlSession.selectOne("checkConsumer",map);
		if(dto == null) return false;
		else return true;
	}
	
	public void insertConsumer(ConsumerDTO dto) throws Exception{
		
		String authkey = new TempKey().getKey(8, false);
		dto.setAuthKey(authkey);
		
		sqlSession.insert("insertConsumer",dto);
		
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("[�극�����] ȸ������ �̸��� ����");
		sendMail.setText(new StringBuffer().append("<h1>[�̸��� ����]</h1>")
				.append("<p>�Ʒ� ��ũ�� Ŭ���Ͻø� �̸��� ������ �Ϸ�˴ϴ�.</p>")
				.append("<a href='http://localhost:8081/breadway/joinConfirm.do?consumer_ID=")
				.append(dto.getConsumer_ID())
				.append("&consumer_Email=")
				.append(dto.getConsumer_Email())
				.append("&authkey=")
				.append(authkey)
				.append("' target='_blenk'>�̸��� ���� Ȯ��</a>")
				.toString());
		sendMail.setFrom("rgkdlwjdtn55@naver.com", "�극����� ������");
		sendMail.setTo(dto.getConsumer_Email());
		sendMail.send();
	}
	public int updateStatus(ConsumerDTO dto) {
		int status = sqlSession.update("updateStatus",dto);
		return status;
	}
	//���̵��ߺ�Ȯ��
	public int duplecateID(String consumer_ID) {
		int res = sqlSession.selectOne("ConsumerIDCheck",consumer_ID);
		return res;
	}
	//��й�ȣȮ��
	public boolean isPassword(int consumer_UID, String consumer_Password) {
		java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
		map.put("consumer_UID",String.valueOf(consumer_UID));
		map.put("consumer_Password",consumer_Password);
		ConsumerDTO dto = sqlSession.selectOne("isPassword",map);
		if(dto != null) return true;
		else return false;
	}
	public int deletePreCheck(int consumer_UID) {
		int res = sqlSession.selectOne("deletePreCheck",consumer_UID);
		return res;
	}
	//ȸ��Ż��
		public int deletConsumer(int consumer_UID,String consumer_Password) {
			if(!isPassword(consumer_UID,consumer_Password)) {
				return -1;
			}
			java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
			map.put("consumer_UID",String.valueOf(consumer_UID));
			map.put("consumer_Password",consumer_Password);
			int res = sqlSession.delete("deleteConsumer",map);
			return res;
		}
	//ȸ�����������Ҷ� ���������°�
	public ConsumerDTO editConsumer(int consumer_UID) {
		ConsumerDTO dto = sqlSession.selectOne("editConsumer",consumer_UID);
		return dto;
	}
	
	//ȸ����������
	public int updateConsumer(ConsumerDTO dto) {
		int res = sqlSession.update("updateConsumer",dto);
		return res;
	}


}
