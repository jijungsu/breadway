<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ �Ǹ��� ���� ����"></c:param>
</c:import>
<!-- marketermanage_index.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>�Ǹ��� ����</title>
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
		  <p class="w3-xxxlarge">Marketer Manage Page</p>
		</div>
		<br>
		<div class="w3-container w3-center" style="width:35%">
		<form action="managermarketer_search.do" method="post" class="w3-container w3-card-4 w3-light-grey">
			<select name = "marketersearch">
				<option value = "marketer_Name">�Ǹ��� �̸�</option>
				<option value = "marketer_ID">�Ǹ��� ���̵�</option>
				<option value = "marketer_Phone">�Ǹ��� ��ȭ��ȣ</option>
			</select>
			&nbsp;�˻� :&nbsp;
			<input name = "marketerString" width="50%" maxlength='50'>&nbsp;&nbsp;
			<input class="w3-button w3-dark-grey" type="submit" value="�˻�">
		</form>
		<br>
		<br>
		</div>
		<div align = "center" style="width:50%">
		<table border = "1" class="w3-table w3-striped w3-border">
			<tr>
				<th align = "center">�Ǹ��ڸ�</th>	
				<th align = "center">�Ǹ��� ���̵�</th>
				<th align = "center">�̸���</th>
				<th align = "center">��ȭ��ȣ</th>
				<th align = "center">��û</th><!-- ��û ���� ���� â�� �� ó�� -->
				<th align = "center">���</th><!-- ������ ����â���� �̵��ϰ� ������ �˶� â �� ó�� -->
			</tr>
			<c:if test = "${empty listMarketer}">
				<tr>
					<td colspan = "6">��ϵ� ������ �����ϴ�.</td>
				</tr>
			</c:if>
			<c:forEach var = "dto" items = "${listMarketer}">
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
		<br>
		<br>
		<div class = "w3-center">
			<div class="w3-bar">
				<c:if test="${rowCount>0}">
				<c:if test="${startPage>pageBlock}">
					<a href="managermarketer_index.do?pageNum=${startPage-pageBlock}" class="w3-button w3-bar-item">&laquo;</a>
				</c:if>
				<c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
					<a href = "managermarketer_index.do?pageNum=${i}" class="w3-button w3-bar-item">${i}</a>
				</c:forEach>
				<c:if test="${endPage<pageCount}">
					<a href = "managermarketer_index.do?pageNum=${startPage + pageBlock}" class="w3-button w3-bar-item">&raquo;</a>
				</c:if>	
				</c:if>
			</div>
		</div>
	</div>
	</div>
</body>
</html>