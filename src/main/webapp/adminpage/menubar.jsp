<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="adminpage/astyle.css">
</head>
<body>
	<center>
		<div class="bg2">
			<a href="aMovieList.do?sPage=${page }">
				<button class="menubar">영화리스트 관리</button>
			</a>
			<a href="adminReserveList.do">
				<button class="menubar">예매내역 관리</button>
			</a>
			<a>
				<button class="menubar">FAQ 관리</button>
			</a>
			<a>
				<button class="menubar">출연진 관리</button>
			</a>
			<jsp:include page="${jsp3 }"></jsp:include>
		</div>		
	</center>
</body>
</html>