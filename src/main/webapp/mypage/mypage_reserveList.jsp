<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>MyPage ReserveList</title>
	<link rel="stylesheet" type="text/css" href="mypage/mypage_style.css">
	<script type="text/javascript">
		function reserveCancel(){
			$.ajax({
				type: "POST",
				url: "reserve5_Cancel.do",
				data:$('#cancelfrm').serialize(),
				dataType: "json",
				success:function(data){
					if(data.cancelCheck==true){
						$.jQueryAlert("성공 : "+data.cancelMsg);
						location.href="reserveList.do?no="+data.no;
					}else{
						$.jQueryAlert("실패 : "+data.cancelMsg);
						location.href="reserveList.do?no="+data.no;
					}
				},
				error:function(data){
					$.jQueryAlert("통신 실패");
				}
			});
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
	<div class="bg2" align="center">
		<a href="reserveList.do?no=${mvo.no }">
			<span class="mrList_btn">예매내역</span>
		</a>
		&nbsp;&nbsp;&nbsp;
		<a href="reserveList.do?no=${mvo.no }&type=1">
			<span class="mrList_btn">관람내역</span>
		</a>
		<div id="lion_img">
			<c:if test="${list == null}">
				<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNHUKwbax2uYSi3cF5wrdrj5YNSLLx-xNQCj4aj1Ajn2duwk-tUw">
				<p>내역이 없습니다.</p>
			</c:if>
		</div>
		<div class="reservelist">
		<table class="reserve_detail">
			<c:forEach var="vo" items="${list }" begin="${start-1 }" end="${end-1 }">				
				<tr>
					<td>
						<a href="movieDetail.do?no=${vo.mno }">
							<img src="${vo.poster}" width="200" height="300">
						</a>
					</td>
					<td>
						<h3>${vo.title }</h3><br><br>
						상영날짜: ${vo.listdate }<br>
						상영정보: ${vo.movietime }&nbsp;${vo.local }&nbsp;${vo.theater }&nbsp;${vo.theaterno }관<br>
						좌석: ${vo.seat }<br>
						결제방식: ${vo.paytype } / 금액: ${vo.payment }원 
						<c:if test="${vo.rdate > today}">
							<div align="right">
								<form id="cancelfrm">
									<input type="hidden" name="rno" value="${vo.rNo}">
									<input type="hidden" name="title" value="${vo.title}">
								</form>
								<input type="button" value="예매취소" onclick="reserveCancel()">
							</div>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- 관람내역 일때 -->
		<c:if test="${type eq '1' }">
			<table id="type_1">
				<tr>
					<td align="right">
						<a href="reserveList.do?no=${mvo.no }&page=${1}">
							<img src="image/begin.gif">
						</a>
						<c:if test="${curpage>block }">
							<a href="reserveList.do?no=${mvo.no }&page=${1}">
								<img src="image/prev.gif">
							</a>
						</c:if>
							
						<c:if test="${curpage<=block }">
							<a href="reserveList.do?no=${mvo.no }&page=${curpage>1 ? curpage-1 : 1}">
								<img src="image/prev.gif">
							</a>
						</c:if>
							
						<c:forEach var="i" begin="${fromPage }" end="${toPage }">
							[
							<c:if test="${curpage==i }">
								<span style="color:red">${i }</span>
							</c:if>
							<c:if test="${curpage!=i }">
								<a href="reserveList.do?no=${mvo.no }&page=${i }">${i }</a>
							</c:if>
							]
						</c:forEach>
							
						<c:if test="${toPage<totalPage }">
							<a href="reserveList.do?no=${mvo.no }&page=${toPage+1 }">
								<img src="image/next.gif">
							</a>
						</c:if>
							
						<c:if test="${toPage>=totalPage }">
							<a href="reserveList.do?no=${mvo.no }&page=${curpage<totalPage?curpage+1:totalPage }">
													<!-- A < B ? 만족시 : 불만족시 -->
								<img src="image/next.gif">
							</a>
						</c:if>			
						<a href="reserveList.do?no=${mvo.no }&page=${totalPage }">
							<img src="image/end.gif">
						</a>							
						&nbsp;
						${curpage }page / ${totalPage }pages
					</td>
				</tr>
			</table>
		</c:if>
		
		<!-- 예매내역일때 -->
		<c:if test="${type eq '0' }">
			<table id="type_0">
				<tr>
					<td align="right">
						<a href="reserveList.do?no=${mvo.no }&page=${1}">
							<img src="image/begin.gif">
						</a>
						<c:if test="${curpage>block }">
							<a href="reserveList.do?no=${mvo.no }&page=${1}">
								<img src="image/prev.gif">
							</a>
						</c:if>
							
						<c:if test="${curpage<=block }">
							<a href="reserveList.do?no=${mvo.no }&page=${curpage>1 ? curpage-1 : 1}">
								<img src="image/prev.gif">
							</a>
						</c:if>
							
						<c:forEach var="i" begin="${fromPage }" end="${toPage }">
							[
							<c:if test="${curpage==i }">
								<span style="color:red">${i }</span>
							</c:if>
							<c:if test="${curpage!=i }">
								<a href="reserveList.do?no=${mvo.no }&page=${i }">${i }</a>
							</c:if>
							]
						</c:forEach>
							
						<c:if test="${toPage<totalPage }">
							<a href="reserveList.do?no=${mvo.no }&page=${toPage+1 }">
								<img src="image/next.gif">
							</a>
						</c:if>
							
						<c:if test="${toPage>=totalPage }">
							<a href="reserveList.do?no=${mvo.no }&page=${curpage<totalPage?curpage+1:totalPage }">
													<!-- A < B ? 만족시 : 불만족시 -->
								<img src="image/next.gif">
							</a>
						</c:if>			
						<a href="reserveList.do?no=${mvo.no }&page=${totalPage }">
							<img src="image/end.gif">
						</a>							
						&nbsp;
						${curpage }page / ${totalPage }pages
					</td>
				</tr>
			</table>
		</c:if>
		</div>
	</div>
</body>
</html>