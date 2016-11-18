<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Reserve2 Seat</title>	
	<script type="text/javascript">		
		$(document).ready(function(){
			seat();			
		})
		
		//이미 예약된 자리를 비활성화 시키는 함수
		function seat(){
			if(${slist}!=null){
				<c:forEach var="sit" items="${slist}">
					var $seat=$('#${sit}')
					$seat.attr('disabled', 'true');
					var $label=$('div.line ul li label[for=${sit}]');
					$label.css({
						"box-shadow" : "0 0 #ab3c3c",
						"background-color" : "gray",
						"background-image" : "url('image/x.png')",
						"background-position" : "center",
						"background-size" : "cover",
						"text-indent" : "-9999px",
						"top" : "1px"
					});
				</c:forEach>
			}	
		}		
		
		//자리 체크에 따른 Ajax와 스타일 함수
		function check(){
			if(${adult==0} && ${senior==0} && ${junior==0}){
				$.jQueryAlert('티켓 매수를 선택해 주세요.');
				location.href="#";
				return;
			}else{				
				$.ajax({					
					type: "POST",
					url: "reserve2.do",
					data:$('#frm2').serialize(),
					success:function(data){
						$('#result2').html(data);
					},
					error:function(data){
						$.jQueryAlert("실패");
					}
				});
				
				//체크된 체크박스 스타일 적용
				var $checked=$('div.line ul li input[type=checkbox]:checked + label.btn');
				$checked.css({
					"box-shadow" : "0 0 #ab3c3c",
					"background" : "#862f2f",
					"top" : "1px"
				});
				
				//체크 해제된 체크박스 스타일 제거
				$checked.click(function(){
					$(this).removeAttr('style');
				});			
				
				//이미 예약된 자리를 비활성화 시키는 함수
				seat();				
				
				var $checkCount=$('div.line ul li input[type=checkbox]:checked').length;
				var $nocheck=$('div.line ul li input[type=checkbox]').not(':checked');
				if(${ticketAll}==$checkCount){
					//티켓 매수대로 선택이 완료되면, 나머지 자리 체크 불가
					$nocheck.attr('disabled', 'true');
					
					//티켓 매수대로 선택이 완료되면, 체크 불가된자리 스타일 적용
					var $nochecklabel=$('div.line ul li input[disabled=disabled] + label.btn');
					$nochecklabel.css({
						"box-shadow" : "0 0 #ab3c3c",
						"background-color" : "gray",
						"background-image" : "url('image/x.png')",
						"background-position" : "center",
						"background-size" : "cover",
						"text-indent" : "-9999px",
						"top" : "1px"
					});
					
				}else if(${ticketAll} > $checkCount){
					//체크해제하여 매수와 선택한 자리수가 일치 하지 않을 때, 체크 불가였던 자리 스타일 복원
					var $nochecklabel=$('div.line ul li input[disabled=disabled] + label.btn');
					$nochecklabel.removeAttr('style');
					
					//체크해제하여 매수와 선택한 자리수가 일치 하지 않을 때, 체크 불가였던 자리 체크 가능으로 속성 변환
					$nocheck.removeAttr('disabled', 'disabled');
					
					//이미 예약된 자리를 비활성화 시키는 함수
					seat();	
				}
			}
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
	<div class="seatchoice">
		<div class=screen>
			<Strong class=screen-title>
				SCREEN
			</strong>
		</div>
		<div class="seat" align="center">
	    <form id="frm2">
	    	<input type="hidden" name="year" value="${year }">
			<input type="hidden" name="month" value="${month }">
			<input type="hidden" name="checkedDay" value="${checkedDay }">
			<input type="hidden" name="checkedDay2" value="${checkedDay2 }">
			<input type="hidden" name="local" value="${local }">
			<input type="hidden" name="tname" value="${tname }">
			<input type="hidden" name="grade" value="${grade }">
			<input type="hidden" name="title" value="${title }">
			<input type="hidden" name="poster" value="${poster }">				
			<input type="hidden" name="theaterNo" value="${theaterNo}">
			<input type="hidden" name="movietime" value="${movietime}">
			<input type="hidden" name="adult" value="${adult}">
			<input type="hidden" name="senior" value="${senior}">
			<input type="hidden" name="junior" value="${junior}">
			<input type="hidden" name="rType" value="result">		
		   	<c:forEach var="sa" begin="0" end="10" items="A,B,C,D,E,F,G,H,I,J">
		   	<div class="line" align="center">
		  		<ul>
		  		<li style="border: 0px;font-size: 11pt;font-weight:bold;color:black;background-color: rgba(0,0,0,0);text-shadow:0px 3px 5px #808080;">
		  			${sa }
		  		</li>		  		
			<c:forEach var="b" begin="1" end="20">
				<li>
					<input type="checkbox" id="${sa }${b }" name="seat" value="${sa }${b }" onchange="check()" class="seat">
					<label for="${sa }${b }" class="btn">${b }</label>
				</li>
			<c:if test="${b==4 || b==16}">
				<li style="border: 0px; margin: 0px; background-color: rgba(0,0,0,0);"></li>
				<li style="border: 0px; margin: 0px; background-color: rgba(0,0,0,0);"></li>		
			</c:if>
				</c:forEach>
				</ul>
			</div>
			<br/>
			</c:forEach>		
	    </form>
		</div>
	</div>
	<div id="result2">
		<jsp:include page="${jsp3 }"></jsp:include>
	</div>
</body>
</html>