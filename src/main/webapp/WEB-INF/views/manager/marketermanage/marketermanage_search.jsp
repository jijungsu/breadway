<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ �Ǹ��� ���� �˻�"></c:param>
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
		  <p class="w3-xxxlarge">Marketer Search Page</p>
		  <p class="w3-xxlarge">Search Result</p>
		</div>
	<br>
	<c:choose>
		<c:when test="${empty searchList}">
			<div class="w3-container w3-lobster">
				<p class="w3-xxlarge">Marketer Search Failed</p>
				<br>
				<p class="w3-xxlarge"><a href = "javascript:history.back();">Back</a></p>
			</div>
		</c:when>
		<c:otherwise>
			<table border = "1" style="width:50%" class="w3-table w3-striped w3-bordered">
			<tr>
				<td align = "center">�Ǹ��ڸ�</td>	
				<td align = "center">�Ǹ��� ���̵�</td>
				<td align = "center">�̸���</td>
				<td align = "center">��ȭ��ȣ</td>
				<td align = "center">��û</td><!-- ��û ���� ���� â�� �� ó�� -->
				<td align = "center">���� | ����</td><!-- ������ ����â���� �̵��ϰ� ������ �˶� â �� ó�� -->
			</tr>
			<c:forEach var = "dto" items = "${searchList}">
				<tr>
					<td align="center">${dto.marketer_Name}</td>
					<td align="center">${dto.marketer_ID}</td>
					<td align="center">${dto.marketer_Email}</td>
					<td align="center">${dto.marketer_Phone}</td>
					<c:choose>
						<c:when test = "${dto.marketer_Status == 0}">
							<td align="center"><a href = "managermarketer_Statuscheck.do?managermarketer_uid=${dto.marketer_UID}">��û</a></td>
						</c:when>
						<c:otherwise>
							<td align="center">�Ϸ�</td>
						</c:otherwise>
					</c:choose>
					<td align="center">
						<a href = "managermarketer_update.do?uid=${dto.marketer_UID}">����</a> |
						<a href = "managermarketer_delete.do?uid=${dto.marketer_UID}">����</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		</c:otherwise>
	</c:choose>
</div>
