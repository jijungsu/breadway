<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- showmanage_seatdetail.jsp -->  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>�¼� ����</title>
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
	<br>
	<br>
	<div align = "center">
		<div align = "center" style="width:70%">
		<table border = "1"class="w3-table w3-striped w3-border">
			<tr>
				<th align = "center">�¼� ��ȣ</th>
				<td align = "center">${detailist.seat_Number}</td>
			</tr>
			<tr>
				<th align = "center">�¼� ����</th>
				<td align = "center">${detailist.seat_Price}</td>
			</tr>
			<tr>
				<th align = "center">�¼� ����</th>
				<td align = "center">${detailist.seat_Discount}%</td>
			</tr>
			<tr>
				<th align = "center">�� �̸�</th>
				<td align = "center">${detailist.consumer_Name}</td>
			</tr>
			<tr>
				<th align = "center">��ȭ ��ȣ</th>
				<td align = "center">${detailist.consumer_Phone}</td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>