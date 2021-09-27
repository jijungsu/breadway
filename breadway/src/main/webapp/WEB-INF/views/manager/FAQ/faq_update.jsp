<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- faq_update.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ FAQ����"></c:param>
</c:import>
<script type="text/javascript">
	function check(){
		if (f.keyword.value==""){
			alert("Ű���带 �Է��� �ּ���!!")
			f.keyword.focus()
			return
			}
		if (f.question.value==""){
			alert("������ ���� ������ �Է��� �ּ���!!")
			f.question.focus()
			return
		}
		if (f.answer.value==""){
			alert("������ ���� �亯�� �Է��� �ּ���!!")
			f.answer.focus()
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
<div align="center">
	<br>
		<div class="w3-container w3-lobster">
		  <p class="w3-xxxlarge">Frequently Asked Questions Update</p>
		</div>
	<br>
	<div align = "center" style="width:50%">
	<form name = "f" action = "managerfaq_updateok.do" method = "POST">
		<input type="hidden" name="num" value="${getFaq.num}"/>
		<table border="1" class="w3-table w3-striped w3-border">
			<tr>
				<td>Ű����</td>
				<td><input class="w3-input w3-border w3-round" type = "text" name = "keyword" value = "${getFaq.keyword}" maxlength='30'></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input class="w3-input w3-border w3-round" type = "text" name = "question" value = "${getFaq.question}" maxlength='100'></td>
			</tr>
			<tr>
				<td>�亯</td>
				<td><textarea class="w3-input w3-border w3-round" rows = "4" cols = "50" name= "answer">${getFaq.answer}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align = "center">
					<div align = "center">
						<input class="w3-button w3-dark-grey" type = "button" value = "�����ϱ�" onclick = "location = 'javascript:check();'">
						<input class="w3-button w3-dark-grey" type = "reset" value = "�ٽ��ۼ�">
					</div>
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>