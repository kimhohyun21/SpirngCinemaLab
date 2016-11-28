 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="login/login_style.css">
	<title>Give Info</title>	
	<script type="text/javascript">
		$(document).ready(function(){
			if(${pwd==null || id==null}){
				var func=function(){history.back();};
				$.jQueryAlertF('입력하신 정보가 틀리거나 요청하신 정보가 존재하지 않습니다', func);
			}
		});		
	</script>
</head>
<body>
	<div align="center" class="searchBg">
		<div class="find">
			<c:if test="${id != '패스' }">
				<div class=contBlock>
					<h3>
						입력하신 정보의 ID는<br/>
						<font style="color:red; font-weight:bold;">${id }</font><br/>
						입니다.
					</h3>
					<input type="button" class="goBtn" value="비밀번호 찾기" onclick="location.href='searchPwd.do';">			
				</div>				
			</c:if>
			
			<c:if test="${pwd != '패스' }">
				<div class=contBlock>
					<h3>
						입력하신 정보의 패스워드는<br/>
						<font style="color:red; font-weight:bold;">${pwd }</font><br/>
						입니다.
					</h3>
					<input type="button" class="goBtn" value="로그인" onclick="location.href='login.do';">
				</div>	
			</c:if>			
		</div>
	</div>
</body>
</html>