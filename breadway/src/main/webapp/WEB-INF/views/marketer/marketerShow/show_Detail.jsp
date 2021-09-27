<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
	<title>������ �󼼺���������</title>
</head>
<c:import url="/marketer_top" />
<style>
    a:hover {
  		color : orange;
	}
</style>
<script type="text/javascript">
	function delCheck(reservedNum){
		var select = confirm("�������� �����Ͻðڽ��ϱ�?");
		if(select){
			if(reservedNum > 0){
				alert("��� ���� �ǿ� ���Ͽ� ȯ���� ���� �������ּ���!");
			}
			else if(reservedNum = 0){
			location.href="show_Detail_Delete_Ok.mkt";
			alert("�����Ǿ����ϴ�.");
			}
		}
	}
</script>
<div align="center" class="container" style="margin-top:30px;">
	<form action="show_Detail_Update.mkt" method="post" enctype="multipart/form-data">
		<input type="hidden" name="marketer_UID" value="${sessionScope.marketer_UID}">
		<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
		<c:forEach var="sList" items="${list_showDetail}">
			<h2>������&lt;${sList.show_Name}&gt; ����</h2>
			<input type="hidden" name="show_Status" value="${sList.show_Status}">
			<table border="1" width="100%" class="table table-fixed table-bordered">
				<tr>
					<th class="text-center" width="20%">Musical Name</th>
					<td>
						${sList.show_Name}
						<input type="hidden" name="show_Name" value="${sList.show_Name}">
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Organizer</th>
					<td>${sList.show_Organizer}</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Poster</th>
					<td>
					<img src="<spring:url value='/resources/files/show/${sList.posterName}' />" class="aligncenter" width="200" height="250">
					<p><p>
					Selected Poster Name: ${sList.posterName}</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Held Location</th>
					<td>${area_Name} ${theatre_Name}</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Start Date</th>
					<td>
						<fmt:parseDate value="${sList.startDate}" pattern="yyyy-MM-dd HH:mm:ss" var="startDate"/>
						<fmt:formatDate value="${startDate}" pattern="yyyy�� MM�� dd��" />
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical End Date</th>
					<td>
						<fmt:parseDate value = "${sList.endDate}" pattern="yyyy-MM-dd HH:mm:ss" var="endDate"/>
						<fmt:formatDate value="${endDate}" pattern="yyyy�� MM�� dd��" />
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Genre</th>
					<td>${sList.genre}</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Rate</th>
					<td>${sList.rate} ������</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Duration</th>
					<td>${sList.duration}��</td>
				<tr>
					<th class="text-center" width="20%">Musical Role List</th>
					<td lang="zh">
						<p>
						<c:forEach var="roleList" items="${newRoleList}" varStatus="loop">
							${roleList} �
							<c:if test="${!loop.last}">, </c:if>
						</c:forEach>
					</td>
				</tr>	
				<tr>
					<th class="text-center" width="20%">Musical Detail</th>
					<td>${sList.detail}</td>
				</tr>	
				<tr>
					<th class="text-center" width="20%">Musical Notice</th>
					<td>${sList.notice}</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Teaser Link</th>
					<td><a href="${sList.videoLink}" target='_blank'>${sList.videoLink}</a></td>
				</tr>	
			</table>
			<br>
				<c:if test="${empty mode}">
					<button type="submit" class="btn btn-secondary">�����ϱ�</button>
					&nbsp;&nbsp;
					<button type=button class="btn btn-secondary" onclick="javascript:delCheck(${reservedNum})">�����ϱ�</button>
					&nbsp;&nbsp;
				</c:if>
			<button type="button" class="btn btn-secondary" onclick="window.location='cast_All.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">ĳ��Ʈ ����Ʈ ��ȸ</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-secondary" onclick="window.location='schedule_All.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">������ ����Ʈ ��ȸ</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-secondary" onclick="window.location='profit_Seat.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">���� ��Ȳ ����</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">���������� ���ư���</button>
		</c:forEach>
	</form>
</div>