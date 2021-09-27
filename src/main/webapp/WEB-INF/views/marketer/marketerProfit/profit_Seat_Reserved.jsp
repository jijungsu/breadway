<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<title>�����ٺ� ���� ����Ʈ</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function delCheck(order_Num, schedule_ID, today, schedule_Date){
		var select=confirm("���Ÿ� ����Ͻðڽ��ϱ�? �ֹ���ȣ �������� �¼��� ��� ��ҵ˴ϴ�.");
		if(select){
			location.href="cancel_reserve.mkt?order_Num="+order_Num +"&schedule_ID="+schedule_ID;
			alert("��ҵǾ����ϴ�.");
		}
	}
</script>
<div align="center" class="container" style="margin-top:30px;">
<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
	<h2>������&lt;${sessionScope.show_Name}&gt; �����ٺ� ���� ����Ʈ</h2>
	<table border="1" width="50%" class="table table-bordered">
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<fmt:parseDate var="sch_Date" value="${sessionScope.schedule_Date}" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate var="today" value="${today}" pattern="yyyyMMdd"/>
		<fmt:formatDate var="sch_Date" value="${sch_Date}" pattern="yyyyMMdd"/>
		<thead>
			<tr align="center">
				<th>�ֹ� ��ȣ</th>
				<th>�¼� �̸�</th>
				<th>�����ڸ�</th>
				<th>������ ����ó</th>
				<th>���� ����</th>
				<th>���� ���</th>
			</tr>
		</thead>
		<c:if test="${empty reservedList}">
		<tr>
			<td colspan="6" align="center">
				���� �Ϸ�� �¼��� �����ϴ�.
			</td>
		</tr>
		</c:if>
		<c:forEach var="dto" items="${reservedList}" varStatus="status">
			<tr>
				<td align="center">${dto.order_Num}</td>
				<td align="center">${dto.seat_Name}</td>
				<td align="center">${cInfo.get(status.index).getConsumer_Name()}</td>
				<td align="center">${cInfo.get(status.index).getConsumer_Phone()}</td>
				<c:choose>
					<c:when test="${dto.reserve_Status == 1}">
						<td align="center">���� �Ϸ�</td>
						<td align="center">
							<c:choose>
								<c:when test="${sch_Date < today}">
									��� �Ұ�
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-secondary" onclick="javascript:delCheck(${dto.order_Num}, ${dto.schedule_ID});">���� ����ϱ�</button>
								</c:otherwise>
							</c:choose>
						</td>
					</c:when>
					<c:when test="${dto.reserve_Status == 0}">
						<td align="center">���� ��ҵ�</td>
						<td align="center"></td>
					</c:when>
					<c:otherwise><td align="center">���� �߻�!</td><td></td></c:otherwise>
				</c:choose>
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
			<a href="profit_Seat.mkt?pageNum=${i}&show_ID=${sessionScope.show_ID}">[${i}]</a>
		</c:forEach> 
			<c:if test="${endPage < pageCount}">				
			<a href="profit_Seat.mkt?pageNum=${startPage + pageBlock}&show_ID=${sessionScope.show_ID}">[����]</a>
		</c:if>
	</c:if>
	<p><p>
	<button type="button" class="btn btn-secondary" onclick="window.location='profit_Seat.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">���� ��Ȳ �������� ���ư���</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='show_Detail.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">������ ������ ���ư���</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">���������� ���ư���</button>
</div>