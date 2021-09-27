<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- showmanage_seatrequest.jsp --> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="������ ������ ���� ���� ��� ��û"></c:param>
</c:import>
<script type="text/javascript">
	function RequestResultWindowOpen(order_num,schedule_ID){
		window.open("showmanage_seatrequestcancel.do?order_num="+order_num+"&schedule_ID="+schedule_ID,"�¼� ����", "width=600, height=500, left = 300, top = 300, resizable=no, scrollbars=no");
	}	
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
	<style>
		.w3-lobster {
		  font-family: "Lobster", serif;
		}
		.w3-button {width:150px;}
</style>
<div align = "center">
	<br>
		<div class="w3-container w3-lobster">
		 	<p class="w3-xxlarge">Seat Request Check</p>
		</div>
	<br>
	<br>
	<div align = "center" style="width:70%">
	<table border = "1" class="w3-table w3-striped w3-border">
		<tr> 
			<th align = "center">���� ��¥</th>
			<th align = "center">���� �¼�</th>
			<th align = "center">���� �¼� ����</th>
			<th align = "center">�¼� ����</th>
			<th align = "center">������</th>
			<th align = "center">�ֹ� ��ȣ</th>
			<th align = "center">�ֹ� ����</th>
			<th align = "center">���� ���</th><!-- �����ڰ� ������Ҹ� �� ���� reserve_status = 0  -->
		</tr>
		<c:if test = "${empty requestlist}">
		<tr>
			<td colspan = "8" align = "center">
			<div align = "center">
				������ �����ϴ�.<br>
				�ڷ� ���ư� �ּ��� <br>
				<h2><a href = "javascript:history.back();">�ڷ� ����</a></h2>
			</div>
			</td>
		</tr>
		</c:if>
		<c:forEach var = "dto" items = "${requestlist}">
			<tr>
				<td align = "center">${fn:substring(dto.reserve_Date,0,10)}</td>
				<td align = "center">${dto.seat_Name}</td>
				<td align = "center">${dto.seat_Price}</td>
				<td align = "center">${dto.seat_Discount}</td>
				<td align = "center">${dto.consumer_Name}</td>
				<td align = "center">${dto.order_Num}</td>
				<c:if test = "${dto.reserve_Status == 0}">
					<td align = "center">���� ��� ����</td>
				</c:if>
				<c:if test = "${dto.reserve_Status == 1}">
					<td align = "center">���� ����</td>
				</c:if>	
				<c:choose>
					<c:when test = "${empty dto.reserve_Cancel_Date}">
						<td align = "center">
							<a href = "javascript:RequestResultWindowOpen(${dto.order_Num},${dto.schedule_ID});">(���)</a>
						</td>
					</c:when>
					<c:otherwise>
						<td align = "center">�Ϸ�</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
	</div>
	<br>
	<br>
	<div class = "w3-center">	
	<div class="w3-bar">
	<c:if test = "${not empty requestlist}">
		<c:if test="${rowCount>0}">
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}"></c:set>
			</c:if>
			<c:if test="${startPage > pageBlock}">
				<a href="showmanage_seatrequest.do?pageNum=${startPage - pageBlock}&show_id=${show_id}&schedule_id=${schedule_id}" class="w3-button w3-bar-item">&laquo;</a>
				</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="showmanage_seatrequest.do?pageNum=${i}&show_id=${show_id}&schedule_id=${schedule_id}" class="w3-button w3-bar-item">${i}</a>
			</c:forEach> 
				<c:if test="${endPage < pageCount}">				
				<a href="showmanage_seatrequest.do?pageNum=${startPage + pageBlock}&show_id=${show_id}&schedule_id=${schedule_id}" class="w3-button w3-bar-item">&raquo;</a>
			</c:if>
		</c:if>
	</c:if>
	</div>
	</div>
</div>