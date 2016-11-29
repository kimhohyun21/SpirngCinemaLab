<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
						var func=function(){location.replace("reserveList.do?no="+data.no);};
						$.jQueryAlertF("성공 : "+data.cancelMsg, func);
						
					}else{
						var func=function(){location.replace("reserveList.do?no="+data.no);};
						$.jQueryAlert("실패 : "+data.cancelMsg, func);
					}
				},
				error:function(data){
					$.jQueryAlert("통신 실패");
				}
			});
		}
	</script>
</head>
<body>
	<div class="bg2">
		<div class="reserve_btn">
			<a href="reserveList.do?no=${mvo.no }">
				<input type="button" class="mrList_btn" value="예매내역">
			</a>
			&nbsp;&nbsp;&nbsp;
			<a href="reserveList.do?no=${mvo.no }&type=1">
				<input type="button" class="mrList_btn" value="관람내역">
			</a>
		</div>
		
		<div class="div1">
			<c:if test="${type eq '0' }">
				<h3 class="detail_h3">예매내역</h3>
			</c:if>
			<c:if test="${type eq '1' }">
				<h3 class="detail_h3">관람내역</h3>
			</c:if>
		</div>
		
		<c:if test="${list == '[]' }">
			<div id="lion_img">
				<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNHUKwbax2uYSi3cF5wrdrj5YNSLLx-xNQCj4aj1Ajn2duwk-tUw">
				<p>내역이 없습니다.</p>
			</div>
		</c:if>
		
		<c:if test="${list != '[]' }">
		<div class="reservelist" >
			<table class="div2">
			<c:set var="i" value="1"/>
			<c:set var="j" value="2"/>
	        <c:forEach var="vo" items="${list }" begin="${start-1 }" end="${end-1 }" step="1">
	        <c:if test="${i==1 }">
	        	<tr>
	        </c:if>
	         		<td>
	         			<table width="380" height="210" cellspacing="8" class="inside">
	         				<tr>
			                  <td class="poster" width="150">
			                     <a href="movieDetail.do?no=${vo.mno }&type=1">
			                        <img src="${vo.poster}" width="150">
			                     </a>
			                  </td>
			                  <td class="detail" width="230">
			                     <h3>${vo.title }</h3> <br>
			                     <b>상영날짜:</b> <fmt:formatDate value="${vo.rdate }" pattern="yyyy-MM-dd"/><br>
			                     <b>상영시간:</b> ${vo.movietime }<br>
			                     <b>상영장소:</b>${vo.local }&nbsp;${vo.theater }&nbsp;${vo.theaterno }관<br>
			                     <b>좌석:</b> ${vo.seat }<br>
			                     <b>결제방식:</b> ${vo.paytype }<br>
			                     <b>금액:</b> ${vo.payment }원<br>
			                     <c:if test="${vo.rdate > today}">
			                        <div class="cancel"align="right">
			                           <form id="cancelfrm">
			                              <input type="hidden" name="rno" value="${vo.rNo}">
			                              <input type="hidden" name="title" value="${vo.title}">
			                           </form>
			                           <input type="button" value="예매취소" class="reserve_cancel" onclick="reserveCancel()">
			                        </div>
			                     </c:if>
			                  </td>
			               </tr>
			         	</table>      
	         		</td>
	         	<c:set var="i" value="${i+1 }"/>
	         	<c:if test="${i==j+1 }">
	         	</tr>
	         	<c:set var="i" value="1"/>
	         	</c:if>		
	        </c:forEach>
      		</table>
      	</div>
      	</c:if>
		
		
		<c:if test="${type eq '1' }">
		<!-- 관람내역 일때 -->
		<div class="page">
			<table id="type_1" align="right">
				<tr>
					<td>
						<a href="reserveList.do?no=${mvo.no }&page=1&type=${type}">
							<img src="image/begin.gif">
						</a>
						<c:if test="${curpage>block }">
							<a href="reserveList.do?no=${mvo.no }&page=${curpage-1}&type=${type}">
								<img src="image/prev.gif">
							</a>
						</c:if>
							
						<c:if test="${curpage<=block }">
							<a href="reserveList.do?no=${mvo.no }&page=${curpage>1 ? curpage-1 : 1}&type=${type}">
								<img src="image/prev.gif">
							</a>
						</c:if>
							
						<c:forEach var="i" begin="${fromPage }" end="${toPage }">
							[
							<c:if test="${curpage==i }">
								<span style="color:red">${i }</span>
							</c:if>
							<c:if test="${curpage!=i }">
								<a href="reserveList.do?no=${mvo.no }&page=${i }&type=${type}">${i }</a>
							</c:if>
							]
						</c:forEach>
							
						<c:if test="${toPage<totalPage }">
							<a href="reserveList.do?no=${mvo.no }&page=${toPage+1 }&type=${type}">
								<img src="image/next.gif">
							</a>
						</c:if>
							
						<c:if test="${toPage>=totalPage }">
							<a href="reserveList.do?no=${mvo.no }&page=${curpage<totalPage?curpage+1:totalPage }&type=${type}">
													<!-- A < B ? 만족시 : 불만족시 -->
								<img src="image/next.gif">
							</a>
						</c:if>			
						<a href="reserveList.do?no=${mvo.no }&page=${totalPage }&type=${type}">
							<img src="image/end.gif">
						</a>							
						&nbsp;
						${curpage }page / ${totalPage }pages
					</td>
				</tr>
			</table>
		</div>
		</c:if>
	
		<c:if test="${type eq '0' }">
		<!-- 예매내역일때 -->
		<div class="page1">
			<table id="type_0" align="right">
				<tr>
					<td>
						<a href="reserveList.do?no=${mvo.no }&page=1&type=${type}">
							<img src="image/begin.gif">
						</a>
						<c:if test="${curpage>block }">
							<a href="reserveList.do?no=${mvo.no }&page=${curpage-1}&type=${type}">
								<img src="image/prev.gif">
							</a>
						</c:if>
							
						<c:if test="${curpage<=block }">
							<a href="reserveList.do?no=${mvo.no }&page=${curpage>1 ? curpage-1 : 1}&type=${type}">
								<img src="image/prev.gif">
							</a>
						</c:if>
							
						<c:forEach var="i" begin="${fromPage }" end="${toPage }">
							[
							<c:if test="${curpage==i }">
								<span style="color:red">${i }</span>
							</c:if>
							<c:if test="${curpage!=i }">
								<a href="reserveList.do?no=${mvo.no }&page=${i }&type=${type}">${i }</a>
							</c:if>
							]
						</c:forEach>
							
						<c:if test="${toPage<totalPage }">
							<a href="reserveList.do?no=${mvo.no }&page=${toPage+1 }&type=${type}">
								<img src="image/next.gif">
							</a>
						</c:if>
							
						<c:if test="${toPage>=totalPage }">
							<a href="reserveList.do?no=${mvo.no }&page=${curpage<totalPage?curpage+1:totalPage }&type=${type}">
													<!-- A < B ? 만족시 : 불만족시 -->
								<img src="image/next.gif">
							</a>
						</c:if>			
						<a href="reserveList.do?no=${mvo.no }&page=${totalPage }&type=${type}">
							<img src="image/end.gif">
						</a>							
						&nbsp;
						${curpage }page / ${totalPage }pages
					</td>
				</tr>
			</table>
		</div>
		</c:if>
	</div>
</body>
</html>