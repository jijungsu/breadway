<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<title>ĳ���� ���� ����Ʈ</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function delCheck(index){
		var select = confirm("������ �����Ͻðڽ��ϱ�?");
		if(select){
			location.href="cast_Pattern_Delete.mkt?pNum="+index;
			alert("�����Ǿ����ϴ�.");
		}
	}
	
	function castCheck(CastSize, show_ID){
		if(1 > CastSize){
			alert("ĳ��Ʈ�� ���� ������ּ���!");
			return;
		}else{
			window.location="cast_Pattern_Add.mkt?show_ID=" + show_ID;
		}
	}
</script>
<div align="center" style="margin-top:30px;">
	<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
	<h2>������&lt;${sessionScope.show_Name}&gt; ĳ���� ����</h2>
	<c:choose>
		<c:when test="${CastNames.size() <= count_role}">
			<tr>
				<td colspan="4">��ϵ� ĳ��Ʈ ������ �����ϴ�.</td>
			</tr>	
		</c:when>
		<c:otherwise>
		<c:if test="${empty sessionScope.mode}">
			* �����Ϸ��� ���� ��ȣ�� Ŭ���ϼ���.
		</c:if>
		<p><p>
		<table border="1"  width="100%" class="table table-sm table-bordered">
			<tr align="center">
				<th>Role</th>
				<td rowspan="${count_roleSet + 1}">
					<table class="table">
						<tr>
							<c:forEach var="cList" items="${CastNames}" varStatus="status">
								<c:choose>
									<c:when test="${status.count <= count_role}">
										<td align="center" style="background-color:#ebebeb" lang="zh">${cList} �</td>
									</c:when>
									<c:otherwise>
										<td align="center">${cList}</td>
									</c:otherwise>
								</c:choose>
								<c:if test="${status.count % count_role == 0}">
									<tr>
								</c:if>
							</c:forEach>
						</tr>
					</table>
				</td>
				<c:forEach begin="1" end="${count_roleSet - 1}" varStatus="status">
					<tr align="center" style="background-color:#c9e5ff">
						<th>
						<c:choose>
							<c:when test="${empty sessionScope.mode}">
								<a href="javascript:delCheck(${status.index-1})">Pattern ${status.index}</a>
							</c:when>
							<c:otherwise>
								Pattern ${status.index}
							</c:otherwise>
							</c:choose>
						</th>
					</tr>
				</c:forEach>
			</table>
	</c:otherwise>
</c:choose>
<p><p>
<c:if test="${empty mode}">
	<button type="button" class="btn btn-secondary" onclick="javascript:castCheck(${sessionScope.list_castInfo.size()}, ${sessionScope.show_ID})">ĳ���� ���� �߰�</button>
		&nbsp;&nbsp;	
</c:if>
	<button type="button" class="btn btn-secondary" onclick="window.location='cast_All.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">ĳ��Ʈ ����Ʈ�� ���ư���</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='show_Detail.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">������ ������ ���ư���</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">������������ ���ư���</button>
</div>
