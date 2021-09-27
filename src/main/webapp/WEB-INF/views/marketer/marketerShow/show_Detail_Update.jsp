<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
	<title>������ ����</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
 	function itemChange(selectItem){
 		var target = document.getElementById("select2");
 		
		var seoul = ["�뼺��ť���Ʈ����","���￹��������"];
		var incheon = ["�����Ʈ����","��õ��ȭ����ȸ��"];
		var daejeon = ["��������������"];
		var busan = ["�λ�帲������","�λ깮ȭȸ��"];
		var ulsan = ["��깮ȭ����ȸ��"];
		var daegu = ["�뱸������Ͽ콺"];
		var gwangju = ["���ֹ�ȭ����ȸ��"];
		var jaeju = ["�����Ѷ��ƮȦ"];

		var changeItem;
		
		if(selectItem.value == "����"){
			changeItem = seoul;
		}else if(selectItem.value == "��õ") {
			changeItem = incheon;
		} else if(selectItem.value == "����") {
			changeItem =  daejeon;
		}else if(selectItem.value == "�λ�") {
			changeItem =  busan;
		}else if(selectItem.value == "���") {
			changeItem =  ulsan;
		}else if(selectItem.value == "�뱸") {
			changeItem =  daegu;
		}else if(selectItem.value == "����") {
			changeItem =  gwangju;
		}else if(selectItem.value == "���ֵ�") {
			changeItem =  jaeju;
		}
		
		 target.options.length = 0;
		 
		 for (x in changeItem) {
			 var opt = document.createElement("option");
			 opt.value = changeItem[x];
			 opt.innerHTML = changeItem[x];
			 target.appendChild(opt);
		 }
		
	}
 	
 	
 	function nullCheck(){
		if (f.select1.value=="none"){
			alert("������ ������ �ּ���!");
			return;
		}
		if (f.startDate.value==""){
			alert("�������� ������ �ּ���!");
			return;
		}
		if (f.endDate.value==""){
			alert("�������� �Է��� �ּ���!");
			return;
		}
		var sDate = new Date(f.startDate.value);
		var eDate = new Date(f.endDate.value);
		if (eDate < sDate){
			alert("�������� ������ ���ķ� �������ּ���!");
			return;
		}
		if (f.genre.value=="none"){
			alert("�帣�� ������ �ּ���!");
			return;
		}
		if (f.duration.value==""){
			alert("�����ð��� �Է��� �ּ���!");
			return;
		}
		if (f.detail.value==""){
			alert("���� ������ �Է��� �ּ���!");
			return;
		}
		
		alert("�����Ǿ����ϴ�.");
	}
 	
 	
	function howToGetLink(){
		var win = window.open("howToGetLink", "YouTube ��ũ ���� ���", "width=800, height=700");
	}	
</script>
<div align="center" class="container" style="margin-top:30px;">

	<form name="f" action="show_Detail_Update_Ok.mkt" method="post" enctype="multipart/form-data">
		<input type="hidden" name="marketer_UID" value="${sessionScope.marketer_UID}">
		<input type="hidden" name="show_ID" value="${show_ID}">
		<c:forEach var="sList" items="${list_showDetail}">
			<h2>������&lt;${sList.show_Name}&gt; ����</h2>
			<input type="hidden" name="show_Status" value="${sList.show_Status}" class="form-control" required>
			<table border="1" width="100%" class="table table-fixed table-bordered">
				<tr>
					<th class="text-center" width="20%">Musical Name</th>
					<td><input type="text" name="show_Name" value="${sList.show_Name}" size="30" class="form-control-plaintext" readOnly></td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Organizer</th>
					<td><input type="text" name="show_Organizer" value="${sList.show_Organizer}" size="20" class="form-control-plaintext" readOnly></td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Poster</th>
					<td>
						<input type="file" accept="image/*" name="poster" class="form-control-file">
						<p><p>selected: ${sList.posterName}
						<input type="hidden" name="poster2" value="${sList.posterName}">
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Held Location</th>
					<td>
						<select id="select1" onchange="itemChange(this)" class="form-control form-control-sm">
								<c:forEach var="aList" items="${list_Area}">
									<c:choose>
										<c:when test="${area_Name == aList.area_Name}">
											<option value="${area_Name}" selected>${area_Name}</option>
										</c:when>
										<c:otherwise>
											<option value="${aList.area_Name}">${aList.area_Name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</select>
						<select name="theatre_Name" id="select2" class="form-control form-control-sm">
							<c:forEach var="tList" items="${list_Theatre}">
									<c:choose>
										<c:when test="${theatre_Name == tList.theatre_Name}">
											<option value="${theatre_Name}" selected>${theatre_Name}</option>
										</c:when>
										<c:otherwise>
											<option value="${tList.theatre_Name}">${tList.theatre_Name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Start Date</th>
					<td>
						<fmt:parseDate value = "${sList.startDate}" pattern="yyyy-MM-dd HH:mm:ss" var="startDate"/>
						<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" var="startDate"/>
						<input type="date" name="startDate" value="${startDate}" placeholder="yyyy-MM-dd" class="form-control" required>
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical End Date</th>
					<td>
						<fmt:parseDate value = "${sList.endDate}" pattern="yyyy-MM-dd HH:mm:ss" var="endDate"/>
						<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" var="endDate"/>
						<input type="date" name="endDate" value="${endDate}" placeholder="yyyy-MM-dd" class="form-control" required>
						</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Genre</th>
					<td>
						<select name="genre" class="form-control">
								<c:forEach var="i" items="${genreList}">
									<c:choose>
										<c:when test="${sList.genre == i}">
											<option value="${sList.genre}" selected>${sList.genre}</option>
										</c:when>
									<c:otherwise>
										<option value="${i}">${i}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>	
						</select>
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Rate</th>
					<td>
						<select name="rate" class="form-control">
								<c:forEach var="i" items="${rateList}">
									<c:choose>
										<c:when test="${sList.rate ==i}">
											<option value="${sList.rate}" selected>${sList.rate} ������</option>
										</c:when>
									<c:otherwise>
										<option value="${i}">${i} ������</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>	
						</select>
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Duration</th>
					<td><input type="text" name="duration" value="${sList.duration}"  class="form-control" required>* ���� : ��(min)</td>
				<tr>
					<th class="text-center" width="20%">Musical Role List</th>
					<td lang="zh">
						<c:forEach var="roleList" items="${newRoleList}" varStatus="loop">
							${roleList} �
							<c:if test="${!loop.last}">, </c:if>
						</c:forEach>
							<p>
						<p>
					</td>
				</tr>	
				<tr>
					<th class="text-center" width="20%">Musical Detail</th>
					<td><textarea name="detail" rows="10" cols="100%" class="form-control" required>${sList.detail}</textarea></td>
				</tr>	
				<tr>
					<th class="text-center" width="20%">Musical Notice</th>
					<td><textarea name="notice" rows="5" cols="100%" class="form-control" required>${sList.notice}</textarea></td>
				</tr>
				<tr>
				<th class="text-center" width="20%">Musical Teaser Link</th>
				<td>
					<input type="text" name="videoLink" value="${sList.videoLink}" class="form-control">
					<p><p>* YouTube�� ���� �����մϴ�. ��ũ �������� ���� Ȯ�����ּ���!</p>
					<button type="button" class="btn btn-secondary" onclick="javascript:howToGetLink()" >��ũ �������� ���</button>
				</td>
			</tr>	
			</table>
			<br>
			<button type="submit" class="btn btn-secondary" onclick="javascript:nullCheck()">�����ϱ�</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-secondary" onclick="history.back()">���</button>
		</c:forEach>
	</form>
</div>