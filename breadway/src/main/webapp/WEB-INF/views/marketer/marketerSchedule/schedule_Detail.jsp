<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
	<title>ĳ��Ʈ ��ü ����Ʈ</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function delCheck(schedule_ID){
		var select = confirm("�������� �����Ͻðڽ��ϱ�?");
		if(select){
			location.href="schedule_Delete_Ok.mkt?schedule_ID="+schedule_ID;
		}
		alert("�����Ǿ����ϴ�.");
	}
</script>
<div align="center" style="margin-top:30px;">
	<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
	<h2>������&lt;${sessionScope.show_Name}&gt; ������</h2>
	<c:forEach var="sList" items="${get_schedule}">
	<input type="hidden" name="schedule_ID" value="${sList.schedule_ID}">
		<table border="1" width="100%"  class="table table-bordered table-sm">
			<tr align="center">
				<th>scheduled Date</th>
				<td align="left">
					<fmt:parseDate value="${sList.schedule_Date}" pattern="yyyy-MM-dd HH:mm:ss" var="schedule_Date"/>
					<fmt:formatDate value="${schedule_Date}" pattern="yyyy�� MM�� dd��" />
				</td>
			</tr>
			<tr align="center" >
				<th bgcolor="#c9e5ff">scheduled Time</th>
				<td align="left">${sList.schedule_Time}</td>
			<tr align="center">
				<th align="center" bgcolor="#c9e5ff">scheduled Cast</th>
				<td>
					<table border="1" width="100%">
						<c:forEach var="newRoleList" items="${newRoleList}">
							<td align="center" bgcolor="#ebebeb" lang="zh">${newRoleList} �</td>
						</c:forEach>
						<tr>
						<c:forEach var="newscheduledCasts" items="${newscheduledCasts}">
							<td align="center">${newscheduledCasts}</td>
						</c:forEach>
					</table>
				</td>
			</table>
		<br>
		<c:if test="${empty mode}">
			<button type="button" class="btn btn-secondary" onclick="window.location='schedule_Update.mkt?schedule_ID=${sList.schedule_ID}'">������ �����ϱ�</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-secondary" onclick="javascript:delCheck(${sList.schedule_ID})">������ �����ϱ�</button>
			&nbsp;&nbsp;
		</c:if>
	</c:forEach>
	<p><p>
	<button type="button" class="btn btn-secondary" onclick="window.location='schedule_All.mkt?mode=${sessionScope.mode}'">������ ����Ʈ�� ���ư���</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='show_Detail.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">������ ������ ���ư���</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">������������ ���ư���</button>
</div>