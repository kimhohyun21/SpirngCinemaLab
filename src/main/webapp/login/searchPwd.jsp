<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="login/login_style.css">
	<script type="text/javascript">
		function enter(){
			if(window.event.keyCode == 13){
				send();
			}
		}
		
		function send(){
			var f=document.frm;	
			if(f.name.value==""){
				$.jQueryAlert("이름을 입력하세요");
				f.name.focus();
				return;
			}
			if(f.id.value==""){
				$.jQueryAlert("아이디를 입력하세요");
				f.id.focus();
				return;
			}
			var number = /[^0-9]/;
			if (f.phone.value.search(number)!=-1 || f.phone.value.length == 0 || f.phone.value.length != 11){
				   $.jQueryAlert("전화번호는 11자리 숫자만 입력하실 수 있습니다 \n ex)01015771577");
			       f.phone.focus();
			       return;
			}
			f.submit();  
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
	<div align="center" class="searchBg">
		<form action="searchId_ok.do" method="post" name="frm" id="frm">
			<h2 class="id" id="selectedBg">
				<a href="searchId.do">아이디 찾기</a>
			</h2>
			<h2 class="pwd">
				<a href="searchPwd.do" >비밀번호 찾기</a>
			</h2>
			<table id="search_table">
				<tr>
					<td align="right">
						<label for="name" class="inputlabel">이름 :</label>
						<input type="text" placeholder="이름" name="name" id="name" onkeydown="enter()">
					</td>					
				</tr>
				<tr>
					<td align="right">
						<label for="id" class="inputlabel">아이디 :</label>
						<input type="text" placeholder="생년월일" name="id" id="id" onkeydown="enter()">				
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
						<input class="searchBtn" type="button" value="찾기" onclick="send()" width="300">
						<input class="searchBtn" type="button" value="뒤로" onclick="javascript:history.back()" width="300">
					</td>
				</tr>
			</table>
		</form>	
	</div>
</body>
</html>