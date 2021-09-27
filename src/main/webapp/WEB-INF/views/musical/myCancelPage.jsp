<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>

 <c:import url="/top.do">
	<c:param name="title" value="������ҳ���"></c:param>
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
      		  		<a class="nav-link" href="musical_myBuyPage.do">���ų���Ȯ��</a>
      		  	</li>
		        <li class="nav-item">
		          <a class="nav-link active" href="musical_myCancelPage.do">������ҳ���Ȯ��</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="inquiry_myInquiry.do">���ǳ���Ȯ��</a>
		        </li>   
    	  </ul>
	    </div>
	    <div class="col-sm-8 text-center">
	    <div class="container" style="padding-top:30px; padding-bottom:30px;">
    		
    		<table border="0" width="600" height="500" align="center" class="table">
    			<tr>
    				<td colspan="4" align="center" height="10">������ҳ���Ȯ��</td>
    			</tr>
    			<tr height="10">
	    			<th>�ֹ���ȣ</th>
	    			<th>������ ����</th>
	    			<th>����</th>
	    			<th>��� ��¥</th>
    			</tr>
    			<c:if test="${empty reserveCancelList}">
    			<tr height="10" >
    			<td colspan="4">����� �������� �����ϴ�.</td>
    			</tr>
    			</c:if>
    			<c:forEach var="dto" items="${reserveCancelList}">
    			<tr height="10">
    				<td>${dto.ORDER_NUM}</td>
    				<td><a href="musical_musicalCancelInfo.do?order_Num=${dto.ORDER_NUM}">${dto.SHOW_NAME}</a></td>
    				<td>${dto.THEATRE_NAME}</td>
    				<td>${dto.RESERVE_CANCEL_DATE}</td>
    				</tr>
    				</c:forEach>
    				<tr>
    				</tr>
    		
    		</table>
</div>
</div>
</div>
</div>
    </body>
    </html>