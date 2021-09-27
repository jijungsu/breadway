<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
    <head>
    	<title>���ǳ�������Ʈ</title>
    </head>
    <body>
    <table border="1" align="center" width="800" height="650">

    	<tr align="center"  height="100" >
    	<td width="10%">
    	<h5><a href="musical_categoryPage.do?genre=action">�帣��</a></h5>
    	<h5><a href="musical_categoryPage_area.do">������</a></h5>
    	</td>
    	<td width="10%">
    	<h5><a href="musical_categoryPage_date.do">��¥��</a></h5>
    	</td>
    	<td>
    	<h1><a href="musical_mainPage.do">��ε����</a></h1>
    	</td>
    	<td width="20%">
    	<c:choose>
    		<c:when test="${sessionScope.consumer == null}">
    			<h5><a href="login.do">�α���</a></h5>
    			<h5><a href ="signup.do">ȸ������</a></h5>
    		</c:when> 
    		<c:otherwise>
    			<h5><a href="logout.do">�α׾ƿ�</a></h5>
    		</c:otherwise>
    	</c:choose>
    		<h5><a href="musical_loginCheck.do?root=consumer_mypage.do">����������</a>
    		<h5><a href="faq_main.do">������</a></h5>
    	</td>
    	
    	</tr>
    	
    	<tr>
    	<td colspan="2" rowspan="2" valign="top">
    		<ul>
    			<li><a href="musical_myInfo.do">����������</a></li>
    			<li><a href="musical_myBuyPage.do">���ų���Ȯ��</a></li>
    			<li><a href="musical_myCancelPage.do">������ҳ���Ȯ��</a></li>
    			<li><a href="inquiry_myInquiry.do">���ǳ���Ȯ��</a></li>
    		</ul>
    	</td>
    	
    	
    	<th colspan="4" valign="top" align="center">���ǳ����󼼺���<br>
		<table border="1" width="600">
			<tr> 
				<th bgcolor="yellow" width="20%">�۹�ȣ</th>
				<td align="center" width="30%">${getInquiry.num}</td>
				<th bgcolor="yellow" width="20%">�ۼ���</th>
				<td align="center" width="30%">${getInquiry.name}</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">�̸���</th>
				<td align="center" width="30%">${getInquiry.email}</td>
				<th bgcolor="yellow" width="20%">�ۼ���</th>
				<td align="center" width="30%">${getInquiry.inqdate}</td>
			</tr>
	<tr>
		<th bgcolor="yellow" width="20%">������</th>
		<td width="80%" colspan="3">${getInquiry.subject}</td>
	</tr>
	<tr>
		<th bgcolor="yellow" width="20%">���ǳ���</th>
		<td width="80%" colspan="3"><pre>${getInquiry.content}</pre></td>
	</tr>
	<tr>
		<th bgcolor="yellow" width="20%" align="left" colspan="4">�亯����</th>
		<c:choose>
			<c:when test="${empty getInquiryAnswer}"  >
			<tr>
			<td colspan="4" width="80%" valign="top" colspan="3"  height="100"><pre>�亯���Դϴ�. ��ٷ��ּ���.</pre></td>
			</tr>
			</c:when>
			<c:otherwise>
			<tr>
			<td colspan="4" width="80%" valign="top"  colspan="3"  height="100"><pre>${getInquiryAnswer.content}</pre></td>
			</tr>
			</c:otherwise>
		</c:choose>
		
	</tr>
	<tr bgcolor="yellow" >
		<td align="right" colspan="4" align="center">

			<input type="button" value="�ۼ���"
				onclick="window.location='inquiry_updateForm.do?num=${getInquiry.num}'">
				&nbsp;&nbsp;&nbsp;
			<input type="button" value="�ۻ���" 
				onclick="window.location='inquiry_delete.do?num=${getInquiry.num}'">
				&nbsp;&nbsp;&nbsp;
			<input type="button" value="�۸��" onclick="window.location='inquiry_myInquiry.do'">
		</td>
	</tr>
</table>

 
    	</th>
    	</tr>	
    </table>
    </body>