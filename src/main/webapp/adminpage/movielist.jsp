<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="adminpage/astyle.css">
</head>
<body>
	<center>
		<table width="699" class="reg_btn">
			<tr>
				<td>
					<a href="AmovieInsert.do">
						<button class="menu_insert">영화등록</button>						
					</a>
				</td>
			</tr>
		</table>
		<table width="700" class="type01">
		<thead>
			<tr>
				<th>제목</th>
				<th>개봉일</th>
				<th>상영정보</th>
				<th>순위</th>
				<th>좋아요</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="vo" begin="${start }" end="${end }">
				<tr>
					<td align="left">
						<a href="movieDetail.do?no=${vo.mNo }">
							${vo.title }
						</a>						
					</td>
					<td align="center">
						${vo.date }
					</td>
					<td align="center">
						<c:if test="${vo.type == 0 }">상영종료</c:if>
						<c:if test="${vo.type == 1 }">상영중</c:if>
						<c:if test="${vo.type == 2 }">상영예정</c:if>
					</td>
					<td align="center">
						${vo.rank }
					</td>
					<td align="center">
						${vo.movieLike }
					</td>
				</tr>
			</c:forEach>
		</tbody>
			<tr>
				<td colspan="5" align="right">
					<a href="aMovieList.do?page=${page>1?page-1:page}" style="color: red">
						이전
					</a>&nbsp;
					
					<c:forEach var="i" begin="${fromPage}" end="${toPage}">
						&nbsp;[
					 	<c:if test="${page == i}">
					 		<span style="color:red">${i}</span>
					 	</c:if>
					 	<c:if test="${page != i}">
					 		<a href="aMovieList.do?page=${i }">${i }</a>
					 	</c:if>
					 	]&nbsp;
					</c:forEach>
				 	&nbsp;
				 	<a href="aMovieList.do?page=${page<totalPage?page+1:page}" style="color: blue">
				 		다음
				 	</a>							
					&nbsp;&nbsp;
					${page }page / ${totalPage }pages
				</td>
			</tr>
		</table>
	</center>
</body>
</html>