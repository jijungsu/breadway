<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ ������ ���� �˻�"></c:param>
</c:import>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
<style>
	.w3-lobster {
		 font-family: "Lobster", serif;
	}
	.w3-button {width:150px;}
</style>
<div align="center">
	<br>
		<div class="w3-container w3-lobster">
		  <p class="w3-xxxlarge">Consumer Search Page</p>
		  <p class="w3-xxlarge">Search Result</p>
		</div>
	<br>
	<c:choose>
		<c:when test="${empty searchList}">
				<div class="w3-container w3-lobster">
				<p class="w3-xxlarge">Consumer Search Failed</p>
				<br>
				<p class="w3-xxlarge"><a href = "javascript:history.back();">Back</a></p>
			</div>
		</c:when>
		<c:otherwise>
			<table border = "1" style="width:50%" class="w3-table w3-striped w3-bordered">
			<tr>
				<td align = "center">ȸ����</td>
				<td align = "center">ȸ�� ���̵�</td>
				<td align = "center">�̸���</td>
				<td align = "center">��ȭ��ȣ</td>
				<td align = "center">���� | ����</td><!-- ������ ����â���� �̵��ϰ� ������ �˶� â �� ó�� -->
			</tr>
			<c:forEach var = "dto" items = "${searchList}">
				<tr>
					<td align="center">${dto.consumer_Name}</td>
					<td align="center">${dto.consumer_ID}</td>
					<td align="center">${dto.consumer_Email}</td>
					<td align="center">${dto.consumer_Phone}</td>
					<td align="center">
						<a href = "managerconsumer_update.do?uid=${dto.consumer_UID}">����</a>|
						<a href = "managerconsumer_delete.do?uid=${dto.consumer_UID}">����</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		</c:otherwise>
	</c:choose>
</div>
