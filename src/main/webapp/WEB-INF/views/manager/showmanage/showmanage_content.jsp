<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ ���� �󼼺���"></c:param>
</c:import>
<script type="text/javascript">
	function PosWindowOpen(show_ID){
		var win = window.open("PosterUpdate.do?id="+show_ID,"������ �̹��� ����", "width=500, height=300, resizable=no, left = 300, top = 300, scrollbars=no");
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
<br>
<br>
<div align="center">
	<br>
		<div class="w3-container w3-lobster">
		  <p class="w3-xxxlarge">Show Manage Content Page</p>
		  <p class="w3-xxlarge">${getShow.show_name}</p>
		</div>
	<br>
	<div align = "center" style="width:70%">
	<table border="1" class="w3-table w3-striped w3-border">
		<tr>
			<th width="20%" align="center">���� �̸�</th>
			<th width="50%" align="center">${getShow.show_name}</th>
		</tr>
		<tr>
			<td width="20%" align="center">���� ������</td>
			<td width="50%" align="center">${getShow.show_organizer}</td>
		</tr>
		<tr>
			<td width="20%" align="center">���</td>
			<td width="50%" align="center">${getShow.theatre_name}</td>
		</tr>
		<tr>
			<td width="20%" align="center">�Ⱓ</td>
			<td width="50%" align="center">${getShow.startDate}~${getShow.endDate}</td>
		</tr>
		<tr>
			<td width="20%" align="center">�帣</td>
			<td width="50%" align="center">${getShow.genre}</td>
		</tr>
		<tr>
			<td width="20%" align="center">���� ����</td>
			<td width="50%" align="center">${getShow.rate}</td>
		</tr>
		<tr>
			<td width="20%" align="center">���� �ð�</td>
			<td width="50%" align="center">${getShow.duration}��</td>
		</tr>
		<tr>
			<td width="20%" align="center">���� ����</td>
			<td width="50%" align="center">${getShow.detail}</td>
		</tr>
		<tr>
			<td width="20%" align="center">���� ����</td>
			<td width="50%" align="center">${getShow.notice}</td>
		</tr>
		<tr>
			<td width="20%" align="center">������ �̸�</td>
			<td width="50%" align="center">${getShow.posterName}&nbsp;
			<input type="button" value="������ ���� �ϱ�" onclick="javascript:PosWindowOpen(${getShow.show_ID})">
			</td>
		</tr>
		<tr>
			<td width="20%" align="center">���� ���� �ּ�</td>
			<td width="50%" align="center">${getShow.videoLink}</td>
		</tr>
		<tr>
			<td colspan = "2">
			<div align = "center">
				<input type = "button" value = "����" class="w3-button w3-dark-grey" onclick= "location = 'showmanage_updateForm.do?id=${getShow.show_ID}'">
				&nbsp;&nbsp;
				<input type = "button" value = "����" class="w3-button w3-dark-grey" onclick= "location = 'showmanage_main.do'">
			</div>
			</td>
		</tr>
	</table>
	</div>
</div>