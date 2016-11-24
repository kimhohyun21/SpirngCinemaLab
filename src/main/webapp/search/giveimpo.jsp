 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<c:if test="${id eq null || pwd eq null}">
		<script type="text/javascript">
			alert('입력하신 정보가 틀리거나 ID가 존재하지 않습니다');
			history.back();
		</script>
	</c:if>
</head>
<body>
	<div align="center">
		<div id="find">
			<c:if test="${id != '패스' }">
				<h3>
				입력하신 정보의 ID는<br/>
				<b>${id }</b><br/>
				입니다
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