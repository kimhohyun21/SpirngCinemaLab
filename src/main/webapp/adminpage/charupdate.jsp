<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<form method="post" action="AcharUpdate">
			<select id="actor1">
				<option>선택</option>
				<c:forEach var="list" items="${list }">
					<option value="${list.cno }">${list.cname }</option>
				</c:forEach>
			</select>
			<select id="actor2">
				<option>선택</option>
				<c:forEach var="list" items="${list }">
					<option value="${list.cno }">${list.cname }</option>
				</c:forEach>
			</select>
			<select id="actor3">
				<option>선택</option>
				<c:forEach var="list" items="${list }">
					<option value="${list.cno }">${list.cname }</option>
				</c:forEach>
			</select>			
		</form>
	</div>
</body>
</html>