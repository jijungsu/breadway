<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <meta charset="utf-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<div class="container" style="padding-top:30px"> 
 <form name = "review" action = "review_update_ok.do" method = "post">
 		<input type = "hidden" name = "show_ID" value = "${getReview.SHOW_ID}">
		 <input type = "hidden" name = "num" value = "${getReview.NUM}">
					<table style="border :0px solid black; border-collapse: collapse;" class="table" >
						<tr>
							<th>������</th>
							<td>
								${getReview.SHOW_NAME}</td>
						</tr>
						<tr>
							<th>�����Ͻ�</th>
							<td>
								${getReview.VIEW_DATE}
							</td>
						</tr>
						<tr>
							<th>����</th>
							<td>
								<input type = "text" name = "rev_subject" value = "${getReview.REV_SUBJECT}" >
							</td>
						</tr>
						<tr>
							<th>�ۼ���</th>
							<td>
								<input type ="text" name = "writer" value = "${getReview.WRITER}" readOnly>
							</td>
						</tr>
						<tr>
							<th>����</th>
							<td>
								<select name ="score">
									<option value = "�ڡڡڡڡ�">�ڡڡڡڡ�</option>
									<option value = "�ڡڡڡڡ�">�ڡڡڡڡ�</option>
									<option value = "�ڡڡڡ١�">�ڡڡڡ١�</option>
									<option value = "�ڡڡ١١�">�ڡڡ١١�</option>
									<option value = "�ڡ١١١�">�ڡ١١١�</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>����</th>
							<td style="vertical-align:middle">
							<textarea name="rev_content" rows="10" cols="100%"  class="form-control" required="required">${getReview.REV_CONTENT}</textarea></td>
							
						</tr>
						<tr>
							<td colspan ="2">
								<input type = "button" value = "���" class="btn btn-secondary" onclick="history.back();">
								<input type = "submit" value = "Ȯ��" class="btn btn-secondary">
								<input type = "button" value = "���" class="btn btn-secondary"onclick="history.back();">
							</td>
						</tr>
					</table>
				</form>
			</div>	
	