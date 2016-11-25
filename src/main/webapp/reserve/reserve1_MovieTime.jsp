<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Reserve1 MovieTime</title>
	<!-- Ajax 실행 -->					
	<script type="text/javascript">	
		$(document).ready(function(){
			$('p.movietime').hover(function(){
				$(this).css("background", "");
				$(this).toggleClass("active").next().stop(true, true).slideToggle();
			});
		});
	
	 	function timeSelect(no){	 		
			$('.timeSelected').attr("class", "movietime");
			$('#movietime'+no).attr("class", "timeSelected");
			
			$.ajax({
				type: "POST",
				url: "reserve.do",
				data: $('#frm5_'+no).serialize(),
				success:function(data){
					$('#selectInfo').html(data);
				},
				error:function(data){
					$.jQueryAlert("실패");
				}
			});
		}; 		
		
		/* jQuery Alert 창 */
		jQuery.jQueryAlert = function (msg) {
	        var $messageBox = $.parseHTML('<div id="alertBox"></div>');
	        $("body").append($messageBox);
	
	        $($messageBox).dialog({
	            open: $($messageBox).append(msg),
	            autoOpen: true,
	            modal: true,
	            resizable:false, 
				width: 400,
	            buttons: {
	                OK: function () {
	                    $(this).dialog("close");
	                }
	            }
	        });
	    };    
	</script>
</head>
<body>
	<div align="center">
		<table width="153px" id="time_table">
			<tr>
				<th align="center" class="menu noborder">시간</th>
			</tr>
			<tr>
				<td align="center" class="noborder">
					<p id="theaterNo">${theaterNo2 } 관</p>
					<c:forEach var="vo" items="${timeList }">
						<form id="frm5_${vo.tNo }">
							<input type="hidden" name="checkedYear" value="${checkedYear }">
							<input type="hidden" name="checkedMonth" value="${checkedMonth }">
							<input type="hidden" name="checkedDay" value="${checkedDay }">
							<input type="hidden" name="checkedDay2" value="${checkedDay2 }">
							<input type="hidden" name="local" value="${local }">
							<input type="hidden" name="tname" value="${tname }">
							<input type="hidden" name="grade" value="${grade }">
							<input type="hidden" name="title" value="${title }">
							<input type="hidden" name="poster" value="${poster }">
							<input type="hidden" name="theaterNo" value="${theaterNo2 }">
							<input type="hidden" name="movietime" value="${vo.movietime }">
							<input type="hidden" name="rType" value="timecheck">
						</form>
						<a href="javascript:timeSelect('${vo.tNo }');">
							<p id="movietime${vo.tNo }" class="movietime">${vo.movietime }</p>
						</a>
					</c:forEach>
				</td>
			</tr>
		</table>
		<!-- 상영 정보 선택 결과 -->
		<div id="selectInfo">
			<jsp:include page="../reserve/reserve1_Result.jsp" />
		</div>		
	</div>
</body>
</html>