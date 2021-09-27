<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>

<script type="text/javascript">
    	
		alert("****************�ʵ�***************** \n���� ��� �� �Ⱓ�� ���� ������� �߻��� �� �ֽ��ϴ�.\n�ڼ��� ������ �ش� �������� �������ּ���.")
		
		function check() {
			var obj = document.f.difference.value;
			console.log(obj);
			if(obj == 0) {
				alert("���� ���Ͽ��� ������Ұ� �Ұ����մϴ�.")
				return false;
			}	else if(obj < 0 ) {
				alert("�ش� ������ �̹� �������ϴ�.")
				return false;
			}
			else {
				document.f.submit();
				true;
			}
		}
	</script>
<%
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>
 <c:import url="/top.do">
	<c:param name="title" value="������ұ���"></c:param>
</c:import> 
	<br><br><br>
	<div class="container" style="margin-top:30px">
  		<div class="row">
	        <div class="col-sm-3">
	        <ul class="nav nav-pills flex-column">
       			<li class="nav-item">
         			<a class="nav-link" href="consumer_mypage.do">����������</a>
      		  	</li>
      		  	<li class="nav-item">
      		  		<a class="nav-link active" href="musical_myBuyPage.do">���ų���Ȯ��</a>
      		  	</li>
		        <li class="nav-item">
		          <a class="nav-link " href="musical_myCancelPage.do">������ҳ���Ȯ��</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="inquiry_myInquiry.do">���ǳ���Ȯ��</a>
		        </li>   
    	  </ul>
	    </div>
	    <div class="col-sm-8 text-center">
	    <div class="container" style="padding-top:30px; padding-bottom:30px;">
    		<form name="f" action="musical_reserveCancelOk.do?order_Num=${reserveData[0].ORDER_NUM}" method="post" onSubmit="check();return false">
    		<input type="hidden" name="order_num" value="${reserveData[0].ORDER_NUM}">
 			<input type="hidden" name="difference" value="${difference}">
			
    		<table border="0" class="table" style="vertical-align:middle;">
    			<tr height="10%"  align="left" >
    			<td width="80%" colspan="4">������<${reserveData[0].SHOW_NAME}></td>
    			</tr>
    			<tr height="100" >
    				<td width="25%" align="center" style="vertical-align:middle;" >
    				���� ��¥
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;" >
    				${reserveData[0].SCHEDULE_DATE}
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;" >
    				���� ��¥
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;" >
    				${today}<br>
    				(�����ϱ��� ${difference}�� ��)
    				</td>
    			</tr>
    			</tr>
    			<tr height="30">
    				<c:set var = "total" value = "0" />
					<c:forEach var="result" items="${reserveData}" varStatus="status">     
						<c:set var= "total" value="${total + result.SEAT_PRICE}"/>
					</c:forEach>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				���� �ݾ�
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				${total * (100-(reserveData[0].SEAT_DISCOUNT))/100}
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				���� ��¥
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				${reserveData[0].RESERVE_DATE}
    				</td>
    			</tr>
    			<tr height="30">
    				<td width="25%" align="center" style="vertical-align:middle;">
    				�¼�
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				<c:forEach var="i" items="${reserveData}" varStatus="status" >
    				${i.SEAT_NAME}<br></c:forEach>
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				ȯ�� ���� �ݾ�
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				${total * (100-(reserveData[0].SEAT_DISCOUNT))/100*percent/100}<br>
    				(${percent}% ȯ�� ����)
    				<input type="hidden" name="cancelPrice" value="${total * (100-(reserveData[0].SEAT_DISCOUNT))/100*percent/100}">
    				</td>
    			</tr>
    			<tr>
    				<td colspan="4" valign="top" align="left">
    				*����� ���� ����*<br>
    				1. �����ϱ��� 10�� ���ĺ��� : �����ݾ��� 100% ȯ��.<br>
    				2. �����ϱ��� 9��~7�� �� : �����ݾ��� 90% ȯ��.<br>
    				3. �����ϱ��� 6��~3�� �� : �����ݾ��� 80% ȯ��.<br>
    				4. �����ϱ��� 2��~�������� : �����ݾ��� 70% ȯ��.<br>
    				5. ���� ������ ��Ұ� �Ұ����մϴ�.
    				</td>
    			</tr>
    			<tr>
    				<td colspan="4" >
    				<div class="container" style="text-align:right; padding:-51px;" >
    				<input type="submit" value="Ȯ��" class="btn btn-outline-secondary" >
					<input type="button" value="���" class="btn btn-outline-secondary" onclick = "history.back(-1);">
					</div>
    				</td>
    			</tr>
    		</table>
    		
    		</table>
    		</form>
    	
    	
				
		
<%--     	<c:out value="${consumerDTO }"/> --%>
    	<%-- <c:set var="dto" value="${consumerDTO}">
    	
  		</c:set> --%>
    		
    		
    	
    	
</div>
</div>
</div>
</div>
    </body>
    
    
    </html>


<%-- 

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
   		<c:set var="diff" value='${difference}'/>


<%
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>

    <head>
    	<title>���ų���</title>
    	<script type="text/javascript">
    	
		alert("****************�ʵ�***************** \n���� ��� �� �Ⱓ�� ���� ������� �߻��� �� �ֽ��ϴ�.\n�ڼ��� ������ �ش� �������� �������ּ���.")
		
		function check() {
			var obj = document.f.difference.value;
			console.log(obj);
			if(obj == 0) {
				alert("���� ���Ͽ��� ������Ұ� �Ұ����մϴ�.")
				return false;
			}	else if(obj < 0 ) {
				alert("�ش� ������ �̹� �������ϴ�.")
				return false;
			}
			else {
				document.f.submit();
				true;
			}
		}
	</script>
    </head>
    <body>
    
	
  
    <table border="1" align="center" width="800" height="650">

    	<tr align="center"  height="100" >
    	<td width="10%">
    	<h5><a href="musical_categoryPage.do?genre=action">�帣��</a></h5>
    	<h5><a href="musical_categoryPage_area.do">������</a></h5>
    	</td>
    	<td width="10%">
    	<h5><a href="musical_categoryPage_date.do">��¥��</a></h5>
    	</td>
    	<td>
    	<h1><a href="musical_mainPage.do">��ε����</a></h1>
    	</td>
    	<td width="20%">
    	<c:choose>
    		<c:when test="${sessionScope.consumer == null}">
    			<h5><a href="login.do">�α���</a></h5>
    			<h5><a href ="signup.do">ȸ������</a></h5>
    		</c:when> 
    		<c:otherwise>
    			<h5><a href="logout.do">�α׾ƿ�</a></h5>
    		</c:otherwise>
    	</c:choose>
    		<h5><a href="musical_loginCheck.do?root=consumer_mypage.do">����������</a>
    		<h5><a href="faq_main.do">������</a></h5>
    	</td>
    	
    	</tr>
    	
    	<tr>
    	<td colspan="2" rowspan="2" valign="top">
    		<ul>
    			<li><a href="musical_myInfo.do">����������</a></li>
    			<li><a href="musical_myBuyPage.do">���ų���Ȯ��</a></li>
    			<li><a href="musical_myCancelPage.do">������ҳ���Ȯ��</a></li>
    			<li><a href="inquiry_myInquiry.do">���ǳ���Ȯ��</a></li>
    		</ul>
    	</td>
    	<tr>
    	<th colspan="3" valign="top" align="center">��ҳ���Ȯ��<br>
    	<form name="f" action="musical_reserveCancelOk.do?order_Num=${reserveData[0].ORDER_NUM}" method="post" onSubmit="check();return false">
    		<input type="hidden" name="order_num" value="${reserveData[0].ORDER_NUM}">
 			<input type="hidden" name="difference" value="${difference}">
			<input type="hidden" name="cancelPrice" value="${total * (100-(reserveData[0].SEAT_DISCOUNT))/100*percent/100}">
    		<table border="1" width="90%" height="500" align="center">
    			<tr height="10%"  align="left" >
    			<td width="80%" colspan="4">������<${reserveData[0].SHOW_NAME}></td>
    			</tr>
    			<tr height="30">
    				<td width="25%" align="center" valing="center">
    				���� ��¥
    				</td>
    				<td width="25%" align="center" valing="center">
    				${reserveData[0].SCHEDULE_DATE}
    				</td>
    				<td width="25%" align="center" valing="center">
    				���� ��¥
    				</td>
    				<td width="25%" align="center" valing="center">
    				${today}<br>
    				(�����ϱ��� ${difference}�� ��)
    				</td>
    			</tr>
    			</tr>
    			<tr height="30">
    				<c:set var = "total" value = "0" />
					<c:forEach var="result" items="${reserveData}" varStatus="status">     
						<c:set var= "total" value="${total + result.SEAT_PRICE}"/>
					</c:forEach>
    				<td width="25%" align="center" valing="center">
    				���� �ݾ�
    				</td>
    				<td width="25%" align="center" valing="center">
    				${total * (100-(reserveData[0].SEAT_DISCOUNT))/100}
    				</td>
    				<td width="25%" align="center" valing="center">
    				���� ��¥
    				</td>
    				<td width="25%" align="center" valing="center">
    				${reserveData[0].RESERVE_DATE}
    				</td>
    			</tr>
    			<tr height="30">
    				<td width="25%" align="center" valing="center">
    				�¼�
    				</td>
    				<td width="25%" align="center" valing="center">
    				<br>
    				<c:forEach var="i" items="${reserveData}" varStatus="status" >
    				${i.SEAT_NAME}<br></c:forEach>
    				</td>
    				<td width="25%" align="center" valing="center">
    				ȯ�� ���� �ݾ�
    				</td>
    				<td width="25%" align="center" valing="center">
    				${total * (100-(reserveData[0].SEAT_DISCOUNT))/100*percent/100}<br>
    				(${percent}% ȯ�� ����)
    				</td>
    			</tr>
    			<tr>
    				<td colspan="4" valign="top" align="left">
    				*����� ���� ����*<br>
    				1. �����Ϸκ��� 30�� ���ĺ��ʹ� ������� �����ϴ�.<br>
    				2. �����Ϸκ��� 7��~30�� �������� �����ݾ��� 90���θ� ȯ���ص帳�ϴ�.<br>
    				3. �����Ϸκ��� 6��~4�� �������� �����ݾ��� 80���θ� ȯ���ص帳�ϴ�.<br>
    				4. 3�� ������ �Ϸ��������� �����ݾ��� 60���θ� ȯ���ص帳�ϴ�.<br>
    				5. ���� ������ ��Ұ� �Ұ����մϴ�.
    				</td>
    			</tr>
    			<tr>
    				<td colspan="4" >
    					<input type="submit" value="Ȯ��" >
						<input type="button" value="���" onclick="history.back(-1);">
    				</td>
    			</tr>
    		</table>
    		</form>
    	</th>
    	</tr>	
    </table>
    </body> --%>