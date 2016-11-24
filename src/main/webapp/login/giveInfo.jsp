 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="login/login_style.css">
	<title>Give Info</title>
		<c:if test="${id eq null || pwd eq null}">
			<script type="text/javascript">
				$.jQueryAlert('입력하신 정보가 틀리거나 ID가 존재하지 않습니다');
				history.back();
			</script>
		</c:if>
		
	<script type="text/javascript">
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
		<div class="find">
			<c:if test="${id != '패스' }">
				<h3>
				입력하신 정보의 ID는<font style="color:red; font-weight:bold;">${id }</font>입니다.
				</h3>
				<a href="searchPwd.do">비밀번호 찾기</a>
			</c:if>
			
			<c:if test="${pwd != '패스' }">
				<h3>
				입력하신 정보의 패스워드는<br/>
				<b>${pwd }</b><br/>
				입니다
				</h3>
			</c:if>
			<input type="button" value="로그인" ondblclick="location.href='login.do';">
		</div>
	</div>
</body>
</html>