<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="theater/style.css">
</head>
<body>
	<div align="center" id="theaterList">
		<ul>
			<c:forEach var="vo" items="${theaterList }">
				<li>
					<a href="theater.do?local=${local}&theater=${vo.theater}">${vo.theater }</a>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>