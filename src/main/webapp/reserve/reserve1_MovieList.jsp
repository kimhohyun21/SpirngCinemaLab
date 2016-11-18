<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Reserve1 MovieList</title>
	<!-- Ajax 실행 -->					
	<script type="text/javascript">
		$(document).ready(function(){
			$('p.movie').hover(function(){
				$(this).css("background", "");
				$(this).toggleClass("active").next().stop(true, true).slideToggle();
			});
		});
		
	 	function movieSelect(no){
			$('.movieSelected').attr("class", "movie");
	 		$('p.movietime').not('#movietime'+no).css("background", "#fdedcc");
			$('#movie'+no).attr("class", "movieSelected");
			
			$.ajax({
				type: "POST",
				url: "reserve.do",
				data: $('#frm4_'+no).serialize(),
				success:function(data){
					$('#movieTime').html(data);
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
	<div align="center" class="movieList">
		<table width="394px" id="time_table">
			<tr>
				<th align="center" >영화</th>
			</tr>
			<tr>
				<td class="movie">							
					<c:forEach var="vo" items="${movieList }">
						<form id="frm4_${vo.mNo}">
							<input type="hidden" name="checkedYear" value="${checkedYear }">
							<input type="hidden" name="checkedMonth" value="${checkedMonth }">
							<input type="hidden" name="checkedDay" value="${checkedDay }">
							<input type="hidden" name="checkedDay2" value="${checkedDay2 }">
							<input type="hidden" name="local" value="${local }">
							<input type="hidden" name="tname" value="${tname }">
							<input type="hidden" name="grade" value="${vo.grade }">
							<input type="hidden" name="title" value="${vo.title }">
							<input type="hidden" name="poster" value="${vo.poster }">
							<input type="hidden" name="rType" value="moviecheck">
						</form>
						<c:if test="${vo.grade=='0'}">
							<c:set var="imgUrl" value="image/bg_grade_all.png"/>
						</c:if>
						<c:if test="${vo.grade=='12'}">
							<c:set var="imgUrl" value="image/bg_grade_12.png"/>
						</c:if>
						<c:if test="${vo.grade=='15'}">
							<c:set var="imgUrl" value="image/bg_grade_15.png"/>
						</c:if>
						<c:if test="${vo.grade=='18'}">
							<c:set var="imgUrl" value="image/bg_grade_18.png"/>
						</c:if>
						<a href="javascript:movieSelect('${vo.mNo }');">
							<p id="movie${vo.mNo}" class="movie">
								<img src="${imgUrl }" width="17px">&nbsp;${vo.title}
							</p>
						</a>						
					</c:forEach>
				</td>
			</tr>
		</table>
		<div id="movieTime">
			<!-- 상영시간설정 -->
			<jsp:include page="../reserve/reserve1_MovieTime.jsp" />
		</div>		
	</div>
</body>
</html>