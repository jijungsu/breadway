<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<title>ȸ������</title>
	<script type="text/javascript">
	      function checkValue()
	        {	
	        	var form = document.f;
	        	
	        	if(!form.consumer_ID.value){
	        		alert("���̵� �Է��ϼ���");
	        		return false;
	        	}
	            if(!form.consumer_Password.value){
	                alert("��й�ȣ�� �Է��ϼ���.");
	                return false;
	            }
	            // ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
	            if(form.consumer_Password.value != form.PasswordCheck.value){
	                alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
	                return false;
	            } 
	            if(!form.consumer_Phone.value){
	            	alert("��ȭ��ȣ�� �Է����ּ���");
	            	return false;
	            }
	          	if(isNaN(form.consumer_Phone.value)){
	          		alert("��ȭ��ȣ�� - ������ ���ڸ� �Է����ּ���.");
	          		return false;
	          	}
	          	return true;
	        	form.submit();
	        }
	        // ��� ��ư Ŭ���� �α��� ȭ������ �̵�
	        function goLoginForm() {
	            location.href="login.do";
	        }
	        function openIDCheck(){
	        	window.name = "parentForm"
	        	window.open("consumer_IdCheckForm.do","���̵� �ߺ� Ȯ��", "width=500, height=200, resizable=no, scrollbars=no");
	        }
    </script>
</head>
<body>
<nav class="navbar navbar-light bg-dark">
<p><p>
</nav>
<div class="container" align="center" >
 <div class="row content">
  <div class="col-sm-2"></div>
   <div class="col-sm-8 text-left"> 
	<form name = "f" action = "consumer_Input.do" method = "post" onsubmit="return checkValue()">
		<table class="table">
  				<tr>
					<td colspan="2" align=center>�Ϲ�ȸ������</td>
 				</tr>
				<tr>
					<td width="150">���̵�</td>
					<td class="m3">
						<input type="text" name="consumer_ID" id="consumer_ID" placeholder="���̵�" readOnly>
						<input type="button" onclick="openIDCheck()" value="ID �ߺ�Ȯ��"  class="btn btn-secondary">
					</td>
  				</tr>
  				<tr>
					<td width="150">��й�ȣ</td>
					<td class="m3">
						<input type="password" name="consumer_Password" placeholder="��й�ȣ" >
					</td>
  				</tr>
  				<tr>
					<td width="150">��й�ȣ Ȯ��</td>
					<td class="m3">
						<input type="password" name="PasswordCheck" placeholder="��й�ȣȮ��">
					</td>
  				</tr>
  				<tr>
					<td width="150">�̸�</td>
					<td class="m3">
						<input type="text" name="consumer_Name" value = "${param.consumer_Name}" maxlength = "30" readOnly>
				</tr>
  				 <tr>
                    <td>�̸���</td>
                    <td>
                        <input type="text" name="consumer_Email" maxlength="50"  value = "${param.consumer_Email}" readOnly>
                    </td>
                </tr>
                <tr>
                	<td>��ȭ��ȣ</td>
                	<td>
                		<input type = "text" name = "consumer_Phone" maxlength ="11">
                	</td>
                </tr>
  				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="����"  class="btn btn-secondary">  
						<input type="button" value="���" onclick="goLoginForm()"  class="btn btn-secondary">
					</td>
  				</tr>
  			</table>
	</form>
</div>
</div>
</div>
</body>
</html>