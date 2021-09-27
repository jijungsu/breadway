<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ FAQ�󼼺���"></c:param>
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
	<br>
	<div align = "center" style="width:50%">
		<table border="1" class="w3-table w3-striped w3-border">
			<tr>
				<th align="center" width="15%">Ű����</th>
				<td align="center" width="35%">${getFAQ.keyword}</td>
			</tr>
			<tr>
				<th align="center" width="15%">����</th>
				<td align="center" width="35%">${getFAQ.question}</td>
			</tr>
			<tr>
				<th align="center" width="15%">�亯</th>
				<td align="center" width="35%">${getFAQ.answer}</td>
			</tr>
			<tr>
				<td colspan = "2" align = "center">	
					<div align = "center">		
						<input class="w3-button w3-dark-grey" type="button" value="FAQ ���" onclick="window.location='managerfaq_main.do'">
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>