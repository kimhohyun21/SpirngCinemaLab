<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="theater/theater_style.css">
</head>
<body>
	<div align="center" id="theater_pic">
		<c:if test="${num=='1' }">
			<img src="image/1.jpg">
		</c:if>
		<c:if test="${num=='2' }">
			<img src="image/2.jpg">
		</c:if>
		<c:if test="${num=='3' }">
			<img src="image/3.jpg">
		</c:if>
		<c:if test="${num=='4' }">
			<img src="image/4.jpg">
		</c:if>
	</div>
</body>
</html>