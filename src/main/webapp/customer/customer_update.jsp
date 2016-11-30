<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Q&A Update</title>
	<link rel="stylesheet" type="text/css" href="customer/customer_style.css">
	<script type="text/javascript">
		$(function(){
			$('#sendBtn').click(function(){
				send();
			});
			
			$('input').keypress(function(key) {
				if(key.keyCode == 13){
					send();
				}
			});
				send=function(){
				var subject=$('#subject').val();
				if(subject.trim()==""){
					$('#subject').focus();
					$.jQueryAlert('제목을 입력하세요.');
					$('#subject').val("");
					return;
				}
				var content=$('#content').val();
				if(content.trim()==""){
					$('#content').focus();
					$.jQueryAlert('내용을 입력하세요.');
					$('#content').val("");
					return;
				}	
				$('#frm').submit();
			};
		});
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
		<form action="update_ok.do" method="post" name="frm" id="frm">
			<table id="insert_table" width="800px">
				<tr>
					<th width="20%">이름</th>
					<td>
						<input type="hidden" value="${no }" name="no" >
						<input type="hidden" value="${page}" name="page" >
						<input type="text" size="15" value="${mvo.name}" name="name" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th width="20%">제목</th>
					<td>
						<input type="text" size="50" value="${vo.qsubject }" name="subject" id="subject">
					</td>
				</tr>
				<tr >
					<th width="20%">내용</th>
					<td>
						<textArea cols="70" rows="20" name="content" id="content">${vo.qcontent }</textArea>
					</td>
				</tr>
			</table>
			<table class="button_table" width="800px">
				<tr>
					<td align="center">
						<input type="button" value="글쓰기" id="sendBtn" class="btn_normal2">
						<input type="reset" value="취소" onclick="javascript:history.back()" class="btn_normal2">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>