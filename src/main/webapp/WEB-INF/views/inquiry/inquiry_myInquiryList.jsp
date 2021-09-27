<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>

 <c:import url="/top.do">
	<c:param name="title" value="1:1 ���ǳ���"></c:param>
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
		          <a class="nav-link" href="musical_myCancelPage.do">������ҳ���Ȯ��</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" href="inquiry_myInquiry.do">���ǳ���Ȯ��</a>
		        </li>   
    	  </ul>
	    </div>
	    <div class="col-sm-8 text-center">
	    <div class="container">
    	<h3>1:1���ǳ���</h3>
    	</div>
   
            		<c:if test="${empty inq_list}">
            			<div class="container"  id="floatRight">
						<table class="table table-striped"  > 
						<thead>
						<tr height="25">
							<th width="100">���ǳ�¥</th>
							<th width="380">����</th>
							<th width="180">�亯����</th>
							</tr>
							</thead>
							<tr>
							<td colspan="3">
							�����Ͻ� ������ �����ϴ�.
							</td>
							</tr>
						</table>
						</div>
					
            		</c:if>
            		<c:if test="${not empty inq_list}">
            			<div class="container"  id="floatRight">
						<table class="table table-striped"  > 
						<thead>
						<tr height="25">
							<th width="40">���ǳ�¥</th>
							<th width="380">����</th>
							<th width="180">�亯����</th>
							</tr>
							</thead>
							
						<c:forEach var="dto" items="${inq_list}" varStatus="status">
						
						<tr height="25">
						
							<td>${dto.inqdate}</td>
							<td>
							<div class="container" width="200">
								<!-- �׷� �±׷� role�� aria-multiselectable�� �����Ѵ�. -->
								<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<!-- �ϳ��� item�Դϴ�. data-parent ��û�� href ������ ����� �ϸ� �������� �۵��մϴ�. -->
								<div class="panel panel-default">
								<div class="panel-heading" role="tab">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collpase${status.index}" aria-expanded="false">
								${dto.subject}
								</a>
								</div>
								<div id="collpase${status.index}" class="panel-collapse collapse" role="tabpanel">
								<div class="panel-body">
								[���ǳ���]
								<div class="container" style="white-space:pre;">${dto.content}</div>								
								[�亯����]
								<c:set var="answerContent" value="�亯���Դϴ�. ��ٷ��ּ���."/>
								<c:forEach var="answer" items="${inq_list_Answer}">
    							<c:if test="${dto.re_level == answer.re_level}">
    								<c:set var="answerContent" value="${answer.content }"/>
    							</c:if>
    							</c:forEach>
    							
    							<div class="container" style="white-space:pre;">${answerContent}</div>
    							<br>
    							<a href="inquiry_updateForm.do?num=${dto.num}">[����]</a>
    							<a href="inquiry_delete.do?num=${dto.num}">[����]</a>
								</div>
								</div>
								</div>
								</div>
								</div>
							</td>
							<td>
							<c:forEach var="answer" items="${inq_list_Answer}">
    							<c:if test="${dto.re_level == answer.re_level}">
    								<c:set var="answerStatus" value="�亯�Ϸ�"/>
    						</c:if>
    						</c:forEach>
    						<c:if test="${empty answerStatus }" >
    					�亯��
    				</c:if>
    				<c:if test="${not empty answerStatus}">
    					${answerStatus}
    				</c:if>
							</td>
						</tr>
						</c:forEach>
						
						</table>
						
						<div class="container">
						<c:if test="${rowCount > 0}">
			<c:if test="${startPage > pageBlock}">
				<a href="inquiry_myInquiry.do?pageNum=${startPage-pageBlock}">[����]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="inquiry_myInquiry.do?pageNum=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="inquiry_myInquiry.do?pageNum=${startPage+pageBlock}">[����]</a>
			</c:if>
		</c:if>
		</div>
		
						
						</div>
						</c:if>
						</div>
						
						</div>
						</div>
  
    	
    		

    		

 

    	
				
		
<%--     	<c:out value="${consumerDTO }"/> --%>
    	<%-- <c:set var="dto" value="${consumerDTO}">
    	
  		</c:set> --%>
    		
    		
    	
    	
    </table>
    </body>