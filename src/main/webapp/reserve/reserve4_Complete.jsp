<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>결제 완료</title>
	<link rel="stylesheet" type="text/css" href="reserve/reserve_style.css">
	<script type="text/javascript">
		function reserveCancel(){
			var cancelfrom=$.parseHTML('<form id="cancelfrm" action="reserve5_Cancel.do" method="post">'
										+'<input type="hidden" name="pid" value="${pid}">'
										+'<input type="hidden" name="title" value="${title}">'
										+'</form>');
			$('body').append(cancelfrom);
			$('#cancelfrm').submit();
		}
	</script>
</head>
<body>
	<div align="center" class="finalPaymentInfo">
		<h2>예매 완료 내역</h2>
		<table class="paymentInfo">
			<tr>
				<th width="33%">영화</th>
				<th width="33%">예매 정보</th>
				<th width="33%">총 결제 금액</th>					
			</tr>
			<tr>
				<td width="40%">
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
					<span style="width: 180px;display: inline-block; vertical-align: inherit; color:#f78824;">
						${title }
					</span>				
				</td>
				<td width="30%">
					<ul>
						<li>
							<strong>상영일 :</strong> 
							<span style="color:#f78824;">
								${year }. ${month }. ${checkedDay } (${checkedDay2 })
							</span>
						</li>
						<li>
							<strong>상영시간 :</strong> 
							<span style="color:#f78824;">	
								${movietime}
							</span>	
						</li>
						<li>
							<strong>상영관 :</strong> 
							<span style="color:#f78824;">	
								${tname } ${theaterNo} 
							</span>관
						</li>
						<li>
							<strong>좌석 :</strong>
							<span style="color:#f78824;">  
							${seatNo }
							</span>
						</li>						 
					</ul>
				</td>
				
				<td width="30%">
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
		<input type="button" value="확인" onclick="javascript:location.href='reserveList.do?no=${mvo.no }'">
		<input type="button" value="예매 취소" onclick="reserveCancel()">		
	</div>
</body>
</html>