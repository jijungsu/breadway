<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ ���庰 ���� ����"></c:param>
</c:import>
<!-- showmanage_theatrerequest.jsp -->
<html>
<head>
<title>���庰 ���� ������ Ȯ��</title>
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
		<h2>���� ��ϵ� �����Դϴ�. ������ ������ Ȯ�� �� �� �ش� ������ Ŭ���� �ּ���</h2>
		<br>
		<div align = "center" style="width:70%">
		<table border = "1" class="w3-table w3-striped w3-border">
			<tr>
				<th width = "20%">������ �̸�</th>
				<th width = "40%">������ �ּ�</th>
				<th width = "10%">���� ���� Ȯ�� �� ���� �۾�</th>
			</tr>
			<c:forEach var = "theatredto" items = "${alltheatrerequestlist}">
				<tr>
					<td>${theatredto.theatre_name}</td>
					<td>${theatredto.theatre_address}</td>
					<td>
						<div align = "center">
							<input class="w3-button w3-dark-grey" type = "button" value = "���� Ȯ��" onclick = "location = 'showmanage_theatrerequestshowcontent.do?theatre_id=${theatredto.theatre_id}'">
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
</body>
</html>