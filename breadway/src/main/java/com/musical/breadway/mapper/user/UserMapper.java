package com.musical.breadway.mapper.user;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.dto.MailUtils;
import com.musical.breadway.dto.MarketerDTO;


//user���� �α����Ҷ� ���񽺸� �����ϴ� Ŭ����
@Service
public class UserMapper {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private JavaMailSender mailSender;
	
	//�α���
		public ConsumerDTO selectConsumer(ConsumerDTO dto) {
			ConsumerDTO consumer = sqlSession.selectOne("consumerLogin",dto);
			return consumer;
		}
		public MarketerDTO selectMarketer(MarketerDTO dto) {
			MarketerDTO marketer = sqlSession.selectOne("marketerLogin",dto);
			return marketer;
		}	
	//�α׾ƿ�	
		public void logout(HttpSession session) {
			session.invalidate();		
		}
		
		public boolean CfindID(String consumer_Name,String consumer_Email)throws Exception{
			java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
			map.put("consumer_Name", consumer_Name);
			map.put("consumer_Email", consumer_Email);
		
			ConsumerDTO dto = sqlSession.selectOne("CfindID",map);
		
			if(dto == null) { 
				return false;
			}else{
			MailUtils sendMail = new MailUtils(mailSender);

			sendMail.setSubject("[�극�����] ���̵� ã�� ���");
			sendMail.setText(new StringBuffer().append("<h1>[���̵� ã�� ���]</h1>")
					.append("<p>")
					.append(dto.getConsumer_ID())
					.append("</p>")
					.append("<a href='http://localhost:8081/breadway/login.do?consumer_ID=")
					.append(dto.getConsumer_ID())
					.append("' target='_blenk'>�α����Ϸ� ����</a>")
					.toString());
			sendMail.setFrom("gkdlwjdtn55@naver.com", "�극����� ������");
			sendMail.setTo(dto.getConsumer_Email());
			sendMail.send();
			
			}	
			return true;
		}
		
		public boolean CfindPW(String consumer_Name,String consumer_ID,String consumer_Email)throws Exception{
		java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
				map.put("consumer_Name",consumer_Name);
				map.put("consumer_ID", consumer_ID);
				map.put("consumer_Email", consumer_Email);
				
				ConsumerDTO dto = sqlSession.selectOne("CfindPW",map);
				
				if(dto == null) {
					return false;
				}else {
				MailUtils sendMail = new MailUtils(mailSender);

				sendMail.setSubject("[�극�����] ��й�ȣ ã�� ���");
				sendMail.setText(new StringBuffer().append("<h1>[��й�ȣ ã�� ���]</h1>")
						.append("<p>")
						.append(dto.getConsumer_Password())
						.append("</p>")
						.append("<a href='http://localhost:8081/breadway/login.do?consumer_ID=")
						.append(dto.getConsumer_ID())
						.append("' target='_blenk'>�α����Ϸ� ����</a>")
						.toString());
				sendMail.setFrom("gkdlwjdtn55@naver.com", "�극����� ������");
				sendMail.setTo(dto.getConsumer_Email());
				sendMail.send();
				
				return true;
				
				}
		}
		
		public boolean MfindID(String marketer_Name,String marketer_Email)throws Exception{
			java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
			map.put("marketer_Name", marketer_Name);
			map.put("marketer_Email", marketer_Email);
			
			MarketerDTO dto = sqlSession.selectOne("MfindID",map);
			if(dto ==null) {
				return false;
			}else {
			MailUtils sendMail = new MailUtils(mailSender);

			sendMail.setSubject("[�극�����] ���̵� ã�� ���");
			sendMail.setText(new StringBuffer().append("<h1>[���̵� ã�� ���]</h1>")
					.append("<p>")
					.append(dto.getMarketer_ID())
					.append("</p>")
					.append("<a href='http://localhost:8081/breadway/login.do?marketer_ID=")
					.append(dto.getMarketer_ID())
					.append("' target='_blenk'>�α����Ϸ� ����</a>")
					.toString());
			sendMail.setFrom("breadway@naver.com", "�극����� ������");
			sendMail.setTo(dto.getMarketer_Email());
			sendMail.send();
			}
			return true;
		}
		
		public boolean MfindPW(String marketer_Name,String marketer_ID,String marketer_Email)throws Exception{
		java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
				map.put("marketer_Name",marketer_Name);
				map.put("marketer_ID", marketer_ID);
				map.put("marketer_Email", marketer_Email);
				
				MarketerDTO dto = sqlSession.selectOne("MfindPW",map);
				if(dto == null) {
					return false;
				}else {
				MailUtils sendMail = new MailUtils(mailSender);

				sendMail.setSubject("[�극�����] ��й�ȣ ã�� ���");
				sendMail.setText(new StringBuffer().append("<h1>[��й�ȣ ã�� ���]</h1>")
						.append("<p>")
						.append(dto.getMarketer_Password())
						.append("</p>")
						.append("<a href='http://localhost:8081/teamproject/login.do?marketer_ID=")
						.append(dto.getMarketer_ID())
						.append("' target='_blenk'>�α����Ϸ� ����</a>")
						.toString());
				sendMail.setFrom("breadway@naver.com", "�극����� ������");
				sendMail.setTo(dto.getMarketer_Email());
				sendMail.send();
				}
				return true;
		}
}