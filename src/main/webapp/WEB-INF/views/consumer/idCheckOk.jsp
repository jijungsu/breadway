<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>���̵� �ߺ� ���</title>
	<script type = "text/javascript">
	function Idinput(){
		 opener.document.getElementById("consumer_ID").value = document.getElementById("id").value
		window.close();
	}
	</script>
</head>
<body>
	<div align = "center">
	<h3> ���̵� �ߺ� Ȯ�� ���</h3><br>
	�Է� ID :<input type = "text" id = "id" value = "${consumer_ID}" readOnly><br>
	<c:choose>
	<c:when test="${res==0}">
		<p> ��� ������ ���̵��Դϴ�.</p>
		<input type = "button" value = "���̵� ����ϱ�" onclick = "Idinput()">
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