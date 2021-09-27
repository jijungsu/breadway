<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
	<title>����������</title>
</head>
<c:import url="/marketer_top" />
<script type ="text/javascript">
	function logout(){
		var select = confirm("�α׾ƿ� �Ͻðڽ��ϱ�?");
		if(select){
			location.href="logout.do"
		}
	}
</script>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="1">
<div class="container">
 <div class="row">
	<nav class="col-sm-3 col-4" id="myScrollspy">
      <ul class="nav nav-pills flex-column" style="font-size: 18px;">
        <li class="nav-item">
          <a class="nav-link active" href="#section1">�� ������</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#section2">��ü ��ǰ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#section3">������ ���� ��� ��ǰ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#section4">�Ǹ� ���� ��ǰ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#section5">�Ǹ� ���� ��ǰ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#section6">�Ǹ� ���� ��ǰ</a>
        </li>
      </ul>
   </nav>
	<div class="col-sm-9 col-8">
      <div id="section1">    
        <h3>�� ������</h3>
        <p>
			<form action="profile_Update.mkt" method="post">
				<input type="hidden" name="marketer_UID" value="${sessionScope.marketer_UID}">
				<table border="1" class="table table-bordered">
					<c:forEach var="pList" items="${profile_list}">
						<tr>
							<th class="text-center" width="10%">Marketer ID</th>
							<td width="25%">
								${pList.marketer_ID}
								<input type="hidden" name="marketer_ID" value="${pList.marketer_ID}">
							</td>
						</tr>
						<tr>
							<th class="text-center" width="10%">Name</th>
							<td width="25%">
								${pList.marketer_Name}
								<input type="hidden" name="marketer_Name" value="${pList.marketer_Name}">
							</td>
						</tr>			
						<tr>
							<th class="text-center" width="10%">Email</th>
							<td width="25%">
								${pList.marketer_Email}
								<input type="hidden" name="marketer_Email" value="${pList.marketer_Email}">
							</td>
						</tr>		
						<tr>
							<th class="text-center" width="10%">Phone</th>
							<td width="25%">
								${pList.marketer_Phone}
								<input type="hidden" name="marketer_Phone" value="${pList.marketer_Phone}">
							</td>
						</tr>	
					</c:forEach>
				</table>
				<p><p>
				<button type="submit" class="btn btn-secondary" style="float: right;">������ ����</button>
			</form>
      </div>
      <p>
      <div id="section2"> 
		<h3>��ü ��ǰ (�� ${allshowCount}���� ��ǰ)</h3>
        <p><p>
			<table border="1" class="table table-hover table-bordered" >
				<thead>
					<tr align="center">
						<th>��ǰ �̸�</th>
						<th>������</th>
						<th>������</th>
						<th>���� ����</th>
					</tr>
				</thead>
					<c:choose>
						<c:when test="${empty list_allShow}">
							<tr>
								<td colspan="4">��ϵ� �������� �����ϴ�.</td>
							</tr>	
						</c:when>
						<c:otherwise>
							<c:forEach var="sList" items="${list_allShow}">
								<tr>
									<td width="25%">${sList.show_Name}</td>
									<td align="center" width="20%">
										<fmt:parseDate value="${sList.startDate}" pattern="yyyy-MM-dd HH:mm:ss" var="startDate"/>
										<fmt:formatDate value="${startDate}" pattern="yyyy�� MM�� dd��" />
									</td>
									<td align="center" width="20%">
										<fmt:parseDate value="${sList.endDate}" pattern="yyyy-MM-dd HH:mm:ss" var="endDate"/>
										<fmt:formatDate value="${endDate}" pattern="yyyy�� MM�� dd��" />
									</td>
									<c:choose>
										<c:when test="${sList.show_Status==0}">
											 <td width="25%" align="center">���� ��� ��</td>
										</c:when>
										<c:when test="${sList.show_Status==1}">
											 <td width="25%" align="center">���� �Ϸ�</td>
										</c:when>
										<c:when test="${sList.show_Status==2}">
											 <td width="25%" align="center">���� �ݷ���</td>
										</c:when>
										<c:when test="${sList.show_Status==3}">
											 <td width="25%" align="center">���� ���� ��� ��</td>
										</c:when>
									</c:choose>
								</tr>		
							</c:forEach>
						</c:otherwise>
					</c:choose>			
			</table>
			<p><p>
			<button type="button" class="btn btn-secondary" onclick="window.location='show_Add.mkt'" style="float: right;">�� ������ ���</button>
		<p>
      </div>        
      <div id="section3">         
        <h3>�Ǹ� �� ���� ���� (�� ${plzshowCount}���� ��ǰ)</h3>
        <p><p>
			<table border="1" class="table table-hover table-bordered">
				<thead>
					<tr align="center">
						<th>��ǰ �̸�</th>
						<th>������</th>
						<th>������</th>
						<th>���� ����</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${empty list_plzShow}">
						<tr>
							<td colspan="4">���� ��� ���� �������� �����ϴ�.</td>
						</tr>	
					</c:when>
					<c:otherwise>
						<c:forEach var="sList" items="${list_plzShow}">
							<tr>
								<td width="25%"><a href="show_Detail.mkt?show_ID=${sList.show_ID}">${sList.show_Name}</a></td>
								<td align="center" width="20%">
									<fmt:parseDate value="${sList.startDate}" pattern="yyyy-MM-dd HH:mm:ss" var="startDate"/>
									<fmt:formatDate value="${startDate}" pattern="yyyy�� MM�� dd��" />
								</td>
								<td align="center" width="20%">
									<fmt:parseDate value="${sList.endDate}" pattern="yyyy-MM-dd HH:mm:ss" var="endDate"/>
									<fmt:formatDate value="${endDate}" pattern="yyyy�� MM�� dd��" />
								</td>
								<c:choose>
									<c:when test="${sList.show_Status==0}">
										 <td width="25%" align="center">���� ��� ��</td>
									</c:when>
									<c:when test="${sList.show_Status==1}">
										 <td width="25%" align="center">���� �Ϸ�</td>
									</c:when>
									<c:when test="${sList.show_Status==2}">
										 <td width="25%" align="center">���� �ݷ���</td>
									</c:when>
									<c:when test="${sList.show_Status==3}">
										 <td width="25%" align="center">���� ���� ��� ��</td>
									</c:when>
								</c:choose>
							</tr>	
						</c:forEach>
					</c:otherwise>
				</c:choose>		
		</table>
		<p>
      </div>
      <div id="section4">         
        <h3>�Ǹ� ���� (�� ${willshowCount}���� ��ǰ)</h3>
        <p><p>
			<table border="1" class="table table-hover table-bordered">
				<thead>
					<tr align="center">
						<th>��ǰ �̸�</th>
						<th>������</th>
						<th>������</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${empty list_willShow}">
						<tr>
							<td colspan="3">�Ǹ� ������ �������� �����ϴ�.</td>
						</tr>	
					</c:when>
					<c:otherwise>
						<c:forEach var="sList" items="${list_willShow}">
							<tr>
								<td width="30%"><a href="show_Detail.mkt?show_ID=${sList.show_ID}">${sList.show_Name}</a></td>
								<td align="center" width="20%">
									<fmt:parseDate value="${sList.startDate}" pattern="yyyy-MM-dd HH:mm:ss" var="startDate"/>
									<fmt:formatDate value="${startDate}" pattern="yyyy�� MM�� dd��" />
								</td>
								<td align="center" width="20%">
									<fmt:parseDate value="${sList.endDate}" pattern="yyyy-MM-dd HH:mm:ss" var="endDate"/>
									<fmt:formatDate value="${endDate}" pattern="yyyy�� MM�� dd��" />
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>			
		</table>
		<p>
      </div>      
      <div id="section5">         
        <h3>�Ǹ� �� (�� ${nowshowCount}���� ��ǰ)</h3>
        <p><p>
			<table border="1" class="table table-hover table-bordered">
				<thead>
					<tr align="center">
						<th>��ǰ �̸�</th>
						<th>������</th>
						<th>������</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${empty list_nowShow}">
						<tr>
							<td colspan="3">�Ǹ� ���� �������� �����ϴ�.</td>
						</tr>	
					</c:when>
					<c:otherwise>
						<c:forEach var="sList" items="${list_nowShow}">
							<tr>
								<td width="30%"><a href="show_Detail.mkt?show_ID=${sList.show_ID}">${sList.show_Name}</a></td>
								<td align="center" width="20%">
									<fmt:parseDate value="${sList.startDate}" pattern="yyyy-MM-dd HH:mm:ss" var="startDate"/>
									<fmt:formatDate value="${startDate}" pattern="yyyy�� MM�� dd��" />
								</td>
								<td align="center" width="20%">
									<fmt:parseDate value="${sList.endDate}" pattern="yyyy-MM-dd HH:mm:ss" var="endDate"/>
									<fmt:formatDate value="${endDate}" pattern="yyyy�� MM�� dd��" />
								</td>
							</tr>	
						</c:forEach>
					</c:otherwise>
				</c:choose>				
			</table>
			<p>
      </div>
      <div id="section6">         
       <h3>�Ǹ� ���� (�� ${doneshowCount}���� ��ǰ)</h3>
        <p><p>
			<table border="1" class="table table-hover table-bordered">
				<thead>
					<tr align="center">
						<th>��ǰ �̸�</th>
						<th>������</th>
						<th>������</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${empty list_doneShow}">
						<tr>
							<td  colspan="3">�Ǹ� ����� �������� �����ϴ�.</td>
						</tr>	
					</c:when>
					<c:otherwise>
						<c:forEach var="sList" items="${list_doneShow}">
							<tr>
								<td width="30%"><a href="show_Detail.mkt?show_ID=${sList.show_ID}&mode=done">${sList.show_Name}</a></td>
								<td align="center" width="20%">
									<fmt:parseDate value="${sList.startDate}" pattern="yyyy-MM-dd HH:mm:ss" var="startDate"/>
									<fmt:formatDate value="${startDate}" pattern="yyyy�� MM�� dd��" />
								</td>
								<td align="center" width="20%">
									<fmt:parseDate value="${sList.endDate}" pattern="yyyy-MM-dd HH:mm:ss" var="endDate"/>
									<fmt:formatDate value="${endDate}" pattern="yyyy�� MM�� dd��" />
								</td>
							</tr>		
						</c:forEach>
					</c:otherwise>
				</c:choose>				
			</table>
      </div>
    </div>
  </div>
</div>
</body>