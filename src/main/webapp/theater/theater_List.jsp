<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Theater List</title>
</head>
<body>
	<div align="center"> 
		<div id="theaterList">
			<ul>
				<c:forEach var="vo" items="${theaterList }" varStatus="status">
					<li id="theater_${status.index }" onclick="theaterSelect('${local}', '${vo.theater}', '${status.index }')">
						<span>${vo.theater }</span>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div id="theater_pic">
			<c:if test="${num=='1' }">
				<img src="image/1.jpg" style="max-width:100%">
			</c:if>
			<c:if test="${num=='2' }">
				<img src="image/2.jpg" style="max-width:100%">
			</c:if>
			<c:if test="${num=='3' }">
				<img src="image/3.jpg" style="max-width:100%">
			</c:if>
			<c:if test="${num=='4' }">
				<img src="image/4.jpg" style="max-width:100%">
			</c:if>
		</div>
		<div class="theaterReserve" id="theater_CheckDay">
			<jsp:include page="theater_CheckDay.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>