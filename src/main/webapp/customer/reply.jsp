<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="customer/style.css">
<script type="text/javascript">
	function send(){
		var f=document.frm;
		
		if(f.subject.value==""){
			alert("제목을 입력하시오");
			f.subject.focus();
			return;
		}
		
		if(f.content.value==""){
			alert("내용을 입력하시오");
			f.content.focus();
			return;
		}
		f.submit();
	}
</script>
</head>
<body>
	<div align="center" class="bg">
		<h3>답글쓰기</h3>
		<form action="qreply_ok.do?page=${page }&no=${no }" method="post" name="frm">
			<table width="500" id="insert_table">
				<tr height="27">
					<th width="20%" align="center">이름</th>
					<td width="80%" align="left">
						<input type="text" size="10" name="name" value="${mvo.name}">
					</td>
				</tr>
				<tr height="27">
					<th width="20%" align="center">제목</th>
					<td width="80%" align="left">
						<input type="text" size="45" value="${vo.qsubject }" name="subject">
					</td>
				</tr>
				<tr height="27">
					<th width="20%" align="center">내용</th>
					<td width="80%" align="left">
						<textarea rows="8" cols="50" name="content"></textarea>
					</td>
				</tr>
			</table>
			<table width="500">
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="댓글달기" onclick="send()" class="insert_btn">
						<input type="button" value="취소" onclick="javascript:history.back()" class="cancel_btn">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>