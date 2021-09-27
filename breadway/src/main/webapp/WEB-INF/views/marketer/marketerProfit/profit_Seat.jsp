<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<title>�����ٺ� ���� ��Ȳ</title>
</head>
<c:import url="/marketer_top" />
<div align="center"  class="container" style="margin-top:30px;">
<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
	<h2>������&lt;${sessionScope.show_Name}&gt; �����ٺ� ���� ��Ȳ</h2>
	<p>
	<table border="1" width="50%" class="table table-bordered">
		<thead>
			<tr align="center">
				<th>���� ��¥</th>
				<th>���� �ð�</th>
				<th>�¼� ����</th>
				<th>����</th>
				<th>���� ����Ʈ</th>
			</tr>
		</thead>
		<c:if test="${empty schedulelist}">
		<tr>
			<td colspan="5" align="center">
				�������� �����ϴ�.
		</tr>
		</c:if>
		<c:forEach var="dto" items="${schedulelist}">
			<tr align="center" >
				<td>
					${fn:substring(dto.schedule_Date,0,10)}
					<c:set var="today" value="<%=new java.util.Date()%>" />
					<fmt:parseDate var="eDate" value="${dto.schedule_Date}" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate var="today" value="${today}" pattern="yyyyMMdd"/>
					<fmt:formatDate var="eDate" value="${eDate}" pattern="yyyyMMdd"/>
				</td>
				<td >${dto.schedule_Time}</td>
				<td>
					<button type="button" class="btn btn-secondary"  onclick="window.location='profit_Seat_Content.mkt?show_ID=${sessionScope.show_ID}&schedule_ID=${dto.schedule_ID}'">�¼� ����</button>
				</td>
				<td >
					<c:choose>
						<c:when test="${dto.reserve_seat_qty >= 0}">
							<c:choose>
								<c:when test="${eDate > today}">
									�Ǹ� ��
								</c:when>
								<c:when test="${eDate == today}">
									�Ǹ� ������
								</c:when>
								<c:when test="${eDate < today}">
									�Ǹ� ����
								</c:when>
							</c:choose>
						</c:when>
						<c:when test="${dto.reserve_seat_qty == totalSeatNum}">����</c:when>
						<c:when test="${dto.reserve_seat_qty < 0}">���� �߻�</c:when>
					</c:choose>
				</td>
				<td>
					<button type="button" class="btn btn-secondary"  onclick="window.location='profit_Seat_Reserved.mkt?schedule_ID=${dto.schedule_ID}&schedule_Date=${dto.schedule_Date}'">���� ����Ʈ ����</button>
				</td>
				<c:set var="show_ID" value="${sessionScope.show_ID}"/>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${rowCount>0}">
		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount}"></c:set>
		</c:if>
		<c:if test="${startPage > pageBlock}">
			<a href="profit_Seat.mkt?pageNum=${startPage - pageBlock}&show_ID=${sessionScope.show_ID}">[����]</a>
			</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<a href="profit_Seat.mkt?pageNum=${i}&show_ID=${sessionScope.show_ID}"> [${i}] </a>
		</c:forEach>
			<c:if test="${endPage < pageCount}">				
			<a href="profit_Seat.mkt?pageNum=${startPage + pageBlock}&show_ID=${sessionScope.show_ID}">[����]</a>
		</c:if>
	</c:if>
	<p><p><p><p>
	<table border="1" width="30%" class="table table-bordered">
		<tr>
			<td class="text-center" width="30%" bgcolor="#ffd6b3" style="font-weight:bold">���� �Ѹ���</td>
			<td align="right">
				<fmt:formatNumber value="${profitAll}" pattern="###,###��"/>
				<input type="hidden" name="profitAll" value="${profitAll}">
			</td>
		</tr>
	</table>
	<p><p>
	<button type="button" class="btn btn-secondary" onclick="window.location='show_Detail.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">������ ������ ���ư���</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">���������� ���ư���</button>
</div>