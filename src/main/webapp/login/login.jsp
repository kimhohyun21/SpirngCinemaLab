<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="login/login_style.css">
	<c:if test="${join eq '가입성공' }">
		<script type="text/javascript">
			alert("회원가입이 완료되었습니다");
		</script>
	</c:if>
	<c:if test="${join eq '중복' }">
		<script type="text/javascript">
			alert("중복된 아이디입니다");
			history.back();
		</script>
	</c:if>
<script type="text/javascript">
function login(){
	var f=document.frm;	
	if(f.id.value==""){
		alert("아이디를 입력하세요");
		f.id.focus();
		return;
	}
	if(f.pwd.value==""){
		alert("비밀번호를 입력하세요");
		f.pwd.focus();
		return;
	}
	f.submit();
}

function enter(){
	if(window.event.keyCode == 13){
		login();
	}
}
</script>
</head>
<body>
	<div align="center">		
		<form method="post" action="login_ok.do" name="frm">
			<div class="input">
				<input type="text" placeholder="ID" name="id" onkeydown="enter()">
			</div>
			<div class="input">
				<input type="password" placeholder="PW" name="pwd" id="pwd" onkeydown="enter()">				
			</div>
			<div id="find">
				<a href="searchId.do">아이디 찾기</a>&nbsp;&nbsp;&nbsp;
				<a href="searchPwd.do">비밀번호 찾기</a>
			</div>
		<table height="100">
			<tr>
				<td>
					<input type="button" value="로그인" onclick="login()"
						class="btn">
				</td>
			</tr>
			<tr>
				<td>
					<input id="button" type="button" value="뒤로" onclick="javascript:history.back()"
						class="btn">
				</td>
			</tr>
		</table>	
		</form>
	</div>
</body>
</html>