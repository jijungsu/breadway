<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ ���� ���� ����"></c:param>
</c:import>
<script type="text/javascript">
		function check(){
			if (f.show_name.value==""){
				alert("���� �̸��� �Է��� �ּ���!!")
				f.show_name.focus()
				return
				}
			else if (f.show_organizer.value==""){
				alert("���� �����ڸ� �Է��� �ּ���!!")
				f.show_organizer.focus()
				return
			}
			else if (f.startDate.value==""){
				alert("���� ��¥�� �Է��� �ּ���!!")
				f.startDate.focus()
				return
			}
			else if (f.endDate.value==""){
				alert("���� ��¥�� �Է��� �ּ���!!")
				f.endDate.focus()
				return
			}
			else if (f.startDate.value>f.endDate.value){
				alert("���� ��¥�� ���� ��¥���� ũ�� �ȵ˴ϴ�. �ٽ� �Է��� �ּ���!!")
				f.startDate.focus()
				return
			}
			else if (f.genre.value==""){
				alert("���� �帣�� �Է��� �ּ���!!")
				f.genre.focus()
				return
			}
			else if (f.rate.value==""){
				alert("���� ���ɰ��� �Է��� �ּ���!!")
				f.rate.focus()
				return
			}
			else if (f.duration.value==""){
				alert("���� �ð��� �Է��� �ּ���!!")
				f.duration.focus()
				return
			}
			else if (f.detail.value==""){
				alert("�� ������ �Է��� �ּ���!!")
				f.detail.focus()
				return
			}
			else if (f.notice.value==""){
				alert("���� ������ �Է��� �ּ���!!")
				f.notice.focus()
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
<!-- ������ �̸�, ������ ,�Ⱓ,�帣,�������ɰ�,�����ð�,���λ���,�������׸� �����ϰ� �����ʹ� ���� ó���ϱ�� �Ѵ�. -->
<div align="center">
	<br>
		<div class="w3-container w3-lobster">
		  <p class="w3-xxxlarge">Show Update Page</p>
		</div>
	<form name = "f" action = "showmanage_updateok.do" method = "POST">
		<input type="hidden" name="show_ID" value="${getShow.show_ID}"/>
	<br>
	<br>
	<div align = "center" style="width:70%">
	<table border="1" class="w3-table w3-striped w3-border">
		<tr>
			<th align="center" width="20%">���� �̸�</th>
			<td align="center" width="60%"><input type= "text" name = "show_name" value = "${getShow.show_name}" maxlength='20'></td>
		</tr>
		<tr>
			<th align="center" width="20%">���� ������</th>
			<td align="center" width="60%"><input type= "text" name = "show_organizer" value = "${getShow.show_organizer}" maxlength='20'></td>
		</tr>
		<tr>
			<th align="center" width="20%">�Ⱓ</th>
			<td align="center" width="60%"><input type= "date" name = "startDate" value = "${getShow.startDate}">~
							<input type= "date" name = "endDate" value = "${getShow.endDate}"></td>
		</tr>
		<tr>
			<th align="center" width="20%">�帣</th>
			<td align="center" width="60%">
				<select name = "genre">
					<option value = "���">���</option>
					<option value = "��Ÿ��">��Ÿ��</option>
					<option value = "ȣ��">ȣ��</option>
					<option value = "���">���</option>
					<option value = "���">���</option>
				</select>
			</td>
		</tr>
		<tr>
			<th align="center" width="20%">���� ����</th>
			<td align="center" width="60%">
				<select name = "rate">
					<option value = "��ü �̿밡">��ü �̿밡</option>
					<option value = "12�� �̿밡">12�� �̿밡</option>
					<option value = "15�� �̿밡">15�� �̿밡</option>
					<option value = "19�� �̿밡">û�ҳ� ���� �Ұ�</option>
				</select>
			</td>
		</tr>
		<tr>
			<th align="center" width="20%">���� �ð�</th>
			<td align="center" width="60%"><input type= "text" name = "duration" value = "${getShow.duration}" maxlength='10'>��</td>
		</tr>
		<tr>
			<th align="center" width="20%">���� ����</th>
			<td align="center" width="60%"><textarea rows = "7" cols = "50" name = "detail">${getShow.detail}</textarea></td>
		</tr>
		<tr>
			<th align="center" width="20%">���� ����</th>
			<td align="center" width="60%"><textarea rows = "7" cols = "50" name = "notice">${getShow.notice}</textarea></td>
		</tr>
		<tr>
			<th align="center" width="20%">���� ���� �ּ�</th>
			<td align="center" width="60%"><input type= "text" name = "videoLink" value = "${getShow.videoLink}" maxlength='150' style="width:600px;font-size:13px;"></td>
		</tr>
		<tr>
			<td align = "center" colspan = "2">
				<div align = "center">
				<input type = "button" value = "����" onclick = "location = 'javascript:check()'">
				&nbsp;&nbsp;
				<input type = "button" value = "����" onclick = "location = 'showmanage_main.do'">
				</div>
			</td>
		</tr>
	</table>
	</div>
	</form>
</div>