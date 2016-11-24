<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Search ID</title>
	<link rel="stylesheet" type="text/css" href="login/login_style.css">
	<script type="text/javascript">
		function enter(){
			if(window.event.keyCode == 13){
				login();
			}
		}
		
		function send(){
			 var f=document.frm;
			if(f.name.value==""){
				alert("이름을 입력하세요");
				f.name.focus();
				return;
			}
			var number = /[^0-9]/;
			 if (f.birth.value.search(number)!=-1 || f.birth.value.length != 8 || f.birth.value==""){
			        alert("생년월일은 숫자만 8자리 모두 입력해 주시기 바랍니다 "
			        		+"ex)20161018");	        
			        f.birth.focus();
			        return;
			   }
			 if (f.phone.value.search(number)!=-1 || f.phone.value.length == 0 ){
			        alert("전화번호는 숫자만 입력하실 수 있습니다 ex)01015771577");	        
			        f.phone.focus();
			        return;
			   }
			f.submit();  
		}
	</script>
</head>
<body>
	<div align="center" class="searchBg">
		<form action="searchId_ok.do" method="post" name="frm" id="frm">
			<h2>아이디 찾기</h2>
			<table id="search_table">
				<tr>
					<td align="right">
						<label for="name" class="inputlabel">이름 :</label>
						<input type="text" placeholder="이름" name="name" id="name" onkeydown="enter()">
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
					<td align="center">
						<input class="searchBtn" type="button" value="찾기" onclick="send()" width="300">
						<input class="searchBtn" type="button" value="뒤로" onclick="javascript:history.back()" width="300">
					</td>
				</tr>
			</table>
		</form>	
	</div>
</body>
</html>