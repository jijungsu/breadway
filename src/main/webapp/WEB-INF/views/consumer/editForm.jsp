<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>ȸ����������â</title>
	<script type = "text/javascript">
 	function checkValue()
	        {	
	        	var form = document.edit;
	        	
	            if(form.consumer_Password.value != form.PasswordCheck.value){
	                alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
	                return false;
	            }
	 
	            if(isNaN(form.consumer_Phone.value)){
	          		alert("��ȭ��ȣ�� - ������ ���ڸ� �Է����ּ���.");
	          		return false;
	          	}
	  			return true;
	        	form.submit();
	        }
 	function myPage()
 		{
 			location.href = "consumer_mypage.do";
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
	<form name = "edit" action = "consumer_edit_ok.do" method = "post" onsubmit="return checkValue()">
	<input type = "hidden" name = "consumer_UID" value = "${getConsumer.consumer_UID}">
		<table width="600" align="center" class="table">
  				<tr>
					<td colspan="2" align="center">ȸ����������</td>
 				</tr>
				<tr>
					<td width="150" class="m3">���̵�</td>
					<td class="m3">
						<input type="text" name="consumer_ID" value = "${getConsumer.consumer_ID}" readOnly>
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">��й�ȣ</td>
					<td class="m3">
						<input type="password" name="consumer_Password" placeholder="��й�ȣ" value = "${getConsumer.consumer_Password}" required>
						
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">��й�ȣ Ȯ��</td>
					<td class="m3">
						<input type="password" name="PasswordCheck" placeholder="��й�ȣȮ��" value = "${getConsumer.consumer_Password}" required>
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">�̸�</td>
					<td class="m3">
						<input type="text" name="consumer_Name" value = "${getConsumer.consumer_Name}" readOnly>
				</tr>
  				 <tr>
                    <td>�̸���</td>
                    <td>
                        <input type="text" name="consumer_Email" maxlength="50" value = "${getConsumer.consumer_Email}" readOnly>
                    </td>
                </tr>
                <tr>
                	<td>��ȭ��ȣ</td>
                	<td>
                		<input type = "text" name = "consumer_Phone" maxlength ="11" value = "${getConsumer.consumer_Phone}" required>
                	</td>
                </tr>
  				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="����" class="btn btn-secondary">  
						<input type="reset" value="���" class="btn btn-secondary" onclick="history.back();">
					</td>
  				</tr>
  			</table>
	</form>
	</div>
	</div>
	</div>
</body>
</html>