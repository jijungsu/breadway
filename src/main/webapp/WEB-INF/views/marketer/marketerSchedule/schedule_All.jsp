<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
	<title>������ ����Ʈ</title>
</head>
<c:import url="/marketer_top" />
<div align="center" class="container" style="margin-top:30px;">
	<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
	<h2>������&lt;${sessionScope.show_Name}&gt; ������ ����Ʈ</h2>
	<c:choose>
		<c:when test="${empty list_schedule}">
			<tr>
				<td colspan="4">��ϵ� �������� �����ϴ�.</td>
			</tr>	
		</c:when>
		<c:otherwise>
			<table border="1" width="100%" class="table table-bordered">
				<thead>
					<tr align="center" bgcolor="#c9e5ff">
						<th>schedule Number</th>
						<th>scheduled Date</th>
						<th>scheduled Time</th>
						<th>schedule Detail</th>
					</tr>
				</thead>
					<c:forEach var="sList" items="${list_schedule}" varStatus="status">
						<input type="hidden" name="schedule_ID" value="${sList.schedule_ID}">
						<tr>
							<td align="center" bgcolor="#ebebeb">${status.count}</td>
							<td align="center">
								<fmt:parseDate value="${sList.schedule_Date}" pattern="yyyy-MM-dd HH:mm:ss" var="schedule_Date"/>
								<fmt:formatDate value="${schedule_Date}" pattern="yyyy�� MM�� dd��" />
							</td>
							<td align="center">${sList.schedule_Time}</td>
							<td align="center"><a href="schedule_detail.mkt?schedule_ID=${sList.schedule_ID}">�ڼ��� ����</a></td>
						</tr>	
					</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	<p><p>
	<c:if test="${empty mode}">
		<button type="button" class="btn btn-secondary" onclick="window.location='schedule_Add.mkt?show_ID=${sessionScope.show_ID}'">������ �߰�</button>
		&nbsp;&nbsp;
	</c:if>
	<button type="button" class="btn btn-secondary" onclick="window.location='show_Detail.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">������ ������ ���ư���</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">������������ ���ư���</button>
</div>