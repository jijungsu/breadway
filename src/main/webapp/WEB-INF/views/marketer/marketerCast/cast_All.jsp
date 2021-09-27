<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
	<title>ĳ��Ʈ ��ü ����Ʈ</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function delCheck(cast_ID){
		var select = confirm("ĳ��Ʈ�� �����Ͻðڽ��ϱ�? ���� ĳ���� ���ϵ� �����Ͻñ� �ٶ��ϴ�.");
		if(select){
			location.href="cast_Delete_Ok.mkt?cast_ID="+ cast_ID;
			alert("�����Ǿ����ϴ�.");
		}
	}
</script>
<div align="center" class="container" style="margin-top:30px;">
	<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
	<h2>������&lt;${sessionScope.show_Name}&gt; ĳ��Ʈ ����Ʈ</h2>
	<form name="selectForm" method="post">
			<select name="searchByRole" class="form-control" onChange="document.selectForm.submit();">
				<option value="">�迪 ����</option>
				<option value="all">��ü����Ʈ</option>
				<c:forEach var="i" items="${newRoleList}">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>
	</form>
	<c:choose>
		<c:when test="${empty list_castInfo}">
			<tr>
				<td colspan="4">��ϵ� ������ ĳ��Ʈ�� �����ϴ�.</td>
			</tr>	
		</c:when>
		<c:otherwise>
			<table border="1" width="100%" class="table table-bordered">
				<thead align="center">
					<tr>
						<th>Cast Photo</th>
						<th>Cast Name</th>
						<th>Play Part</th>
						<th>���� | ����</th>
					</tr>
				</thead>
					<c:forEach var="cList" items="${list_castInfo}">
						<input type="hidden" name="cast_ID" value="${cList.cast_ID}">
						<tr>
							<td align="center">
								<img src="<spring:url value='/resources/files/cast/${cList.cast_PhotoName}' />" class="aligncenter" width="100" height="110">
							</td>
							<td align="center">${cList.cast_Name}</td>
							<td align="center">${cList.cast_Part}</td>
							<td align="center">
							<c:choose>
							<c:when test="${empty sessionScope.mode}">
								<button type="button" class="btn btn-secondary" onclick="window.location='cast_Update.mkt?cast_ID=${cList.cast_ID}'">����</button>
								<button type="button" class="btn btn-secondary" onclick="javascript:delCheck(${cList.cast_ID})">����</button>
							</c:when>
							<c:otherwise>
							����/���� �Ұ�
							</c:otherwise>
							</c:choose>
							</td>
						</tr>	
					</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	<p><p>
	<c:if test="${empty sessionScope.mode}">
		<button type="button" class="btn btn-secondary" onclick="window.location='cast_Add.mkt?show_ID=${sessionScope.show_ID}'">ĳ��Ʈ �߰�</button>
		&nbsp;&nbsp;
	</c:if>
	<button type="button" class="btn btn-secondary" onclick="window.location='cast_Pattern_All.mkt?show_ID=${sessionScope.show_ID}'">ĳ���� ���� ����</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='show_Detail.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">������ ������ ���ư���</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">������������ ���ư���</button>
</div>