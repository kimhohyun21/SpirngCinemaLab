<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Join</title>
	<link rel="stylesheet" type="text/css" href="login/login_style.css">
	<script type="text/javascript">
		//ID 중복 체크
		var overCheckId="";
		function checkID(){
			var f=document.frm;
			var id=f.id.value;
			var $ok="${ok}"
			var eng=/^[0-9 a-z A-Z]*$/;
			
			 if(!eng.test(f.id.value)){
				 $.jQueryAlert("아이디는 영어 및 숫자만 가능합니다. \n ex) HoHyunMansae");
			     f.id.focus();
			     return;
			}	 
			if(id==""){
				$.jQueryAlert("ID를 입력해주세요");
				f.id.focus();
				return;
			}
			if(f.id.value=="" || f.id.value.length<5){
				$.jQueryAlert("ID는 5자 이상 입력해 주세요");
				f.id.focus();
				return;
			}
			$.ajax({
				type: "POST",
				url: "idOverlab.do",
				data:{ id: id},
				dataType: "json",
				success:function(data){
					if(data.check==0){
						$('#name').focus();
						overCheckId=data.overCheckId;
						$.jQueryAlert("사용가능한 아이디 입니다.");						
					}else{
						$('#id').focus();
						$.jQueryAlert("이미 사용중인 아이디 입니다.");						
						return;
					}
				},
				error:function(data){
					$.jQueryAlert("통신실패");
				}
				
				
			}); 
		}
	
		//입력 값 체크 및 회원 정보 전송
		function send(){
			var f=document.frm;			
			var eng=/^[0-9 a-z A-Z]*$/;
			if (!eng.test(f.id.value) ){
				$.jQueryAlert("아이디는 영어 및 숫자만 가능합니다. \n ex) HoHyunMansae");
			    f.id.focus();
			    return;
			}
			if(f.id.value=="" || f.id.value.length<5){
			    $.jQueryAlert("ID는 5자 이상 입력해 주세요");
				f.id.focus();
				return;
			}
			var kor=/^[a-z A-Z 가-힝]*$/;
			if (!kor.test(f.name.value) ){
				$.jQueryAlert("이름에 특수문자,숫자는 입력 할 수 없습니다. \n ex) HoHyunMansae");
			    f.name.focus();
			    return;
			}
			if(f.name.value=="" || f.name.value.length<2){
				$.jQueryAlert("성과이름 모두 써주시기 바랍니다");
				f.name.focus();
				return;
			}					
			if(f.pwd.value==""){
				$.jQueryAlert("비밀번호를 입력하세요");
				$('#pwd').focus();
				return;
			} 
			var tp=/^[0-9a-zA-Z]*$/;
			if(tp.test(f.pwd.value) || f.pwd.value.length<8){
				$.jQueryAlert("비밀번호는 숫자,영문,특수문자를 조합하여 \n 8자리이상 등록가능합니다");
				f.pwd.focus();
				return;
			}			
			if(f.pwd_check.value==""){
				$.jQueryAlert("비밀번호를 한번 더 입력하세요");
				f.pwd_check.focus();
				return;
			}
			var pwd=f.pwd.value;	
			var pwdCheck=f.pwd_check.value;
			if(pwd!=pwdCheck){
				$.jQueryAlert("비밀번호가 맞지 않습니다");
				return;
			}
			var number = /[^0-9]/;
			if (f.birth.value.search(number)!=-1 || f.birth.value.length != 8 || f.birth.value==""){
			 	$.jQueryAlert("생년월일은 숫자만 8자리를 입력해 주시기 바랍니다 \n ex)20161018");	        
			    f.birth.focus();
			    return;
			}
			if (f.phone.value.search(number)!=-1 || f.phone.value.length == 0 || f.phone.value.length != 11){
			 	$.jQueryAlert("전화번호는 11자리 숫자만 입력하실 수 있습니다 \n ex)01015771577");
			    f.phone.focus();
			    return;
			} 	
			if(overCheckId != f.id.value){
				$.jQueryAlert("중복체크를 해주세요");
				f.id.focus();
				return;
			}
			f.submit();
		}		
		
		//공백 방지
		function NORTHFACE(){
			if(window.event.keyCode == 32){
				$.jQueryAlert("공백은 사용이 불가능합니다");
				event.returnValue=false;
			}
		}
		
		//엔터 입력
		function enter(){
			if(window.event.keyCode == 13){
				send();
			}
		}		
	</script>	
</head>
<body>
	<div align="center" class="loginBg">
		<h2 class="login" id=selectedBg><a href="login.do">로그인</a></h2>
		<h2 class="join"><a href="join.do">회원가입</a></h2>
		<div class="joinMain">
			<form method="post" action="join_ok.do" name="frm" id="frm">
				<table>
					<tr>
						<td align="right">
							<label for="id" class="inputlabel">ID :</label>
							<input type="text" class="id" id="id" placeholder="영어만 사용가능" name="id" value="${overCheckId }" size="30" onkeydown="NORTHFACE();enter();">
						</td>											
					</tr>
					<tr>
						<td align="center" colspan="2">
							<input type="button" value="중복확인" onclick="checkID()" class="searchBtn" >
						</td>
					</tr>
					<tr>
						<td align="right">
							<label for="name" class="inputlabel">이름 :</label>
							<input type="text" placeholder="이름" name="name" id="name" onkeydown="NORTHFACE();enter();">				
						</td>
					</tr>
					<tr>
						<td align="right">
							<label for="pwd" class="inputlabel">비밀번호 :</label>
							<input type="password" placeholder="비밀번호" name="pwd" id="pwd" onkeydown="NORTHFACE();enter();">
						</td>
					</tr>
					<tr>
						<td align="right">
							<label for="pwd_check" class="inputlabel">비번확인 :</label>
							<input type="password" placeholder="비밀번호 확인" id="pwd_check" name="pwd_check" onkeydown="NORTHFACE();enter();">
						</td>
					</tr>
					<tr>
						<td align="right">
							<label for="birth" class="inputlabel">생년월일 :</label>
							<input type="text" placeholder="생년월일" name="birth" id="birth" onkeydown="enter()">
						</td>	
					</tr>
					<tr>
						<td align="right">
							<label for="phone" class="inputlabel">전화번호 :</label>
							<input type="text" placeholder="전화번호 '-'는 빼고 써주세요" name="phone" id="phone" onkeydown="enter()">
						</td>
					</tr>
					<tr>
						<td align="center" style="padding-top: 30px;">
							<input class="searchBtn" type="button" value="회원가입" onclick="send()" width="300">
							<input class="searchBtn" type="button" value="취소" onclick="javascript:history.back()" width="300">
						</td>
					</tr>
				</table>
			</form>		
		</div>		
	</div>
</body>
</html>