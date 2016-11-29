<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Theater Movie Time</title>
</head>
<body>
	<div align="center">
		<table id="movie_time" width="970">
			<c:forEach var="vo" items="${movieList2 }">			
				<tr class="movie_time_tr">
					<td width="40%">
						<a href="movieDetail.do?no=${vo.mNo }&type=1">
							<c:if test="${vo.grade=='0'}">
								<img src="image/bg_grade_all.png">
							</c:if>
							<c:if test="${vo.grade=='12'}">
								<img src="image/bg_grade_12.png">
							</c:if>
							<c:if test="${vo.grade=='15'}">
								<img src="image/bg_grade_15.png">
							</c:if>	
							<c:if test="${vo.grade=='18'}">
								<img src="image/bg_grade_18.png">
							</c:if>	
							<span class=votitle>${vo.title}</span>
						</a>
					</td>
					<td width="10%" align="center">${vo.theaterNo }관</td>
					<c:forEach var="vo2" items="${vo.timeList}">
						<td align="center">
							<c:if test="${vo2.movietime!=''}">
								<a href="reserve2.do?year=${year }&month=${month }&checkedDay=${checkedDay}&checkedDay2=${checkedDay2}
								&poster=${vo.poster }&local=${local }&tname=${theater }&grade=${vo.grade }&title=${vo.title}&theaterNo=${vo.theaterNo}
								&movietime=${vo2.movietime}&cType=theater#nav">
									${vo2.movietime} 
								</a>
							</c:if>
							<c:if test="${vo2.movietime==''}">
								${vo2.movietime} 
							</c:if>
						</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>