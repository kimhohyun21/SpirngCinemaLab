<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Member Info Modify</title>
	<link rel="stylesheet" type="text/css" href="mypage/mypage_style.css">
	<script type="text/javascript">
		//엔터 입력
		function mUpdate(){
			if(window.event.keyCode == 13){
				send();
			}
		}
	
		function send(){
			 var f=document.frm;	 
			 var pwd=f.pwd.value;		 
			 if(f.name.value==""){
				 	$.jQueryAlert("이름을 입력하세요");
					f.name.focus();
					return;
			 }
			 var kor=/^[a-z A-Z 가-힝]*$/;
			 if (!kor.test(f.name.value) ){
				 	$.jQueryAlert("이름에 특수문자,숫자는 입력 할 수 없습니다. \n ex) HoHyunMansae");
			     	f.name.focus();
			     	return;
			 }
			 if(f.phone.value==""){
				 	$.jQueryAlert("전화번호를 입력하세요");
				    f.content.focus();
				    return;
			 }
			 var number = /[^0-9]/;
			 if (f.birth.value.search(number)!=-1 || f.birth.value.length != 8 || f.birth.value==""){
				 	$.jQueryAlert("생년월일은 숫자만 8자리를 입력해 주시기 바랍니다 "
			        				+"\n ex)20161018");	        
			        f.birth.focus();
			        return;
			 }
			 if (f.phone.value.search(number)!=-1 || f.phone.value.length == 0 || f.phone.value.length != 11){
				 	$.jQueryAlert("전화번호는 '-'빼고 입력해주시기 바랍니다. \n전화번호는 숫자만 입력하실 수 있습니다 \n ex)01015771577");
			        f.phone.focus();
			        return;
			 }
			 if(f.pwd.value==""){
				 	$.jQueryAlert("비밀번호를 입력해주세요");
					f.pwd.focus();
					return;
			 }
			 
			 $.ajax({
					type: "POST",
					url: "modify_ok.do",
					data:$('#modifyFrm').serialize(),
					success:function(data){
						if(data==true){
							var func=function(){window.location.reload(true);};
							$.jQueryAlertF('수정이 완료되었습니다.', func);						
						}else{
							$.jQueryAlert('비밀번호가 다릅니다.');						
						}
					},
					error:function(data){
						$.jQueryAlert("통신실패");
					}
				});
		}
	</script>	
</head>
<body>
	<center>
	<div class="bg2">
		<b id="notice">정보수정은 이름,생년월일,전화번호만 수정하실수 있습니다.</b>
		<form name="frm" id="modifyFrm">
			<table id="modify_table" width="500" height="350">
				<tr>
					<td class="modify_td">
						<b>이름</b>
					</td>
					<td>
						<input type="text" placeholder="이름" name="name" value="${name }" class="input" onkeydown="mUpdate()">																	
						<input type="hidden" name="strno" value="${mvo.no }">
					</td>
				</tr>
				<tr>
					<td class="modify_td">
						<b>생년월일</b> 
					</td>
					<td>
						<input type="text" placeholder="생년월일" name="birth" value="${birth }" class="input" onkeydown="mUpdate()">				
					</td>
				</tr>
				<tr>
					<td class="modify_td">
						<b>전화번호</b> 
					</td>
					<td>
						<input type="text" placeholder="전화번호 '-'는 빼고 써주세요" name="phone" id="phone" value="${phone }" class="input" onkeydown="mUpdate()">			
					</td>
				</tr>
				<tr>
					<td class="modify_td">
						<b>비밀번호</b> 
					</td>
					<td>
						<input type="password" placeholder="꼭 입력해 주세요" name="pwd" class="input" onkeydown="mUpdate()">
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