<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� �ߺ� ���</title>
	<script type = "text/javascript">
	function Idinput(){
		 opener.document.getElementById("marketer_ID").value = document.getElementById("id").value
		window.close();
	}
	</script>
</head>
<body>
	<div align = "center">
	<h3> ���̵� �ߺ� Ȯ�� ���</h3><br>
	�Է� ID :<input type = "text" id = "id" value = "${marketer_ID}" readOnly><br>
	<c:choose>
	<c:when test="${res==0}">
		<p> ��� ������ ���̵��Դϴ�.</p>
		<input type = "button" value = "���̵� ����ϱ�" onclick = "Idinput()" class="btn btn-secondary">
	</c:when>
	<c:otherwise>
		<p style = 'color:red'> �ش� ���̵�� ����� �� �����ϴ�.</p>
	</c:otherwise>
	</c:choose>
	<hr>
	<a href = "javascript:history.back()">[�ٽýõ�]</a>
	&nbsp; &nbsp;
	<a href = "javascript:window.close()">[â�ݱ�]</a>
	</div>
</body>
</html>