<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ �������� �˻�"></c:param>
</c:import>
<script type="text/javascript">
	function TheatreWindowOpen(theatre_id){
		var win = window.open("showmanage_theatrecontent.do?theatre_id="+theatre_id,"���� ��� ����", "width=700, height=500, resizable=no, left = 300, top = 300, scrollbars=no");
	}	
</script>
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
			<p class="w3-xxxlarge">Show Search Page</p>
			<p class="w3-xxlarge">Search Result</p>
		</div>
	<br>
	<c:choose>
		<c:when test="${empty search_list}">
			<div class="w3-container w3-lobster">
				<p class="w3-xxlarge">Show Search Failed</p>
				<br>
				<p class="w3-xxlarge"><a href = "javascript:history.back();">Back</a></p>
			</div>
		</c:when>
		<c:otherwise>
		<br>
		<br>
		<div align = "center" style="width:70%">
		<table border="1" class="w3-table w3-striped w3-border">
			<tr>
				<th align = "center">**������**</th>
				<th align = "center">������</th>
				<th align = "center">**���**</th>
				<th align = "center">�Ⱓ</th>
				<th align = "center">�帣</th>
			</tr>
			<c:forEach var="dto" items="${search_list}">
				<tr>
					<td align = "center"><a href="show_content.do?show_id=${dto.show_ID}">${dto.show_name}</a></td>
					<td align = "center">${dto.show_organizer}</td>
					<td align="center"><a href = "javascript:TheatreWindowOpen(${dto.theatre_id})">${dto.theatre_name}</a></td>
					<td align = "center">${dto.startDate}~${dto.endDate}</td>
					<td align = "center">${dto.genre}</td>
				</tr>							
			</c:forEach>
		</table>
		</div>
		</c:otherwise>
	</c:choose>
</div>
