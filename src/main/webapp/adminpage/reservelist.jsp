<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="adminpage/astyle.css">
</head>
<body>
	<div align="center" class="bg">
		<h3>예매 내역</h3>
		<table class="list" width="700">
			<tr>
				<th width="10%" align="center">번호</th>
				<th width="15%" align="center">이름</th>
				<th width="30%" align="center">영화이름</th>
				<th width="20%" align="center">예약일</th>
				<th width="10%" align="center">취소</th>
				<th width="10%" align="center">환불</th>
			</tr>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td align="center">${vo.rno}</td>
				<td align="center">${vo.name}</td>
				<td align="left">
					<c:if test="${msg eq vo.title}">
					<span>${vo.rtitle}</span>
					</c:if>
					
					<c:if test="${msg ne vo.title}">
						<a href="reservecontent.do?no=${vo.rno}&page=${curpage }">${vo.title}</a>
					</c:if>
				</td>
				<td align="center">
					<fmt:formatDate value="${vo.rdate}" pattern="yyyy-MM-dd"/>
				</td>
				<td align="center">${vo.cancel}</td>
				<td align="center">${vo.refund}</td>
			</tr>
			</c:forEach>
		</table>
		<table border="0" width="700">
			<tr>
				<td align="right">
					<a href="reservelist.do?page=${page>1?page-1:page}" style="color: red">이전</a>
					&nbsp;
					<c:forEach var="i" begin="${fromPage}" end="${toPage}">
						&nbsp;[
					 	<c:if test="${Page == i}">
					 		<span style="color:red">${i}</span>
					 	</c:if>
					 	<c:if test="${Page != i}">
					 		<a href="reservelist.do?page=${i}">${i}</a>
					 	</c:if>
					 	]&nbsp;
					</c:forEach>
				 	&nbsp;&nbsp;
					<a href="reservelist.do?page=${page<totalpage?page+1:page}" style="color: blue">다음</a>
					&nbsp;&nbsp;
					${page} page / ${totalpage} pages
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
