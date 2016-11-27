<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Theater Check Day</title>
</head>
<body>
	<div align="center">
		<div id="button_div">
			<input class="button1" type="button" value="상영정보" onclick="javascript:location.href='#reserve'">
			<input class="button2" type="button" value="위치/교통" onclick="javascript:location.href='#maplocation'">
		</div>		
		<div>
			<table width="1000"  id="reserve">
				<tr>
					<td height="40" id="day_td">
						<!-- 년, 월 표시 -->
						<div class="yearblock">
							<span id="year">
								${year }<font style="font-size:0.8em">년</font>
							</span>
							<span id="month">
								${month }<font style="font-size:0.8em">월</font>
							</span>
						</div>						
						<c:forEach var="c" begin="0" end="6" step="1" items="${strWeek2 }">
							<c:choose>
								<c:when test="${month==12 && day7[z]==1 && z!=0}">
									<!-- 12월 31일이면 다음년도, 1월로 표기 -->
									<c:set var="year" value="${year+1 }"/>
									<c:set var="month" value="1"/>
									<div class="yearblock">
										<span id="year">
											${year }<font style="font-size:0.8em">년</font>
										</span>
										<span id="month">
											${month }<font style="font-size:0.8em">월</font>
										</span>
									</div>	
								</c:when>
								<c:when test="${day7[z]==1 && z!=0}">
								<!-- 다음달로 넘어가게 되면 다음달 표기 -->
									<c:set var="month" value="${month+1 }"/>
									<div class="yearblock">
										<span id="month">
											${month }<font style="font-size:0.8em">월</font>
										</span>
									</div>
								</c:when>							
							</c:choose>	
							<!-- 날짜 표시 -->
							<form id="frm${day7[z] }">
								<input type="hidden" name="checkedYear" value="${year }">
								<input type="hidden" name="checkedMonth" value="${month }">
								<input type="hidden" name="checkedDay" value="${day7[z] }">
								<input type="hidden" name="checkedDay2" value="${c }">
								<input type="hidden" name="local" value="${local }">
								<input type="hidden" name="grade" value="${grade }">
								<input type="hidden" name="title" value="${title }">
								<input type="hidden" name="rType" value="daycheck">
							</form>	
							<a href="javascript:daySelect('${day7[z]}');">
								<c:choose>
									<c:when test="${c eq '토'}">
										<div class="dayblock" id="day${day7[z] }">
											<span class="day2" style="color: blue">${day7[z] }</span>
											<span class="day" style="color: blue">(${c })</span>
										</div>
									</c:when>
									<c:when test="${c eq '일'}">		
										<div class="dayblock" id="day${day7[z] }">	
											<span class="day2" style="color: red">${day7[z] }</span>
											<span class="day" style="color: red">(${c })</span>
										</div>
									</c:when>
									<c:otherwise>						
										<div class="dayblock" id="day${day7[z] }">
											<span class="day2">${day7[z] }</span>
											<span class="day">(${c })</span>
										</div>
									</c:otherwise>
								</c:choose>								
							</a>
							<c:set var="z" value="${z=z+1 }"></c:set>
						</c:forEach>							
					</td>
				</tr>
				<tr id="movietime_tr">
					<td class="movietime">
						<jsp:include page="theater_Movie&Time.jsp"></jsp:include>
					</td>
				</tr>
			</table>
		</div>
		<div id="maplocation">
			<jsp:include page="theater_Map.jsp"></jsp:include>
		</div>
		<div>
			<jsp:include page="theater_Location.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>