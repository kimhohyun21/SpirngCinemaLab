<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="mypage/style.css">
<script src="sliderengine/jquery.js"></script>
<script type="text/javascript">
function send(){
	var f = document.frm;
	if(f.pwd.value==""){
		alert("현재 비밀번호를 입력해주세요");
		f.pwd.focus();
		return;
	}//비밀번호 체크 할것	
	if(f.change_pwd.value==""){
		alert("바꾸실 비밀번호를 입력해주세요");
		f.change_pwd.focus();
		return;
	}
	var tp=/^[0-9a-zA-Z]*$/;
	if(tp.test(f.change_pwd.value) || f.change_pwd.value.length<8){
		alert("비밀번호는 숫자, 영문, 특수문자를 조합해서\n8자리이상 쓰셔야 가능합니다");
		f.change_pwd.focus();
		return;
	}
	if(f.check_pwd.value==""){
		alert("비밀번호를 한번 더 입력해주세요");
		f.check_pwd.focus();
		return;
	}
	if(f.check_pwd.value==f.change_pwd.value){
		alert("비밀번호가 다릅니다");
		f.check_pwd.focus();
		return;
	}
	f.submit();
}
</script>
</head>
<body>
	<center>
		<form method="post" action="changepwd_ok.do?strno=${mvo.no }" name="frm">
			현재 비밀번호:<input type="password" name="pwd"><br>
			바꿀 비밀번호:<input type="password" name="change_pwd"><br>
			비밀번호 확인:<input type="password" name="check_pwd"><br>
			<input type="button" onclick="send()" value="변경" class="btn">
			<input type="button" onclick="javascript:history.back()" value="뒤로" class="btn">			
		</form>
	</center>
</body>
</html>