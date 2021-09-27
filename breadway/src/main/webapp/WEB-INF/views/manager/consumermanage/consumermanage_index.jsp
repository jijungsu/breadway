<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ ������ ���� ����"></c:param>
</c:import>
<!--consumermanage_index.jsp -->
<html>
<head>
	<title>ȸ�� ����</title>
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
			  <p class="w3-xxxlarge">Consumer Manage Page</p>
			</div>
		<br>
		<div class="w3-container w3-center" style="width:35%">
			<form action="managerconsumer_search.do" method="post" class="w3-container w3-card-4 w3-light-grey">
				<select name = "consumersearch">
					<option value = "consumer_Name">������ �̸�</option>
					<option value = "consumer_ID">������ ���̵�</option>
					<option value = "consumer_Phone">������ ��ȭ��ȣ</option>
				</select>
				���ð˻� :&nbsp;
				<input type="text" name = "consumerString" width="50%">&nbsp;&nbsp;
				<input class="w3-button w3-dark-grey" type="submit" value="�˻�">
			</form>
		<br>
		<br>
		</div>
		<div align = "center" style="width:50%">
		<table border = "1" class="w3-table w3-striped w3-border">
			<tr>
				<th align = "center">ȸ����</th>
				<th align = "center">ȸ�� ���̵�</th>
				<th align = "center">�̸���</th>
				<th align = "center">��ȭ��ȣ</th>
				<th align = "center">���</th><!-- ������ ����â���� �̵��ϰ� ������ �˶� â �� ó�� -->
			</tr>
			<c:if test = "${empty listConsumer}">
				<tr>
					<td colspan = "5">��ϵ� ������ �����ϴ�.</td><!-- ȸ������ �ߴ� �� -->
				</tr>
			</c:if>
			<c:forEach var = "dto" items = "${listConsumer}">
				<tr>
					<td align="center">${dto.consumer_Name}</td>
					<td align="center">${dto.consumer_ID}</td>
					<td align="center">${dto.consumer_Email}</td>
					<td align="center">${dto.consumer_Phone}</td>
					<td align="center">
						<a href = "managerconsumer_update.do?uid=${dto.consumer_UID}">����</a> |
						<a href = "managerconsumer_delete.do?uid=${dto.consumer_UID}">����</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<br>
		<div class = "w3-center">
		<div class="w3-bar">
			<c:if test="${rowCount>0}">
			<c:if test="${startPage>pageBlock}">
				<a href="managerconsumer_index.do?pageNum=${startPage-pageBlock}" class="w3-button w3-bar-item">&laquo;</a>
			</c:if>
			<c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
				<a href = "managerconsumer_index.do?pageNum=${i}" class="w3-button w3-bar-item">${i}</a>
			</c:forEach>
			<c:if test="${endPage<pageCount}">
				<a href = "managerconsumer_index.do?pageNum=${startPage + pageBlock}" class="w3-button w3-bar-item">&raquo;</a>
			</c:if>	
			</c:if>
		</div>
		</div>
	</div>
	</div>
</body>
</html>