<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>My Page</title>
	<link rel="stylesheet" type="text/css" href="mypage/mypage_style.css">
	<script type="text/javascript">
		$(document).ready(function () {
	 		$(".menubar ul li#${menuType }").attr("class", "liSelected");
	 	});		
	</script>
</head>
<body>
	<div class="bg">
		<input type="hidden" value="${mvo.birth }" name="birth">
		<div align="center" class="menubar">
			<br>
			<ul>
				<li id="reserveList" onclick="location.href='reserveList.do?no=${mvo.no }'">
					예매내역
				</li>
				<li id="memberModify" onclick="location.href='memberModify.do?strno=${mvo.no }'">
					회원정보 수정
				</li>
				<li id="memberChangePwd" onclick="location.href='memberChangePwd.do'">
					비밀번호 수정
				</li>
				<li id="memberDelete" onclick="location.href='memberDelete.do?no=${mvo.no }'">
					회원탈퇴
				</li>
				<c:if test="${mvo.admin == 1 }">
				<li id="admin" onclick="location.href='aMovieList.do'">
					비밀의 방	
				</li>
				</c:if>
			</ul>		
		</div>
		<br>
		<div align="center">
			<jsp:include page="${jsp2 }"></jsp:include>
		</div>
	</div>
</body>
</html>