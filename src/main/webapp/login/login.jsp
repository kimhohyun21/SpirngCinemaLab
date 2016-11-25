<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
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
	function enter(){
		if(window.event.keyCode == 13){
			login();
		}
	}
	
	function login(){
		var id=$('#id').val();	
		if(id==""){
			$.jQueryAlert("아이디를 입력하세요");
			$('#id').focus();
			return;
		}
		var pwd=$('#pwd').val();
		if(pwd==""){
			$.jQueryAlert("비밀번호를 입력하세요");
			$('#pwd').focus();
			return;
		}
		
	 	$.ajax({
			type: "POST",
			url: "login_ok.do",
			data:$('#frm').serialize(),
			dataType: "json",
			success:function(data){
				if(data.check=="ok"){
					location.href="main.do";
				}else if(data.check=="pwdnot"){
					$.jQueryAlert("패스워드가 잘못 되었습니다.");
				}else if(data.check=="idnot"){
					$.jQueryAlert("아이디가 잘못 되었습니다.");
				}
			},
			error:function(data){
				$.jQueryAlert("실패");
			}
		});
	 	
	}
	
	/* jQuery Alert 창 */
	jQuery.jQueryAlert = function (msg) {
	    var $messageBox = $.parseHTML('<div id="alertBox"></div>');
	    $("body").append($messageBox);
	
	    $($messageBox).dialog({
	        open: $($messageBox).append(msg),
	        autoOpen: true,
	        modal: true,
	        resizable:false, 
			width: 400,
	        buttons: {
	            OK: function () {
	                $(this).dialog("close");
	            }
	        }
	    });
	};
	</script>
</head>
<body>
	<div align="center" class="loginBg">
		<h2 class="login"><a href="login.do">로그인</a></h2>
		<h2 class="join" id=selectedBg><a href="join.do">회원가입</a></h2>
		<div class="loginMain">
			<form method="post" action="login_ok.do" name="frm" id="frm">
				<div class="inputType">
					<label class="idlabel" for="id">ID</label>
					<input type="text" placeholder="아이디를 입력하세요." name="id" id="id" onkeydown="enter()"><br>
					<label class="pwlabel" for="pwd">PW</label>
					<input type="password" placeholder="패스워드를 입력하세요." name="pwd" id="pwd" onkeydown="enter()">				
				</div>
				<div class="buttonType">
					<input type="button" value="로그인" onclick="login()" class="btn">
				</div>
			</form>		
			<div id="find">
				<a href="searchId.do">아이디 찾기 ▶</a>
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="searchPwd.do">비밀번호 찾기 ▶</a>
			</div>
		</div>		
	</div>
</body>
</html>