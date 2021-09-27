<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ 1:1���� �� �ۼ�"></c:param>
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
<!-- writeForm.jsp -->
<script type="text/javascript">
		function check(){
			if (f.name.value==""){
				alert("�̸��� �Է��� �ּ���!!")
				f.name.focus()
				return
				}
			if (f.email.value==""){
				alert("�̸����� �Է��� �ּ���!!")
				f.email.focus()
				return
			}
			if (f.subject.value==""){
				alert("������ �Է��� �ּ���!!")
				f.subject.focus()
				return
			}
			if (f.content.value==""){
				alert("������ �Է��� �ּ���!!")
				f.content.focus()
				return
			}
				document.f.submit()
			}
</script>
<div align="center">
	<br>
		<div class="w3-container w3-lobster">
		  <p class="w3-xxxlarge">1:1 Inquiry Input Page</p>
		</div>
	<br>
	<div align = "center" style="width:50%">
	<form name="f" action="managerinquiry_writePro.do" method="post" onsubmit="return check()">
		<input type="hidden" name="num" value="${num}" />
		<input type="hidden" name="re_level" value="${re_level}"/>
		<input type="hidden" name="re_group" value="${re_group}"/>
		<table border="1" class="w3-table w3-striped w3-border">
			<tr >
				<td colspan="2" align="center">���� �ۼ�</td>
			</tr>
			<tr>
				<td align="center" width="20%">�� �� ��</td>
				<td><input class="w3-input w3-border w3-round-large" type="text" name="name" class="box" maxlength='30'></td>
			</tr>
			<tr>
				<td align="center" width="20%">�� ��</td>
				<td><input class="w3-input w3-border w3-round-large" type="text" name="subject" size="40"maxlength='50'></td>
			</tr>
			<tr>
				<td align="center" width="20%">Email</td>
				<td><input class="w3-input w3-border w3-round-large" type="text" name="email" size="40" maxlength='30'></td>
			</tr>
			<tr>
				<td align="center" width="20%">�� ��</td>
				<td><textarea class="w3-input w3-border w3-round-large" rows="4" cols="50" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align = "center">
					<div align = "center">
						<input class="w3-button w3-dark-grey" type = "button" value = "����" onclick = "javascript:check();">
						<input class="w3-button w3-dark-grey" type = "reset" value = "�ٽ� �ۼ�">
					</div>	
					<!-- <a href="javascript:check()">[����]</a>
					<a href="#">[���]</a> -->
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>