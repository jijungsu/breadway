<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
         <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<c:import url="/top.do">
	<c:param name="title">������</c:param>
</c:import>
    	<div class="container" style="margin-top:50px">
  		<div class="row">
	        <div class="col-sm-2" align = "center">
    		<form name="f" action="musicalFind.do" method="post">
    		<input type="hidden" name="show_name">
    			<h3>������</h3>
    			<ul class="nav nav-pills flex-column">	
    				<li><input type="submit" name="area" value="����" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="���" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="��õ" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="����" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="�λ�" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="���" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="�뱸" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="����" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="���ֵ�" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
				</ul>
				</form>
				</div>
		
			<div class="col-sm-10 text-center">
	   		<div class="container" style="padding-top:30px; padding-bottom:30px;">
	   		<div align = "center">
    		<form name="f" action="musicalFind.do" method="post">
				<table border="0">
					<tr>
						<td>
						<select name="area">
    						<option value="����">����</option>
    						<option value="���">���</option>
    						<option value="��õ">��õ</option>
    						<option value="����">����</option>
    						<option value="�λ�">�λ�</option>
    						<option value="���">���</option>
    						<option value="�뱸">�뱸</option>
    						<option value="����">����</option>
    						<option value="���ֵ�">���ֵ�</option>
    						
    					</select>
							<input type="text" name="show_Name" placeholder="������ �̸��� �˻��ϼ���" style="width:300px;font-size:15px;">
							<input type="submit" value="�˻�" class="btn btn-secondary">
						</td>
					</tr>			
		 		</table>
			</form>
			<c:choose>
    		<c:when test="${isEmpty == 'null'}">

    				<h4>�ش��ϴ� �������� �����ϴ�.</h4>

    		</c:when> 
    		<c:otherwise>
    		<div class="container" align="center" >
							<c:forEach var="dto" items="${findList}" varStatus="status">
							<c:choose>
								<c:when test="${(status.index % 3)==0 && status.index != 0}">
								<div class="card" style="width:250px; height:450px" id="clear" >
						   			<img class="card-img-top" src="<spring:url value='/resources/files/show/${dto.POSTERNAME}' />" alt="Card image" style="width:250px; height:350px">
						   		<div class="card-body" align="left">
						      	<h5 class="card-title">${dto.SHOW_NAME}</h5>
						      	<!-- <p class="card-text">����</p> -->
						      	<a href="musical_content.do?show_ID=${dto.show_ID}" class="btn btn-primary">�����ϱ�</a>
						    	</div>
						  		</div>
						  		</c:when>
						  		<c:otherwise>
						 		<div class="card" style="width:250px; height:450px" id="float" >
						   			<img class="card-img-top" src="<spring:url value='/resources/files/show/${dto.POSTERNAME}' />" alt="Card image" style="width:250px; height:350px">
						   		<div class="card-body" align="left">
						      	<h5 class="card-title">${dto.SHOW_NAME}</h5>
						      	<!-- <p class="card-text">����</p> -->
						      	<a href="musical_content.do?show_ID=${dto.SHOW_ID}" class="btn btn-primary">�����ϱ�</a>
						    	</div>
						  		</div>
						  		</c:otherwise>
						  		</c:choose>
						  	</c:forEach>
						  	</div>
						  	
    		
    		</c:otherwise>
    	</c:choose>
		</div>
	</div>
	</div>
	</div>
		</div>
    </body>
