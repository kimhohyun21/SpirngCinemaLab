<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="login/style3.css">
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
	<div class="mrList">
		<a href="reserveList.do?no=${mvo.no }">
			<span class="mrList_btn">예매내역</span>
		</a>
		<a href="reserveList.do?no=${mvo.no }&type=1">
			<span class="mrList_btn">관람내역</span>
		</a>
	</div>
	<table>
	<c:if test="${list == '[]' }">
		<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNHUKwbax2uYSi3cF5wrdrj5YNSLLx-xNQCj4aj1Ajn2duwk-tUw">
		<br> 내역이 없습니다
	</c:if>
	<c:forEach var="vo" items="${list }" begin="${start }" end="${end }" step="1">
			<tr>
				<td>
					<a href="moviedetail.do?no=${vo.mno }">
						<img src="${vo.poster}" width="250" height="350">
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
							<form id="cancelfrm" action="reserve5_Cancel.do" method="post">
								<input type="hidden" name="rNo" value="${vo.rNo}">
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
		<table>
			<tr>
				<td align="right">
					<c:if test="${page>block }">
						<a href="reserveList.do?no=${mvo.no }&type=1&page=1">
							처음
						</a>&nbsp;
						<a href="reserveList.do?no=${mvo.no }&type=1&page=${fromPage-1 }">
							이전
						</a>&nbsp;
					</c:if>
					
					<c:if test="${page<=block }">
						<a href="reserveList.do?no=${mvo.no }&type=1&page=1">
							처음
						</a>&nbsp;
						<a href="reserveList.do?no=${mvo.no }&type=1&page=${page>1?page-1:page }">
							이전
						</a>&nbsp;
					</c:if>
					
					<c:forEach var="i" begin="${fromPage }" end="${toPage }">
						[
						<c:if test="${page==i }">
							<span style="color:red">${i }</span>
						</c:if>
						<c:if test="${page!=i }">
							<a href="reserveList.do?no=${mvo.no }&type=1&page=${i }">${i }</a>
						</c:if>
						]
					</c:forEach>
					
					<c:if test="${toPage<totalPage }">
						<a href="reserveList.do?no=${mvo.no }&type=1&page=${toPage+1 }">
							다음
						</a>&nbsp;
						<a href="reserveList.do?no=${mvo.no }&type=1&page=${totalPage }">
							마지막
						</a>
					</c:if>
					
					<c:if test="${toPage>=totalPage }">
						<a href="reserveList.do?no=${mvo.no }&type=1&page=${page<totalPage?page+1:page }">
												<!-- A < B ? 만족시 : 불만족시 -->
							다음
						</a>&nbsp;
						<a href="reserveList.do?no=${mvo.no }&type=1&page=${totalPage }">
							마지막
						</a>
					</c:if>
					&nbsp;&nbsp;
					${page }page / ${totalPage }pages
				</td>
			</tr>
		</table>
	</c:if>
	
	<!-- 예매내역일때 -->
	<c:if test="${type eq '0' }">
		<table>
			<tr>
				<td align="right">
					<c:if test="${page>block }">
						<a href="reserveList.do?no=${mvo.no }&page=1">
							처음
						</a>&nbsp;
						<a href="reserveList.do?no=${mvo.no }&page=${fromPage-1 }">
							이전
						</a>&nbsp;
					</c:if>
					
					<c:if test="${page<=block }">
						<a href="reserveList.do?no=${mvo.no }&page=1">
							처음
						</a>&nbsp;
						<a href="reserveList.do?no=${mvo.no }&page=${page>1?page-1:page }">
							이전
						</a>&nbsp;
					</c:if>
					
					<c:forEach var="i" begin="${fromPage }" end="${toPage }">
						[
						<c:if test="${page==i }">
							<span style="color:red">${i }</span>
						</c:if>
						<c:if test="${page!=i }">
							<a href="reserveList.do?no=${mvo.no }&page=${i }">${i }</a>
						</c:if>
						]
					</c:forEach>
					
					<c:if test="${toPage<totalPage }">
						<a href="reserveList.do?no=${mvo.no }&page=${toPage+1 }">
							다음
						</a>&nbsp;
						<a href="reserveList.do?no=${mvo.no }&page=${totalPage }">
							마지막
						</a>
					</c:if>
					
					<c:if test="${toPage>=totalPage }">
						<a href="reserveList.do?no=${mvo.no }&page=${page<totalPage?page+1:page }">
												<!-- A < B ? 만족시 : 불만족시 -->
							다음
						</a>&nbsp;
						<a href="reserveList.do?no=${mvo.no }&page=${totalPage }">
							마지막
						</a>
					</c:if>										
					&nbsp;&nbsp;
					${page }page / ${totalPage }pages
				</td>
			</tr>
		</table>
	</c:if>
</body>
</html>