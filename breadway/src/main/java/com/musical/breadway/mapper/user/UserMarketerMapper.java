package com.musical.breadway.mapper.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.MailUtils;
import com.musical.breadway.dto.MarketerDTO;
import com.musical.breadway.dto.TempKey;

@Service
public class UserMarketerMapper {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private JavaMailSender mailSender;

	public boolean checkMarketer(String marketer_Name, String marketer_Phone) {
		java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
		map.put("marketer_Name",marketer_Name);
		map.put("marketer_Phone",marketer_Phone);
		MarketerDTO dto = sqlSession.selectOne("checkMarketer",map);
		if(dto == null) return false;
		else return true;
	}
	   public void insertMarketer(MarketerDTO dto)throws Exception {

		      String authkey = new TempKey().getKey(8, false);
		      dto.setAuthKey(authkey);
		      
		      sqlSession.insert("insertMarketer",dto);
		      
		      MailUtils sendMail = new MailUtils(mailSender);

		      sendMail.setSubject("[�극�����] ȸ������ �̸��� ����");
		      sendMail.setText(new StringBuffer().append("<h1>[�̸��� ����]</h1>")
		            .append("<p>�Ʒ� ��ũ�� Ŭ���Ͻø� �̸��� ������ �Ϸ�˴ϴ�.</p>")
		            .append("<a href='http://localhost:8081/breadway/marketer_joinConfirm.do?marketer_ID=")
		            .append(dto.getMarketer_ID())
		            .append("&marketer_Email=")
		            .append(dto.getMarketer_Email())
		            .append("&authkey=")
		            .append(authkey)
		            .append("' target='_blenk'>�̸��� ���� Ȯ��</a>")
		            .toString());
		      sendMail.setFrom("gkdlwjdtn55@naver.com", "�극����� ������");
		      sendMail.setTo(dto.getMarketer_Email());
		      sendMail.send();
		      
		   }
	public int marketerupdateStatus(MarketerDTO dto) {
		int status = sqlSession.update("marketerupdateStatus",dto);
		return status;
	}
	
	public int marketerIDCheck(String marketer_ID) {
		int res = sqlSession.selectOne("marketerIDCheck",marketer_ID);
		return res;
	}
}
