<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="mypage/mypage_style.css">
	<style type="text/css">
		tr,td{
			padding: 10px;
		}
	</style>
	<script type="text/javascript">
		function reserveCancel(){
			$('#cancelfrm').submit();
		}
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
			<c:if test="${list == '[]' }">
				<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNHUKwbax2uYSi3cF5wrdrj5YNSLLx-xNQCj4aj1Ajn2duwk-tUw">
				<p>내역이 없습니다.</p>
			</c:if>
		</div>
		<div class="reservelist">
		<c:forEach var="vo" items="${list }" begin="${start }" end="${end }" step="1">
			<table class="reserve_detail" border="1">
			
					<tr>
						<td rowspan="5">
							<a href="moviedetail.do?no=${vo.mno }">
								<img src="${vo.poster}" width="200" height="300">
							</a>
						</td>
						<td>
							<table >
								<tr>
									<td>
										<h3>${vo.title }</h3>
									</td>
								</tr>
								<tr>
									<td>
										상영날짜: ${vo.listdate }
									</td>
								</tr>
								<tr>
									<td>
										상영정보: ${vo.movietime }&nbsp;${vo.local }&nbsp;${vo.theater }&nbsp;${vo.theaterno }관
									</td>
								</tr>
								<tr>
									<td>
										좌석: ${vo.seat }
									</td>
								</tr>
								<tr>
									<td>
										결제방식: ${vo.paytype } / 금액: ${vo.payment }원 
									</td>
								</tr>
							</table>
							<c:if test="${vo.rdate > today}">
								<div align="right">
									<form id="cancelfrm" action="reserve5_Cancel.do" method="post">
										<input type="hidden" name="rNo" value="${vo.rNo}">
										<input type="hidden" name="title" value="${vo.title}">
									</form>
									<input type="button" value="예매취소" onclick="reserveCancel()">
								</div>
							</c:if>
						</td>
					</tr>
			
			</table>
		</c:forEach>
		
		<!-- 관람내역 일때 -->
		<c:if test="${type eq '1' }">
			<table id="type_1">
				<tr>
					<td align="right">
						<a href="reserveList.do?no=${mvo.no }&page=${1}">
							<!-- <img src="image/begin.gif"> -->처음
						</a>
						<c:if test="${curpage>block }">
							<a href="reserveList.do?no=${mvo.no }&page=${1}">
								<!-- <img src="image/prev.gif"> -->이전
							</a>
						</c:if>
							
						<c:if test="${curpage<=block }">
							<a href="reserveList.do?no=${mvo.no }&page=${curpage>1 ? curpage-1 : 1}">
								<!-- <img src="image/prev.gif"> -->이전
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
								<!-- <img src="image/next.gif"> -->다음
							</a>
						</c:if>
							
						<c:if test="${toPage>=totalPage }">
							<a href="reserveList.do?no=${mvo.no }&page=${curpage<totalPage?curpage+1:totalPage }">
													<!-- A < B ? 만족시 : 불만족시 -->
								<!-- <img src="image/next.gif"> -->다음
							</a>
						</c:if>			
						<a href="reserveList.do?no=${mvo.no }&page=${totalPage }">
							<!-- <img src="image/end.gif"> -->마지막
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