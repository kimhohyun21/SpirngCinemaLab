<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="search/style.css">
<script type="text/javascript">
function send(){
	 var f=document.frm;	
	if(f.name.value==""){
		alert("이름을 입력하세요");
		f.name.focus();
		return;
	}
	if(f.id.value==""){
		alert("아이디를 입력하세요");
		f.id.focus();
		return;
	}
	var number = /[^0-9]/;
	 if (f.phone.value.search(number)!=-1 || f.phone.value.length == 0 || f.phone.value.length != 11){
	       alert("전화번호를 제대로 입력해주세요. \n전화번호는 숫자만 입력하실 수 있습니다 \n ex)01015771577");
	       f.phone.focus();
	       return;
	}
	f.submit();  
}
</script>
</head>
<body>
	<center>		
		<form action="searchPwd_ok.do" method="post" name="frm">
			<table id="join_table" width="450" height="200">
				<tr>
					<td align="right">
						<b>이름 :</b>
					</td>
					<td align="left">
						<input type="text" placeholder="이름" name="name">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>아이디 :</b>
					</td>
					<td align="left">
						<input type="text" placeholder="아이디" name="id">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>전화번호 :</b>
					</td>
					<td align="left">
						<input type="text" placeholder="전화번호" name="phone">
					</td>
				</tr>
			</table>
		</form>
		
		<input class="btn" id="btn1" type="button" value="찾기" onclick="send()"><br/>
		<input class="btn" type="button" value="뒤로" onclick="javascript:history.back()">
	</center>
</body>
</html>