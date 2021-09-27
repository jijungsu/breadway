<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ FAQ����"></c:param>
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
		  <p class="w3-xxxlarge">Frequently Asked Questions</p>
		</div>
	<br>
<!-- 	<div class="w3-container w3-center" style="width:35%">
		<form action="managerfaq_keyword.do" method="post" class="w3-container w3-card-4 w3-light-grey">
			ã���ô� Ű���� :
			<input type="text" name = "keyword" width="50%">&nbsp;&nbsp;
			<input class="w3-button w3-dark-grey" type="submit" value="�˻�">
		</form>Ű���� �˻��ϸ� �ش� Ű���忡���� FAQ�� �߰Եȴ�
		��� FAQ�� ���� ����
		<br>
		<br>
	</div> -->
	<div align = "center" style="width:50%">
		<form action="managerfaq_keyword.do" method="post">
		<table class="w3-table w3-striped w3-border w3-center">
			<tr>
				<th colspan = "4" class="w3-center" >Ű���庰 ����</th>
			</tr>
			<tr>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "����"></th>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "���"></th>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "��������"></th>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "��������"></th>
			</tr>
			<tr>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "�������"></th>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "ȯ�ұ���"></th>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "��Ÿ"></th>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "1:1����"></th>
			</tr>
		</table>
		</form>
		<br>
		<table border="1" class="w3-table w3-striped w3-border">
			<tr>
				<th align = "right" colspan = "3"><input class="w3-button w3-dark-grey" type = "button" value = "FAQ�ۼ��ϱ�" onclick = "location = 'managerfaq_input.do'"></th>
			</tr>
			<tr>
				<th align = "center">Ű����</th>
				<th align = "center">**����**</th>
				<th align = "center">���</th>
			</tr>
			<c:if test="${empty faq_list}">
				<tr>
					<td colspan = "3">������ �����ϴ�.</td>
				</tr>	
			</c:if>
			<c:forEach var="dto" items="${faq_list}">
				<tr>
					<td align = "center">${dto.keyword}</td>
					<td align = "center"><a href="managerfaq_content.do?num=${dto.num}">${dto.question}</a></td>
					<td align = "center">
						<a href = "managerfaq_update.do?num=${dto.num}">����</a> |
						<a href = "managerfaq_delete.do?num=${dto.num}">����</a>
					</td>
				</tr>							
			</c:forEach>
		</table>
		<br>
		<br>
		<div class = "w3-center">
		<div class="w3-bar">
			<c:if test="${rowCount>0}">
				<c:if test="${endPage > pageCount}">
					<c:set var="endPage" value="${pageCount}"></c:set>
				</c:if>
				<c:if test="${startPage > pageBlock}">
					<a href="managerfaq_main.do?pageNum=${startPage - pageBlock}" class="w3-button w3-bar-item">&laquo;</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="managerfaq_main.do?pageNum=${i}" class="w3-button w3-bar-item">${i}</a>
				</c:forEach> 
				<c:if test="${endPage < pageCount}">
					<a href="managerfaq_main.do?pageNum=${startPage + pageBlock}" class="w3-button w3-bar-item">&raquo;</a>
				</c:if>
			</c:if>
		</div>
		</div>
	</div>
	
</div>