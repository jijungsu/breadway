<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
         <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
    <head>
    	<title>FAQ���� ������</title>
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
    	<tr align="left">
    		<td  valign="top"  colspan="2">
    			<a href="faq_main.do">���ֹ�������</a>
    			<form name="f" action="faq_keyword.do" method="post">
    			<ul>	
    				<li><input type="submit" name="keyword" value="����" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="keyword" value="��ȸ" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
				</ul>
				</form>
    			<a href="musical_loginCheck.do?root=inquiry_writeForm.do">1:1�����ϱ�</a>
    		
    		</td>
    		<td valign="top" colspan="2" align="center">
    		<h2>${keyword}���� ��������Ʈ</h2>
				<table border="1"  width="600">
						<c:choose>
						<c:when test="${empty keyword_list}">
						<tr>
						<td colspan="2">
							��ϵ� FAQ�� �����ϴ�.
						</td>
						</tr>
						</c:when>
						<c:otherwise>
						<tr height="25">
							<td width="40">NO.</td>
							<td width="380">����</td>
							<td width="180">Ű����</td>
						<c:forEach var="dto" items="${keyword_list}" varStatus="status">
						
						<tr height="25">
							<td>${status.count}</td>
							<td><a href="faq_content.do?num=${dto.num}">${dto.question}</a></td>
							<td>${dto.keyword}</td>
						</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
		 		</table>
		 		<c:if test="${rowCount > 0}">
			<c:if test="${startPage > pageBlock}">
				<a href="faq_content.do?pageNum=${startPage-pageBlock}">[����]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="faq_main.do?pageNum=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="faq_content.do?pageNum=${startPage+pageBlock}">[����]</a>
			</c:if>
		</c:if>
    	</tr>
    		</td>
    	</tr>
    </table>
    </body>
