<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>

    <head>
    	<title>�� ���� Ȯ��</title>
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
    	
    	
    	<th colspan="3" valign="top">����������
    		<ul>
    			<li align="left">�̸� : <input type="text" name="name" class="box" value="${consumerDTO.consumer_Name}" readOnly></li>
    			<li align="left">���̵� : <input type="text" name="name" class="box" value="${consumerDTO.consumer_ID}" readOnly></li>
    			<li align="left">�̸��� : <input type="text" name="name" class="box" value="${consumerDTO.consumer_Email}" readOnly></li>
    			<li align="left">��ȭ��ȣ : <input type="text" name="name" class="box" value="${consumerDTO.consumer_Phone}" readOnly></li>
    		</ul>
    		<a href= "consumer_edit.do">[�����Ϸ�����]</a>
    	</th>
    	</tr>	
    	
				
		
<%--     	<c:out value="${consumerDTO }"/> --%>
    	<%-- <c:set var="dto" value="${consumerDTO}">
    	
  		</c:set> --%>
    		
    		
    	
    	
    </table>
    </body>