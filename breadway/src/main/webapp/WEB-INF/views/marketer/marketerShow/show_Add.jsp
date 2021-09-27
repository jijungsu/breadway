<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<title>������ ���</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function add_textbox(){
		let role_space = document.getElementById("role_space");
		let createBox = document.createElement("createBox");
		createBox.innerHTML = "<input type='text' name='role_box' class='form-control'><p>";
		role_space.appendChild(createBox);
	}
	
	
 	function SelectLocation(selectItem){
 		let target = document.getElementById("select2");
 		
		let seoul = ["�뼺��ť���Ʈ����","���￹��������"];
		let incheon = ["�����Ʈ����","��õ��ȭ����ȸ��"];
		let daejeon = ["��������������"];
		let busan = ["�λ�帲������","�λ깮ȭȸ��"];
		let ulsan = ["��깮ȭ����ȸ��"];
		let daegu = ["�뱸������Ͽ콺"];
		let gwangju = ["���ֹ�ȭ����ȸ��"];
		let jaeju = ["�����Ѷ��ƮȦ"];

		let changeItem;
		
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
			 let opt = document.createElement("option");
			 opt.value = changeItem[x];
			 opt.innerHTML = changeItem[x];
			 target.appendChild(opt);
		 }
	}
 	
 	
 	function nullCheck(){
		if (fff.show_Name.value==""){
			alert("�����ø��� �Է��� �ּ���!");
			fff.show_Name.focus();
			return;
		}
		if (fff.show_Organizer.value==""){
			alert("���ֻ縦 �Է��� �ּ���!");
			return;
		}
		if (fff.poster.value==""){
			alert("�����͸� ������ �ּ���!");
			return;
		}
		if (fff.select1.value=="none"){
			alert("������ ������ �ּ���!");
			return;
		}
		if (fff.startDate.value==""){
			alert("�������� ������ �ּ���!");
			return;
		}
		var sDate = new Date(fff.startDate.value);
		var today = new Date();
		if (sDate < today){
			alert("�������� ���� ��¥ ���ķ� �������ּ���!");
			return;
		}
		if (fff.endDate.value==""){
			alert("�������� �Է��� �ּ���!");
			return;
		}
		var eDate = new Date(fff.endDate.value);
		if (eDate < sDate){
			alert("�������� ������ ���ķ� �������ּ���!");
			return;
		}
		if (fff.genre.value=="none"){
			alert("�帣�� ������ �ּ���!");
			return;
		}
		if (fff.duration.value==""){
			alert("�����ð��� �Է��� �ּ���!");
			return;
		}
		var roleBoxSize = document.getElementsByName('role_box').length;
		var countRoleBox = 0;
		for(var i=0; i<roleBoxSize; i++){
			if (fff.role_box[i].value != ""){
				countRoleBox++;
			}
		}
		if(countRoleBox == 0){
			alert("�迪�� �Է��� �ּ���!");
			return;
		}
		if (fff.detail.value==""){
			alert("���� ������ �Է��� �ּ���!");
			return;
		}
		if(fff.videoLink.value.indexOf("embed") == -1) {
			alert("��Ʃ�� �ּҸ� �ٽ� Ȯ�����ּ���!");
			return;
		}
		
		document.fff.submit();
		alert("�����ڿ��� ������ ��û�߽��ϴ�.");
	}
 	
 	
	function howToGetLink(){
		var win = window.open("howToGetLink", "YouTube ��ũ ���� ���", "width=800, height=700");
	}	
 	

</script>
<div align="center" class="container" style="margin-top:30px;">
	<h2>������ ����ϱ�</h2>
	<form name="fff" action="show_Add_Ok.mkt" method="post" enctype="multipart/form-data">
		<input type="hidden" name="show_Status" value="0">
		<input type="hidden" name="marketer_UID" value="${sessionScope.marketer_UID}">
		<input type="hidden" name="posterName">
		<table border="1" class="table table-bordered">
			<tr>
				<th class="text-center" width="20%">Musical Name</th>
				<td>
					<input type="text" name="show_Name" class="form-control" required>
					* ���� ��ҹ���, ����, �ѱ۸� �Է����ּ���
				</td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Organizer</th>
				<td><input type="text" name="show_Organizer" class="form-control" required></td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Poster</th>
				<td>
					<input type="file" accept="image/*" name="poster" class="form-control-file" required>
				</td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Held Location</th>
				<td>
					<select id="select1" name="select1" onchange="SelectLocation(this)" class="form-control form-control-sm">
						<option value="none">���� ����</option>
						<c:forEach var="aList" items="${list_Area}">
							<option value="${aList.area_Name}">${aList.area_Name}</option>
						</c:forEach>
					</select>
					<p><p>
					<select name="theatre_Name" id="select2" class="form-control form-control-sm">
					 <option>��� ����</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Start Date</th>
				<td><input type="date" name="startDate" placeholder="yyyy-MM-dd" class="form-control" required></td>
			</tr>			
			<tr>
				<th class="text-center" width="20%">Musical End Date</th>
				<td><input type="date" name="endDate" placeholder="yyyy-MM-dd" class="form-control" required></td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Genre</th>
				<td>
					<div>
						<select name="genre" class="form-control">
									<option value="none">�帣 ����</option>
									<option value="drama">���</option>
									<option value="fantasy">��Ÿ��</option>
									<option value="horror">ȣ��</option>
									<option value="comedy">���</option>
									<option value="tragedy">���</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Rate</th>
				<td>
					<select name="rate" class="form-control">
								<option value="��ü">��ü������</option>
								<option value="15�� �̻�">15�� �̻� ������</option>
								<option value="19�� �̻�">19�� �̻� ������</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Duration</th>
				<td><input type="text" name="duration" size="10" class="form-control" required>* ���� : ��(min)</td>
			</tr>	
			<tr>
				<th class="text-center" width="20%">Musical Role List</th>
				<td>
					<button type="button" class="btn btn-secondary" onclick="javascript:add_textbox();">�Է¶� �߰�</button>
						* ���� ��ҹ���, ����, �ѱ۸� �Է����ּ���
						<p>
						<div id="role_space">
						<p>
						<input type='text' name='role_box' class='form-control' required='required'>
						<p>
						<input type='text' name='role_box' class='form-control'>
						<p>
					</div>
					<p>
				</td>
			</tr>				
			<tr>
				<th class="text-center" width="20%">Musical Detail</th>
				<td><textarea name="detail" rows="10" cols="100%"  class="form-control" required></textarea></td>
			</tr>	
			<tr>
				<th class="text-center" width="20%">Musical Notice</th>
				<td><textarea name="notice" rows="5" cols="100%" class="form-control"></textarea></td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Teaser Link</th>
				<td>
					<input type="text" name="videoLink" class="form-control">
					<p><p>* YouTube�� ���� �����մϴ�. ��ũ �������� ���� Ȯ�����ּ���!</p>
					<button type="button" class="btn btn-secondary" onclick="javascript:howToGetLink()">��ũ �������� ���</button>
				</td>
				
			</tr>	
		</table>
		<p><p>
		<button type="button" class="btn btn-secondary" onclick="javascript:nullCheck()">����ϱ�</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">���</button>
	</form>
</div>