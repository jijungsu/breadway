<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������  �Ǹ��� ���� ����"></c:param>
</c:import>
<!-- marketermanage_update.jsp -->
<html>
<head>
<title>�Ǹ��� ���� ������</title>
		<script type="text/javascript">
			function check(){
				if (f.marketer_Name.value==""){
					alert("�Ǹ��� ���� �Է��� �ּ���!!")
					f.marketer_Name.focus()
					return
				}
				if (f.marketer_ID.value==""){
					alert("�Ǹ��� ���̵� �Է��� �ּ���!!")
					f.marketer_ID.focus()
					return
				}
				if (f.marketer_Password.value==""){
					alert("�Ǹ��� ��й�ȣ�� �Է��� �ּ���!!")
					f.marketer_Password.focus()
					return
				}
				if (f.marketer_Email.value==""){
					alert("�Ǹ��� �̸����� �Է��� �ּ���!!")
					f.marketer_Email.focus()
					return
				}
				if (f.marketer_Phone.value==""){
					alert("�Ǹ��� ��ȭ��ȣ�� �Է��� �ּ���!!")
					f.marketer_Phone.focus()
					return
				}
				document.f.submit()
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
</head>
<body>
	<div align = "center">
	<br>
		<div class="w3-container w3-lobster">
		  <p class="w3-xxlarge">Marketer Update Page</p>
		</div>
	<br>
	<div class="w3-container">
	<form name = "f" action = "managermarketer_update_ok.do" method = "post">
		<input type="hidden" name="marketer_UID" value="${getMarketer.marketer_UID}"/>
		<table border = "1" style="width:50%" class="w3-table w3-striped w3-bordered">
			<tr>
				<td align="center">�Ǹ��ڸ�</td>
				<td align="center"><input class="w3-input w3-border w3-round-large" type = "text" name = "marketer_Name" value = "${getMarketer.marketer_Name}" maxlength='20'></td>
			</tr>
			<tr>
				<td align="center">�Ǹ��� ���̵�</td>
				<td align="center">
					<input class="w3-input w3-border w3-round-large" type = "text" name = "marketer_ID" value = "${getMarketer.marketer_ID}" maxlength='20'>
				</td>
			</tr>
			<tr>
				<td align="center">�Ǹ��� ��й�ȣ</td>
				<td align="center"><input class="w3-input w3-border w3-round-large" type = "text" name = "marketer_Password" value = "${getMarketer.marketer_Password}" maxlength='20'></td>
			</tr>
			<tr>
				<td align="center">�Ǹ��� �̸���</td>
				<td align="center"><input class="w3-input w3-border w3-round-large" type = "text" name = "marketer_Email" value = "${getMarketer.marketer_Email}" maxlength='30'></td>
			</tr>
			<tr>
				<td align="center">�Ǹ��� ��ȭ��ȣ</td>
				<td align="center"><input class="w3-input w3-border w3-round-large" type = "text" name = "marketer_Phone" value = "${getMarketer.marketer_Phone}" maxlength='12'></td>
			</tr>
			<tr>
				<td colspan="2" align = "center">
				<div align = "center">
					<input class="w3-button w3-dark-grey" type = "button" value = "����" onclick = "javascript:check();">
					<input class="w3-button w3-dark-grey" type = "reset" value = "�ٽ� �ۼ�">
				</div>
				</td>
			</tr>
		</table>
	</form>
	</div>	
	</div>
</body>
</html>