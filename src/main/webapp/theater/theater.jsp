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
	<center>
		<div id="local">
			<ul>
				<c:forEach var="vo" items="${localList }">
					<li>
						<a href="theater.do?local=${vo.local }">${vo.local }</a>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div>
			<jsp:include page="theaterList.jsp"></jsp:include>
		</div>
		<div>
			<jsp:include page="theater_pic.jsp"></jsp:include>
		</div>
		<div class="theaterReserve">
			<div id="button_div">
				<input class="button1" type="button" value="상영정보" class="info_button" onclick="javascript:location.href='#reserve'">
				<input class="button2" type="button" value="위치/교통" class="loc_button" onclick="javascript:location.href='#maplocation'">
			</div>		
			<div>
				<table width="1000"  id="reserve">
					<tr>
						<td height="40" id="day_td">
							<span id="year">${year }</span>
							<span id="month">${month }</span>
							<c:forEach var="c" begin="0" end="6" step="1" items="${strWeek2 }">
								<c:choose>
									<c:when test="${day7[z]==1}">
										<!-- 다음달로 넘어가게 되면 다음달 표기 -->
										<span id="month">${month+1 }</span>
										<a id="checkedDay"
											href="theater.do?year=${year }&month=${month+1 }&checkedDay=${day7[z]}
										&checkedDay2=${c}&local=${local }&theater=${theater }&grade=${grade }&title=${title}
										&theaterNo=${theaterNo}&movietime=${movietime}">
											<c:choose>
												<c:when test="${c eq '토'}">
													<span class="day2" style="color: blue">${day7[z] }</span>
													<span class="day" style="color: blue">${c }</span>
												</c:when>
												<c:when test="${c eq '일'}">		
													<span class="day2" style="color: red">${day7[z] }</span>
													<span class="day" style="color: red">${c }</span>
												</c:when>
												<c:otherwise>						
													<span class="day2">${day7[z] }</span>
													<span class="day">${c }</span>
												</c:otherwise>
											</c:choose>
										</a>
									</c:when>
									<c:when test="${month==12 }&${day7[z]==31 }">
										<!-- 12월 31일이면 다음년도, 1월로 표기 -->
										<span id="year">${year+1 }</span>
										<span id="month">1</span>
										<a id="checkedDay"
											href="theater.do?year=${year+1 }&month=${1 }&checkedDay=${day7[z]}
										&checkedDay2=${c}&local=${local }&theater=${theater }&grade=${grade }&title=${title}
										&theaterNo=${theaterNo}&movietime=${movietime}">
											<c:choose>
												<c:when test="${c eq '토'}">											
													<span class="day2" style="color: blue">${day7[z] }</span>
													<span class="day" style="color: blue">${c }</span>
												</c:when>
												<c:when test="${c eq '일'}">		
													<span class="day2" style="color: red">${day7[z] }</span>
													<span class="day" style="color: red">${c }</span>
												</c:when>
												<c:otherwise>		
													<span class="day2">${day7[z] }</span>
													<span class="day">${c }</span>
												</c:otherwise>
											</c:choose>
										</a>
									</c:when>
									<c:otherwise>
										<a id="checkedDay"
											href="theater.do?year=${year }&month=${month }&checkedDay=${day7[z]}
										&checkedDay2=${c}&local=${local }&theater=${theater }&grade=${grade }&title=${title}
										&theaterNo=${theaterNo}&movietime=${movietime}">
											<c:choose>
												<c:when test="${c eq '토'}">											
													<span class="day2" style="color: blue">${day7[z] }</span>
													<span class="day" style="color: blue">${c }</span>
												</c:when>
												<c:when test="${c eq '일'}">												
													<span class="day2" style="color: red">${day7[z] }</span>
													<span class="day" style="color: red">${c }</span>
												</c:when>
												<c:otherwise>											
													<span class="day2">${day7[z] }</span>
													<span class="day">${c }</span>
												</c:otherwise>
											</c:choose>
										</a>
									</c:otherwise>
								</c:choose>
								<c:set var="z" value="${z=z+1 }"></c:set>
							</c:forEach>
						</td>
					</tr>
					<tr id="movietime_tr">
						<td class="movietime">
							<jsp:include page="movie&time.jsp"></jsp:include>
						</td>
					</tr>
				</table>
			</div>
			<div id="maplocation">
				<jsp:include page="map.jsp"></jsp:include>
			</div>
			<div>
				<jsp:include page="location_info.jsp"></jsp:include>
			</div>
		</div>
	</center>
</body>
</html>





























