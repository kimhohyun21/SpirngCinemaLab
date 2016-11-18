<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-Enter">
	<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-exit">
	<title>Marvel Cinema</title>
	<script type="text/javascript" src="sliderengine/jquery.js"></script>
	<script type="text/javascript" src="jStyles/jquery-ui.min.js"></script>	
	<link rel="stylesheet" type="text/css" href="jStyles/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="jStyles/jquery-ui.structure.css">
	<link rel="stylesheet" type="text/css" href="jStyles/jquery-ui.theme.css">
	<link rel="stylesheet" type="text/css" href="main/main_style.css">
	<link rel="shortcut icon" href="favicon.ico" type="image/x-ico" />
	<link rel="icon" href="favicon.ico" type="image/x-ico" />	
	<script type="text/javascript">
		
	</script>
</head>
<body>
	<div align="center">
		<div id="header">
			<div id="mini_nav">
				<ul>
				<c:if test="${mvo.name==null }">
					<li><a href="login.do">로그인</a></li>
					<li><a href="join.do">회원가입</a></li>					
				</c:if>
				<c:if test="${mvo.name!=null }">
					<li>${mvo.name }님 반갑습니다!</li>
					<li><a href="logout.do">로그아웃</a></li>
					<li><a href="reserveList.do?no=${mvo.no }">마이페이지</a></li>
				</c:if>					
					<li><a href="customer.do">고객센터</a></li>
				</ul>
			</div>
			<br/>
			<a href="main.do">
				<img alt="logo" class="logo" src="image/marvel_cinema_logo.png">
			</a>
		</div>
		<div id="nav">
			<ul>
				<li onclick="javascript:location.href='reserve.do'">
					<a href="reserve.do">예매</a>
				</li>
				<li class="noeffect">|</li>
				<li onclick="javascript:location.href='movieList.do'">
					<a href="movieList.do">영화</a>
				</li>
				<li class="noeffect">|</li>
				<li onclick="javascript:location.href='theater.do'">
					<a href="theater.do">영화관</a>
				</li>
			</ul>
		</div>
		<div id="article">
			<jsp:include page="${jsp }"></jsp:include>
		</div>
		<div id="footer">
			<span>&copy;2016 Shin Eun Hye / Kim Ho Hyun / Jun Jin Tae / Choi Tae Soek / Park Jung Hwan</span>
		</div>
	</div>
</body>
</html>