<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- index.jsp -->
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ ����"></c:param>
</c:import>
<html>
<head>
	<title>Manager Page</title>
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
		  <p class="w3-xxxlarge">Manager Page</p>
		</div>
		<br>
		<table border = "0" width = "200" heignt = "200">
			<tr>
				<td><input type = "button" class="w3-button w3-dark-grey" title="�Ǹ����� ���� �����Դϴ�.�Ǹ����� ��û�� �޴� �۾� �� ���� ���� ���� ���� �۾��� �����մϴ�." style="width:200pt;height:150pt;" value = "�Ǹ��� ����" onclick = "location ='managermarketer_index.do'"></td>
				<td>&nbsp;&nbsp;</td>
				<td><input type = "button" class="w3-button w3-dark-grey" title="�������� ���� �����Դϴ� �������� ���� ���� ���� ���� ���� �۾��� �����մϴ�." style="width:200pt;height:150pt;" value = "ȸ�� ����" onclick = "location ='managerconsumer_index.do'"></td>
				<td>&nbsp;&nbsp;</td>
				<td><input type = "button" class="w3-button w3-dark-grey" title="���ֹ������������� �۾����� �����մϴ�." style="width:200pt;height:150pt;" value = "FAQ" onclick = "location ='managerfaq_main.do'"></td>
				<td>&nbsp;&nbsp;</td>
				<td><input type = "button" class="w3-button w3-dark-grey" title="1:1���ǿ� ���� �۾����� �����մϴ�." style="width:200pt;height:150pt;" value = "1 : 1 ����" onclick = "location ='managerinquiry_main.do'"></td>
				<td>&nbsp;&nbsp;</td>
				<td><input type = "button" class="w3-button w3-dark-grey" title="�������� ���� ��ü���� �۾����� �����մϴ�.(���� ����,�¼� ����,������ ����)" style="width:200pt;height:150pt;" value = "���� ����" onclick = "location ='showmanage_main.do'"></td>
			</tr>
		</table>
	</div>
</body>
</html>