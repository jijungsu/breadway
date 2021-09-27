<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
         <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <head>
		  <meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <title>��¥�� �˻�</title>
		  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		  <link rel="stylesheet" href="/resources/demos/style.css">
		  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			<script>
			$(document).ready(function () {
			    $.datepicker.regional['ko'] = {
			        closeText: '�ݱ�',
			        prevText: '������',
			        nextText: '������',
			        currentText: '����',
			        monthNames: ['1��(JAN)','2��(FEB)','3��(MAR)','4��(APR)','5��(MAY)','6��(JUN)',
			        '7��(JUL)','8��(AUG)','9��(SEP)','10��(OCT)','11��(NOV)','12��(DEC)'],
			        monthNamesShort: ['1��','2��','3��','4��','5��','6��',
			        '7��','8��','9��','10��','11��','12��'],
			        dayNames: ['��','��','ȭ','��','��','��','��'],
			        dayNamesShort: ['��','��','ȭ','��','��','��','��'],
			        dayNamesMin: ['��','��','ȭ','��','��','��','��'],
			        weekHeader: 'Wk',
			        minDate: 0,
			        dateFormat: 'yy-mm-dd',
			        firstDay: 0,
			        isRTL: false,
			        showMonthAfterYear: true,
			        yearSuffix: '',
			        showOn: 'both',
			        buttonText: "�޷�",
			        changeMonth: true,
			        changeYear: true,
			        showButtonPanel: true,
			        yearRange: 'c-99:c+99',
			    };
			    $.datepicker.setDefaults($.datepicker.regional['ko']);

			    $('#sdate').datepicker();
			    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
			    $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#edate").datepicker( "option", "minDate", selectedDate );
			    });

			    $('#edate').datepicker();
			    $('#edate').datepicker("option", "minDate", $("#sdate").val());
			    $('#edate').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#sdate").datepicker( "option", "maxDate", selectedDate );
			    });
			});
			</script>
	</head>
    <body> 
<c:import url="/top.do">
	<c:param name="title">��¥������</c:param>
</c:import>
	<div align = "center">
	   		<div class="container" style="padding-top:30px; padding-bottom:30px;">
    		<form name="f" action="musical_musicalDateFind.do" method="post">
    			<p>��ȸ�Ⱓ:
				  <input type="date" id="sdate" name="datepicker1"> ~
				  <input type="date" id="edate" name="datepicker2">
				  <input type="submit" value="��ȸ" class="btn btn-secondary">
				</p>
				</form>
			
				
				<table border="0" height="400" width="600" align="ceneter" class="table">
				<thead>
    				<tr align="Center" height="40">
    					<th>No.</th>
    					<th>������</th>
    					<th>������ ����</th>
    				</tr>
    			</thead>
    				<c:if test="${empty dateShowList}" >
    				<tr align="center" heigth="360">
    				
    					<td colspan="3">
    					�ش��ϴ� ��¥�� �������� �����ϴ�.
    					</td>
    				</tr>
    				</c:if>
    				
    				<c:forEach var="dto" items="${dateShowList}" varStatus="status">
    				<tr align="center" >
    					<td><font size=20>${status.count}</font></td>
    					<td><a href="musical_content.do?show_ID=${dto.show_ID}">
    							<img src="<spring:url value='/resources/files/show/${dto.posterName}' />" class="aligncenter" width="200" height="250"><br>
    							</a>
    					</td>
    					<td>${dto.show_Name}</td>
    				</tr>
    				</c:forEach>
    					
    		</table>
			</div>
 </div>

    </body>
