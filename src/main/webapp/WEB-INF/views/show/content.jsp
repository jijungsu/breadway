<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>

<c:import url="/top.do">
	<c:param name="title" value="���� �� ����"/>
</c:import>
<c:import url="/show_summary.do" >
	<c:param name="page" value="content"/>
	<c:param name="show_id" value="${show_id}"/>	
</c:import>

<!-- ���� �� ���� -->

<div class="container" style="padding-top:30px; padding-bottom:30px;">
<div class="container justify-content-center">
	<div class="row">
		<div class="col font-weight-bold">
		<h5>ĳ���� </h5>
		</div>
	</div>

	<div class="row" style="padding-top:30px">				
		<c:forEach var="part" items="${getPart}" varStatus="status">			
			<div class="col-md">		
				<div class="row">
				<div class="col text-center">
				<img src="<spring:url value='/resources/files/cast/${part.cast_PhotoName}' />"
					 class="rounded-circle" alt="actor" width="130" height="130"> 
				</div>
				</div>
				
				<div class="row" style="padding-top:10px">
				<div class="col text-center font-weight-bold">
				${part.cast_Part}
				</div>
				</div>
				
				<div class="row">
				<div class="col text-center">
				${part.cast_Name}
				</div>
				</div>								
			</div>
		</c:forEach>
	</div>
	
	<div class="row" style="padding-top:60px">
		<div class="col font-weight-bold">
		<h5>�������� </h5>
		</div>
	</div>
	
	<div class="row" style="padding-top:20px">
		<div class="col">
		${getShow.NOTICE }
		</div>
	</div>
	
	<div class="row" style="padding-top:60px">
		<div class="col font-weight-bold">
		<h5>�������� </h5>
		</div>
	</div>
	
	<div class="row" style="padding-top:20px">
		<div class="col">
		${getShow.DETAIL }
		</div>
	</div>
	
	<div class="row text-center" style="padding-top:20px">
		<div class="col">
		<div class="ratio ratio-16x9">
		
		<iframe width="854" height="480" src="${getShow.VIDEOLINK }" 
				title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; 
				clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
		</div>
	</div>
	
	<div class="row" style="padding-top:60px">
		<div class="col font-weight-bold">
		<h5>��ǰ�������� ���� </h5>
		</div>
	</div>
	
	<div class="row" style="padding-top:20px">
		<div class="col">		
			<table class="table table-bordered" style = "table-layout: auto; width: 100%; table-layout: fixed;">
			<tbody>
				<tr>
				<th scope="col" class="bg-light text-center">����/��ȹ</td>
				<td>${getShow.SHOW_ORGANIZER }</td>
				<th scope="col" class="bg-light text-center">�Һ��ڻ��</td>
				<td>BreadWay</td>
				</tr>
				
				<tr>
				<th scope="col" class="bg-light text-center">�ֿ�</td>
				<td id="actors"></td>
				<th scope="col" class="bg-light text-center">�������</td>
				<td>${getShow.RATE } ������</td>
				</tr>
				
				<tr>
				<th scope="col" class="bg-light text-center">�����ð�</td>
				<td>${getShow.DURATION }��(���͹̼� 20�� ����)</td>
				<th scope="col" class="bg-light text-center">�������</td>
				<td>${getShow.THEATRE_NAME }</td>
				</tr>
				
				<tr>
				<th scope="col" class="bg-light text-center">���/ȯ�ҹ��</td>
				<td colspan="3">

					<p>��� ���ڿ� ���� �Ʒ��� ���� ��Ҽ����ᰡ �ΰ��˴ϴ�.<br> �����Ϻ��� ������ ������ �켱 ����ǿ��� �������ֽñ� �ٶ��ϴ�.</p>

					<table class="table text-center" style = "table-layout: auto; width: 100%; table-layout: fixed;">					
					<thead>
						<tr>
						<th scope="col" style="background-color:#FFE0B2;">�����</th>
						<th scope="col" style="background-color:#FFE0B2;">��Ҽ�����</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
						<td>�����ϱ��� 10�� ���ĺ���</td>
						<td>�����ݾ��� 100% ȯ��</td>
						</tr>
						
						<tr>
						<td>�����ϱ��� 9�� ~ 7�� ��</td>
						<td>�����ݾ��� 90% ȯ��</td>
						</tr>
						
						<tr>
						<td>�����ϱ��� 6�� ~ 3�� ��</td>
						<td>�����ݾ��� 80% ȯ��</td>
						</tr>
						
						<tr>
						<td>�����ϱ��� 2�� ~ ������ ��</td>
						<td>�����ݾ��� 70% ȯ��</td>
						</tr>
						
						<tr>
						<td>������ ����</td>
						<td>��� �Ұ���</td>
						</tr>
					</tbody>
					</table>
				</td>
				</tr>
			</tbody>
			</table>
		</div>
	</div>
</div>
</div>

</body>
</html>

<script>
var actor = new Array();

<c:forEach var="actors" items="${getPart }">
actor.push("${actors.cast_Name}");
</c:forEach>

actor.join(',');
$("#actors").text(actor);
</script>