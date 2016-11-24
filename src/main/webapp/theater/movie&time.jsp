<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="theater/style.css">
</head>
<body>
	<div class="movie_time">
	<table id="movie_time" width="990">
		<c:forEach var="vo" items="${movieList2 }">
			<c:if test="${vo.grade=='0'}">
				<tr class="movie_time_tr">
					<td width="40%">
						<a href="movieDetail.do?no=${vo.mNo }">
							<img src="image/bg_grade_all.png">&nbsp;${vo.title}
						</a>
					</td>
					<td width="10%" align="center">${vo.theaterNo }관</td>
					<c:forEach var="vo2" items="${vo.timeList}">
						<td align="center">
							<a href="reserve2.do?year=${year }&month=${month }&checkedDay=${checkedDay}&checkedDay2=${checkedDay2}
							&poster=${vo.poster }&local=${local }&tname=${theater }&grade=${grade }&title=${vo.title}&theaterNo=${vo.theaterNo}
							&movietime=${vo2.movietime}&cType=theater#nav">
								${vo2.movietime} 
							</a>
						</td>
					</c:forEach>
				</tr>
			</c:if>
			<c:if test="${vo.grade=='12'}">
				<tr class="movie_time_tr">
					<td width="40%">
						<a href="movieDetail.do?no=${vo.mNo }">
							<img src="image/bg_grade_12.png">&nbsp;${vo.title}
						</a>
					</td>
					<td width="10%" align="center">${vo.theaterNo }관</td>
					<c:forEach var="vo2" items="${vo.timeList}">
						<td align="center">
							<a href="reserve2.do?year=${year }&month=${month }&checkedDay=${checkedDay}&checkedDay2=${checkedDay2}
							&poster=${vo.poster }&local=${local }&tname=${theater }&grade=${grade }&title=${vo.title}&theaterNo=${vo.theaterNo}
							&movietime=${vo2.movietime}&cType=theater#nav">
								${vo2.movietime}
							</a>
						</td>
					</c:forEach>
				</tr>
			</c:if>
			<c:if test="${vo.grade=='15'}">
				<tr>
					<td width="40%">
						<a href="movieDetail.do?no=${vo.mNo }">
							<img src="image/bg_grade_15.png">&nbsp;${vo.title}
						</a>
					</td>
					<td width="10%" align="center">${vo.theaterNo }관</td>
					<c:forEach var="vo2" items="${vo.timeList }">
						<td align="center">
							<a href="reserve2.do?year=${year }&month=${month }&checkedDay=${checkedDay}&checkedDay2=${checkedDay2}
							&poster=${vo.poster }&local=${local }&tname=${theater }&grade=${grade }&title=${vo.title}&theaterNo=${vo.theaterNo}
							&movietime=${vo2.movietime}&cType=theater#nav">
								${vo2.movietime } 
							</a>
						</td>
					</c:forEach>
				</tr>
			</c:if>
			<c:if test="${vo.grade=='18'}">
				<tr class="movie_time_tr">
					<td width="40%">
						<a href="movieDetail.do?no=${vo.mNo }">
					 		<img src="image/bg_grade_18.png">&nbsp;${vo.title}
						</a>
					</td>
					<td width="10%" align="center">${vo.theaterNo }관</td>
					<c:forEach var="vo2" items="${vo.timeList }">
						<td align="center">
							<a href="reserve2.do?year=${year }&month=${month }&checkedDay=${checkedDay}&checkedDay2=${checkedDay2}
							&poster=${vo.poster }&local=${local }&tname=${theater }&grade=${grade }&title=${vo.title}&theaterNo=${vo.theaterNo}
							&movietime=${vo2.movietime}&cType=theater#nav">
								${vo2.movietime} 
							</a>
						</td>
					</c:forEach>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	</div>
</body>
</html>