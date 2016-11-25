<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Reserve1 Theater</title>
	<!-- Ajax 실행 -->					
	<script type="text/javascript">
		$(document).ready(function(){
			$('p.theater').hover(function(){
				$(this).css("background", "");
				$(this).toggleClass("active").next().stop(true, true).slideToggle();
			});
		});
		
	 	function theaterSelect(no){
			$('.theaterSelected').attr("class", "theater");
			$('#theater'+no).attr("class", "theaterSelected");
			
			$.ajax({
				type: "POST",
				url: "reserve.do",
				data: $('#frm3_'+no).serialize(),
				success:function(data){
					$('#movieList').html(data);
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
		<table id="time_table" width="110px">
			<tr>
				<th align="left">장</th>
			</tr>
			<tr>
				<td align="center" class="theaterList">
					<c:forEach var="vo" items="${theaterList}">
						<form id="frm3_${vo.theater }">
							<input type="hidden" name="checkedYear" value="${checkedYear }">
							<input type="hidden" name="checkedMonth" value="${checkedMonth }">
							<input type="hidden" name="checkedDay" value="${checkedDay }">
							<input type="hidden" name="checkedDay2" value="${checkedDay2 }">
							<input type="hidden" name="local" value="${local }">
							<input type="hidden" name="tname" value="${vo.theater }">
							<input type="hidden" name="grade" value="${grade }">
							<input type="hidden" name="title" value="${title }">
							<input type="hidden" name="poster" value="${poster }">
							<input type="hidden" name="rType" value="theatercheck">
						</form>	
						<a href="javascript:theaterSelect('${vo.theater }');">
							<p id="theater${vo.theater }" class="theater">${vo.theater}</p>
						</a>
					</c:forEach>					
				</td>
			</tr>
		</table>
		<div id="movieList">
			<!-- 영화리스트설정 -->
			<jsp:include page="../reserve/reserve1_MovieList.jsp" />
		</div>
	</div>
</body>
</html>