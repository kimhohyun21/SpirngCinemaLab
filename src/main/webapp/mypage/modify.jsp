<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="mypage/style.css">
<script src="sliderengine/jquery.js"></script>
<script type="text/javascript">
	function send(){
		 var f=document.frm;	 
		 var pwd=f.pwd.value;		 
		if(f.name.value==""){
			alert("이름을 입력하세요");
			f.name.focus();
			return;
		}
		var kor=/^[a-z A-Z 가-힝]*$/;
		 if (!kor.test(f.name.value) ){
		     alert("이름에 특수문자,숫자는 입력 할 수 없습니다. \n ex) HoHyunMansae");
		     f.name.focus();
		     return;
		}
		if(f.phone.value==""){
			alert("전화번호를 입력하세요");
			f.content.focus();
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
		        alert("전화번호는 '-'빼고 입력해주시기 바랍니다. \n전화번호는 숫자만 입력하실 수 있습니다 \n ex)01015771577");
		        f.phone.focus();
		        return;
		   }
		 if(f.pwd.value==""){
				alert("비밀번호를 입력해주세요");
				f.pwd.focus();
				return;
			}
		f.submit();
	}
</script>	
</head>
<body>
	<center>
	<div class="modify">
		<b id="notice">정보수정은 이름,생년월일,전화번호만 수정하실수 있습니다.</b>
		<form action="modify_ok.do?strno=${mvo.no }" method="post" name="frm">
			<table id="modify_table" width="500" height="350">
				<tr>
					<td align="center">
						<b>이름</b>
					</td>
					<td>
						 <input type="text" placeholder="이름" name="name" value="${name }">																	
					</td>
				</tr>
				<tr>
					<td align="center">
						<b>생년월일</b> 
					</td>
					<td>
						<input type="text" placeholder="생년월일" name="birth" value="${birth }">				
					</td>
				</tr>
				<tr>
					<td align="center">
						<b>전화번호</b> 
					</td>
					<td>
						<input type="text" placeholder="전화번호 '-'는 빼고 써주세요" name="phone" id="phone" value="${phone }">			
					</td>
				</tr>
				<tr>
					<td align="center">
						<b>비밀번호</b> 
					</td>
					<td>
						<input type="password" placeholder="꼭 입력해 주세요" name="pwd">
					</td>
				</tr>
			</table>
		</form>		
		<input class="btn" type="button" value="수정" onclick="send()">&nbsp;&nbsp;&nbsp;					
		<input class="btn" type="button" value="뒤로" onclick="javascript:history.back()">
	</div>
	</center>
</body>
</html>