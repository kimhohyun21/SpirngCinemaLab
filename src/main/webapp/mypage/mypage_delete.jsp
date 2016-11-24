<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="mypage/mypage_style.css">
<script src="sliderengine/jquery.js"></script>
<script type="text/javascript">
function send(){
	var f = document.frm;
	if(f.pwd.value==""){
		alert("비밀번호를 입력해주세요");
		return;
	}
	
	f.submit();
}
</script>
</head>
<body>
	<center>
		<div class="bg2">
			<b id="notice">탈퇴한 아이디는 복구할 수 없습니다</b>
			<form name="frm" method="post" action="delete_ok.do?strno=${mvo.no }">
				<table id="modify_table" width="400" height="80">
					<tr>
						<td class="modify_td">
							<b>비밀번호</b>
						</td>
						<td>
							<input type="password" name="pwd" class="input">
						</td>
					</tr>
				</table>
				<input type="button" onclick="send()" value="삭제" class="btn" style="position: relative; right: 50px;">
			</form>
		</div>
	</center>
</body>
</html>