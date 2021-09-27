<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ ����������"></c:param>
</c:import>
<!-- managermypage.jsp -->
<html>
<head>
<title>������ ����������</title>
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
		<div align = "center" style="width:50%">
		<table border="1" class="w3-table w3-striped w3-border">
			<tr>
				<th>������ ��</th>
				<td>${managerinfo.marketer_Name}</td>
			</tr>
			<tr>
				<th>������ ���̵�</th>
				<td>${managerinfo.marketer_ID}</td>
			</tr>
			<tr>
				<th>������ ��й�ȣ</th>
				<td>${managerinfo.marketer_Password}</td>
			</tr>
			<tr>
				<th>������ �̸���</th>
				<td>${managerinfo.marketer_Email}</td>
			</tr>
			<tr>
				<th>������ ��ȭ��ȣ</th>
				<td>${managerinfo.marketer_Phone}</td>
			</tr>
			<tr>
				<td colspan = "2">
				<div class= "w3-center">
					<input class="w3-button w3-dark-grey" type = "button" value = "������ ���� ����" onclick = "location = 'showmanage_managermypageupdate.do'">
				</div>
				</td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>