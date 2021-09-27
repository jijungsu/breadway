<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ ���庰 ���� �� ����"></c:param>
</c:import>
<!-- showmanage_theatrerequestshowcontent.jsp -->
<html>
<head>
<title>���� ���� ����Ǵ� ����</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
	<style>
		.w3-lobster {
		  font-family: "Lobster", serif;
		}
		.w3-button {width:150px;}
</style>
</head>
<body>
	<div align = "center">
		<br>
			<div class="w3-container w3-lobster">
			  <p class="w3-xxlarge">���� ���忡�� ����Ǵ� �����Դϴ� �� ������������ ���� ��û ���� ���� �� ������ �����մϴ�.</p>
			</div>
		<br>
		<c:choose>
			<c:when test = "${empty tshowlist}">
				<br>
				  <h3>���� �������� ���� ������ �����ϴ�.</p></h3>
				  <h2><a href = "javascript:history.back();">�ڷ� ����</a></h2>
			</c:when>
			<c:otherwise>
			<div align = "center" style="width:70%">
			<table border = "1" class="w3-table w3-striped w3-border">
				<tr>
					<th align = "center" width = "14%">���� ��</th>
					<th align = "center" width = "14%">���� ������</th>
					<th align = "center" width = "14%">���� �Ⱓ</th>
					<th align = "center" width = "14%">���� �ð�(���� Ÿ��)</th>
					<th align = "center" width = "14%">���� ���� ����</th>
				</tr>
				<c:forEach var = "tshowdto" items = "${tshowlist}">	
					<tr>
						<td align = "center">${tshowdto.show_name}</td>
						<td align = "center">${tshowdto.show_organizer}</td>
						<td align = "center">${fn:substring(tshowdto.startDate,0,10)}~${fn:substring(tshowdto.endDate,0,10)}</td>
						<td align = "center">${tshowdto.duration}</td>
						<c:choose>
							<c:when test = "${tshowdto.show_Status == 0}">
								<td align = "center">
									<div align = "center">
									<input class="w3-button w3-dark-grey" type = "button" value = "����" onclick = "location = 'showmanage_theatrerequestshowchoice.do?show_id=${tshowdto.show_ID}&mode=grant&theatre_id=${tshowdto.theatre_id}'">
									<input class="w3-button w3-dark-grey" type = "button" value = "����" onclick = "location = 'showmanage_theatrerequestshowchoice.do?show_id=${tshowdto.show_ID}&mode=deny&theatre_id=${tshowdto.theatre_id}'">
									<%-- <a href = "showmanage_theatrerequestshowchoice.do?show_id=${tshowdto.show_ID}&mode=grant&theatre_id=${tshowdto.theatre_id}">����</a> |
									<a href = "showmanage_theatrerequestshowchoice.do?show_id=${tshowdto.show_ID}&mode=deny&theatre_id=${tshowdto.theatre_id}">����</a> --%>
									</div>
								</td>
							</c:when>
							<c:otherwise>
								<td align = "center">��û �Ϸ�</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
			</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>