<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="join/style3.css">
<script src="sliderengine/jquery.js"></script>
<style type="text/css">
	a{
	text-decoration: none;
	color: black;
}
	#button{	
	margin:10px;
}
	#join_table tr td input{
		margin:0px;
		padding:0px;
	}
</style>
<script type="text/javascript">
function send(){
	 var f=document.frm;
	 var pwd=f.pwd.value;
	var pwdCheck=f.pwd_check.value;
 	var eng=/^[0-9 a-z A-Z]*$/;
	  if (!eng.test(f.id.value) ){
	     alert("아이디는 영어 및 숫자만 입력 할 수 있습니다. \n ex) HoHyunMansae");
	     f.id.focus();
	     return;
	}
	 if(f.id.value=="" || f.id.value.length<5){
		alert("ID는 5자 이상 입력해 주세요");
		f.id.focus();
		return;
	}
	 var kor=/^[a-z A-Z 가-힝]*$/;
	 if (!kor.test(f.name.value) ){
	     alert("이름에 특수문자,숫자는 입력 할 수 없습니다. \n ex) HoHyunMansae");
	     f.name.focus();
	     return;
	}
	if(f.name.value=="" || f.name.value.length<2){
		alert("성과이름 모두 써주시기 바랍니다");
		f.name.focus();
		return;
	}
	if(f.pwd.value==""){
		alert("비밀번호를 입력하세요");
		f.pwd.focus();
		return;
	}
	var tp=/^[0-9a-zA-Z]*$/;
	if(tp.test(f.pwd.value) || pwd.length<8){
		alert("비밀번호는 숫자, 영문, 특수문자를 조합해서\n8자리이상 쓰셔야 가능합니다");
		f.pwd.focus();
		return;
	} 
	if(f.pwd_check.value==""){
		alert("비밀번호를 한번 더 입력하세요");
		f.pwd_check.focus();
		return;
	}
	if(pwd!=pwdCheck){
		alert("비밀번호가 맞지 않습니다");
		return;
	}
	 var number = /[^0-9]/;
	 if (f.birth.value.search(number)!=-1 || f.birth.value.length != 8 || f.birth.value==""){
	        alert("생년월일은 숫자만 8자리를 입력해 주시기 바랍니다 "
	        		+"\n ex)20161018");	        
	        f.birth.focus();
	        return;
	   }
	 if (f.phone.value.search(number)!=-1 || f.phone.value.length == 0 || f.phone.value.length != 11){
	        alert("전화번호를 제대로 입력해주세요. \n전화번호는 숫자만 입력하실 수 있습니다 \n ex)01015771577");
	        f.phone.focus();
	        return;
	   } 	
	 var $vvvv="${vvvv }";	   
	 if($vvvv == "체크완료"){
	 		alert("중복체크를 해주세요") 
	 		return;
	  }
	f.submit();
}

function checkID(){
	var f=document.frm;
	var id=f.id.value;
	var $ok="${ok}"
	var eng=/^[0-9 a-z A-Z]*$/;
	
	 if(!eng.test(f.id.value)){
	     alert("아이디는 영어만 입력 할 수 있습니다. \n ex) HoHyunMansae");
	     f.id.focus();
	     return;
	}	 
	if(id==""){
		alert("ID를 입력해주세요");
		f.id.focus();
		return;
	}
	if(f.id.value=="" || f.id.value.length<5){
		alert("ID는 5자 이상 입력해 주세요");
		f.id.focus();
		return;
	}
	location.href="idOverlab.do?id="+id; 
}

function enter(){
	if(window.event.keyCode == 13){
		send();
	}
}
function NORTHFACE(){
	if(window.event.keyCode == 32){
		alert("공백은 사용이 불가능합니다");
		event.returnValue=false;
	}
}
</script>	
</head>
<body>
	<center>
		<form action="join_ok.do" method="post" name="frm">
			<table id="join_table" width="450" height="400">
				<tr>
					<td align="right">
						<b class="fc">ID : </b>
					</td>
					<td>
						<input type="text" class="id" id="id" placeholder="영어만 사용가능" name="id" value="${overCheckId }" size="30" onkeydown="NORTHFACE()">					
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="button" value="중복확인" onclick="checkID()" class="btn" >
					</td>
				</tr>
				<tr>
					<td align="right">
						<b class="fc">이름 : </b>
					</td>
					<td>
						<input type="text" placeholder="이름" name="name" onkeydown="NORTHFACE()">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b class="fc">비밀번호 : </b>
					</td>
					<td>
						<input type="password" placeholder="비밀번호" name="pwd" onkeydown="NORTHFACE()">
					</td>
				</tr>			
				<tr>
					<td align="right">
						<b class="fc">비번 확인 : </b>
					</td>
					<td>
						<input type="password" placeholder="비밀번호 확인" name="pwd_check">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b class="fc">생년월일 : </b>
					</td>
					<td>
						<input type="text" placeholder="생년월일" name="birth">				
					</td>
				</tr>
				<tr>
					<td align="right">
						<b class="fc">전화번호 : </b>
					</td>
					<td>
						<input type="text" placeholder="전화번호 '-'는 빼고 써주세요" name="phone" 
						id="phone" onkeyup="enter()">			
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input id="button" type="button" value="회원가입" onclick="send()" 
						class="btn"><br/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">					
						<input id="button" type="button" value="취소" onclick="javascript:location.href='main.do'" class="btn">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>