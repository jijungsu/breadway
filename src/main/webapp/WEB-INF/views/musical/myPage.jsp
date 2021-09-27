<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>

<c:import url="/top.do">
	<c:param name="title" value="����������"></c:param>
</c:import> 
	<br><br><br>
	<div class="container" style="margin-top:30px">
  		<div class="row">
	        <div class="col-sm-4">
	        <ul class="nav nav-pills flex-column">
       			<li class="nav-item">
         			<a class="nav-link active" href="consumer_mypage.do">����������</a>
      		  	</li>
      		  	<li class="nav-item">
      		  		<a class="nav-link" href="musical_myBuyPage.do">���ų���Ȯ��</a>
      		  	</li>
		        <li class="nav-item">
		          <a class="nav-link" href="musical_myCancelPage.do">������ҳ���Ȯ��</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="inquiry_myInquiry.do">���ǳ���Ȯ��</a>
		        </li>   
		        <li class="nav-item">
		          <a class="nav-link" data-toggle="modal" data-target="#sescessionModal">ȸ��Ż��</a>
		        </li>
    	  </ul>
	    </div>
	    <div class="col-sm-6 text-center">
	    <div class="container" style="padding-top:30px; padding-bottom:30px;">
	    	<table border = "0" align = "center" width = "80%" height="50%" class="table">
	    	<tr>
	    		<td colspan="2" align = "center"><h3>����������</h3></td>
    		</tr>
    		<tr>
    			<th>�̸� </th>
    			<td align = "center">${sessionScope.consumer.consumer_Name}</td>
    		</tr>
    		<tr>
    			<th>���̵� </th>
    			<td align = "center">${sessionScope.consumer.consumer_ID}</td>
    		</tr>
    		<tr>
    			<th>�̸���</th>
    			<td align = "center">${sessionScope.consumer.consumer_Email}</td>
    		</tr>
    		<tr>
    			<th>��ȭ��ȣ </th>
    			<td align = "center">${sessionScope.consumer.consumer_Phone}</td>
    		</tr>
    		<tr>
    			<td colspan="2" align = "center">
    				<a href= "consumer_edit.do">[�����Ϸ�����]</a>
    			</td>
    		</tr>
    		</table>
    	</div>
    	</div>
    </div>
   </div>
   
   <!-- The Modal -->
		  <div class="modal fade" id="sescessionModal">
		    <div class="modal-dialog modal-m">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h4 class="modal-title">ȸ��Ż��</h4>
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        </div>
		        <div class="modal-body">
		         	<form name="f" action="consumer_sescession_ok.do" method="post">
					<table width="500" class="table">
						<tr>
							<th width="20%">��й�ȣ</th>
							<td>
								<input type="password" name="consumer_Password" maxlength="30" placeholder="��й�ȣ�� �Է����ּ���" required="required">
							</td>
						</tr>
						<tr>
							<th width="20%">ȸ��Ż�𹮱��Է�</th>
							<td>
								<input type="text" name="sescessiontext" maxlength="50" placeholder="�׵��� �����߽��ϴ�." required="required">
							</td>
						</tr>
						<tr align = "center">
							<th colspan = "2"><font color = "red">���ų����� ���� ��� ȸ�� Ż�� �ȵ˴ϴ�.<br>���� ��Ҹ� �ϰ� �������ּ���</font><br>
							<a href = "musical_myBuyPage.do">[���ų���Ȯ��]</a></th>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="Ż���ϱ�" class="btn btn-secondary">
								<input type="reset" value="���" class="btn btn-secondary" data-dismiss="modal">
							</td>
						</tr>
					</table>
				</form>
		        </div> 
		      </div>
		    </div>
		  </div>	

  </body>
 </html>