<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
         <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
         <%@ page import="java.net.URLEncoder" %>

<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<c:import url="/top.do">
	<c:param name="title" value="1��1����"/>
</c:import>


			<div class="container" align="center">
			<p>
    		<h1>1:1�����ϱ�</h1>
    		<p>
    		<p>
    		</div>
    	


    </head>



    
    <div class="container mt-3" style="padding-right: 300px; padding-left: 300px; margin-right: auto; margin-left: auto;" >
  <form name="inquiry" action="inquiry_writePro.do" method="post" onsubmit="return check()">
  <input type="hidden" name="num" value="${num}"/>
		<input type="hidden" name="consumer_UID" value="${sessionScope.consumer.consumer_UID}">
		<input type="hidden" name="re_step" value="${re_step}"/>
		<input type="hidden" name="re_level" value="${re_level}"/>
		<input type="hidden" name="re_group" value="${re_group}"/>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">�̸�</span>
      </div>
      <input type="text" class="form-control"  id="usr" name="name" value="${sessionScope.consumer.consumer_Name}" readonly>
    </div>
    
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">����</span>
      </div>
      <input type="text" class="form-control"  id="usr" name="subject" >
    </div>
    
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">�̸���</span>
      </div>
      <input type="text" class="form-control"  id="usr" name="email" value="${sessionScope.consumer.consumer_Email}"  readonly >
    </div>
    
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">����</span>
      </div>
      </div>
      <textarea  class="form-control"  id="usr" name="content" cols="20" rows="20"></textarea>
  	<br>
    <button type="submit" class="btn btn-primary" >Submit</button>
    
    <button type="reset" class="btn btn-primary" >reset</button>
    
  </form>
</div>
     <script type="text/javascript">
	function check(){
		if (inquiry.subject.value==""){
			alert("������ �Է��� �ּ���!!")
			inquiry.subject.focus()
			return false
		}
		if (inquiry.content.value==""){
			alert("������ �Է��� �ּ���!!")
			inquiry.content.focus()
			return false
		}
		if (inquiry.email.value==""){
			alert("�̸����� �Է��� �ּ���!!")
			inquiry.content.focus()
			return false
		}

		return true
	}
</script>
    
    	
    </body>
