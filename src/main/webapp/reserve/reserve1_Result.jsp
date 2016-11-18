<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Reserve Result</title>
	<script type="text/javascript">
		function send(){
			var f=document.frm;
			if(${movietime==null || movietime==""}){
				$.jQueryAlert('상영시간을 선택해 주세요.');
				return;
			}
			location.href="reserve2.do?year=${checkedYear }&month=${checkedMonth }&checkedDay=${checkedDay}&checkedDay2=${checkedDay2}"
			+"&poster=${poster}&local=${local}&tname=${tname }&grade=${grade }&title=${title}&theaterNo=${theaterNo}&movietime=${movietime}"
			+"#nav";
		}
		
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
	<div id="reserve">
		<table class="paymentInfo">
			<tr>
				<th width="45%">영화</th>
				<th width="30%">예매 정보</th>
				<th width="25%">총 결제 금액</th>					
			</tr>
			<tr>
				<td width="45%">
					<img alt="${title }_poster" src="${poster }" width="110px" height="160px">
					<c:if test="${grade=='0'}">
						<img src="image/bg_grade_all.png">
					</c:if>
					<c:if test="${grade=='12'}">
						<img src="image/bg_grade_12.png">
					</c:if>
					<c:if test="${grade=='15'}">
						<img src="image/bg_grade_15.png">
					</c:if>
					<c:if test="${grade=='18'}">
						<img src="image/bg_grade_18.png">
					</c:if>
					<span style="width: 200px; display: inline-block; vertical-align: inherit; color:#f78824;">
						${title }
					</span>				
				</td>
				<td width="30%">
					<ul>
						<li>
							<strong>상영일 :</strong> 
							<span style="color:#f78824;">
								${checkedYear }. ${checkedMonth }. ${checkedDay } (${checkedDay2 })
							</span>
						</li>
						<li>
							<strong>상영관 :</strong> 
							<span style="color:#f78824;">	
								${tname } ${theaterNo } 
							</span>관
						</li>
						<li>
							<strong>상영시간 :</strong> 
							<span style="color:#f78824;">	
								${movietime}
							</span>	
						</li>						
						<li>
							<strong>좌석 :</strong>
							<span style="color:#f78824;">  
							${seatNo }
							</span>
						</li>						 
					</ul>
				</td>
				
				<td width="25%">
					<ul>
						<li>
							<strong>영화 예매 :</strong>
							<span style="color:#f78824;">  
							<c:if test="${payment!=0 }"> 
								<fmt:formatNumber value="${payment }" pattern=",000"/> 
							</c:if>
							<c:if test="${payment==0 }">
								${payment }
							</c:if>	
							</span>원
						</li>
					</ul>
				</td>
			</tr>
		</table>
		<table width="920px" class="btn_table">
			<tr>
				<td align="left">
					<input type="button" value="◀ 처음 으로" class="back_button" onclick="javascript:location.href='main.do';">
				</td>
				<td align="right">
					<input type="button" value="다음 단계 ▶" class="next_button" onclick="send()">
				</td>
			</tr>
		</table>
	</div>	 
</body>
</html>