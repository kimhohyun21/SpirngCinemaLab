<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Reserve 1</title>
	<link rel="stylesheet" type="text/css" href="reserve/reserve_style.css">
	<!-- Ajax 실행 -->					
	<script type="text/javascript">	
		$(document).ready(function(){
			$("p#day${day7[0] }").attr("class", "daySelected");
			$("p#local${local }").attr("class", "localSelected");
			$("p#theater${tname }").attr("class", "theaterSelected");
			$('p#movie${nMo }').attr("class", "movieSelected");
			$('p.day').hover(function(){
				$(this).css("background", "");
				$(this).toggleClass("active").next().stop(true, true).slideToggle();
			});
		});
		
		function daySelect(no){
			$('.daySelected').attr("class", "day");
			$('#day'+no).attr("class", "daySelected");
			$.ajax({
				type: "POST",
				url: "reserve.do",
				data: $('#frm'+no).serialize(),
				success:function(data){
					$('#localList').html(data);
				},
				error:function(data){
					$.jQueryAlert("실패");
				}
			});
		};
		
	</script>
</head>
<body>
	<div align="center" class="reserve1">
		<table id="time_table" width="153px">
			<tr>
				<th align="center">날짜</th>
			</tr>
			<tr>
				<td align="center">
					<!-- 년, 월 표시 -->
					<p class="year">${year }</p>
					<p class="month">${month }</p>
					<br/>
					<c:forEach var="c" begin="0" end="6" step="1" items="${strWeek2 }">
						<c:choose>
							<c:when test="${month==12 && day7[z]==1 && z!=0}">
								<!-- 12월 31일이면 다음년도, 1월로 표기 -->
								<br/>
								<c:set var="year" value="${year+1 }"/>
								<c:set var="month" value="1"/>
								<p class="year">${year }</p>
								<p class="month">${month }<br></p>
							</c:when>
							<c:when test="${day7[z]==1 && z!=0}">
							<!-- 다음달로 넘어가게 되면 다음달 표기 -->
								<c:set var="month" value="${month+1 }"/>
								<br>
								<p class="month">${month }</p>
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
							<input type="hidden" name="poster" value="${poster }">
							<input type="hidden" name="rType" value="daycheck">
						</form>	
						<a href="javascript:daySelect('${day7[z]}');">									
							<c:choose>
								<c:when test="${c eq '토'}">
									<p id="day${day7[z] }" class="day" style="color: blue">
										<span>${c }</span> ${day7[z] }
									</p>
								</c:when>
								<c:when test="${c eq '일'}">
									<p id="day${day7[z] }" class="day" style="color: red">
										<span>${c }</span> ${day7[z] }
									</p>
								</c:when>
								<c:otherwise>
									<p id="day${day7[z] }" class="day">
										<span>${c }</span> ${day7[z] }
									</p>
								</c:otherwise>
							</c:choose>
						</a>
						<c:set var="z" value="${z=z+1 }"></c:set>
					</c:forEach>
				</td>
			</tr>
		</table>
		<div id="localList">
			<!-- 지역 설정 -->
			<jsp:include page="../reserve/reserve1_Local.jsp" />
		</div>		
	</div>		
</body>	
</html>























