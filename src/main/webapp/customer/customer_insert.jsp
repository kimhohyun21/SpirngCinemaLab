<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Q&A Insert</title>
	<link rel="stylesheet" type="text/css" href="customer/customer_style.css">
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
		<table>
			<tr id="sub">
				<td>
					<a href="customer.do">
						<button class="list_btn">QnA</button>
					</a>
				</td>
				<td>
					<a href="faq.do">
						<button class="list_btn">FAQ</button>
					</a>
				</td>
			</tr>
		</table>
		<div id="qna_title">QnA</div>
		<hr>
		<form action="insert_ok.do" method="post" name="frm">
			<table id="insert_table" width="800px">
				<tr>
					<th width="20%">이름</th>
					<td>
						<input type="text" size="15" name="name" value="${mvo.name}" readonly="readonly">
						<input type="hidden" name="no" value="${mvo.no}">
					</td>
				</tr>
				<tr>
					<th width="20%">제목</th>
					<td>
						<input type="text" size="50" name="subject">
					</td>
				</tr>
				<tr >
					<th width="20%">내용</th>
					<td>
						<textArea cols="70" rows="16" name="content"></textArea>
					</td>
				</tr>
			</table>
			<table class="button_table" width="800px">
				<tr>
					<td align="center">
						<input type="button" value="글쓰기" class="btn_normal2" onclick="send()">
						<input type="reset" value="취소" onclick="javascript:history.back()" class="btn_normal2">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>