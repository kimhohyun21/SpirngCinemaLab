<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Movie Reply</title>
	<link rel="stylesheet" type="text/css" href="movie/movie_style.css">	
</head>
<body>
	<div id="reply">
		<h3 align="left">평점 및 영화 리뷰</h3>
		<!-- 댓글을 한번도 입력하지 않았던 사람에게만 입력창을 띄어줌. -->
		<c:if test="${check=='0'}">
		<form name="frm" id="frm">
			<input type="hidden" name="no" value="${vo.mNo }">
			<input type="hidden" name="page" value="${curpage}">
			<input type="hidden" name="rType" value="reply">		
			<table id="reply_table" width="1000">
				<tr>
					<td width="20%" align="center">
						평점<br>
						<span class="star_input">
							<span class="input">
								<input type="radio" name="star_input" id="p1" value="1"><label for="p1">1</label>
								<input type="radio" name="star_input" id="p2" value="2"><label for="p2">2</label>
								<input type="radio" name="star_input" id="p3" value="3"><label for="p3">3</label>
								<input type="radio" name="star_input" id="p4" value="4"><label for="p4">4</label>
								<input type="radio" name="star_input" id="p5" value="5"><label for="p5">5</label>
								<input type="radio" name="star_input" id="p6" value="6"><label for="p6">6</label>
								<input type="radio" name="star_input" id="p7" value="7"><label for="p7">7</label>
								<input type="radio" name="star_input" id="p8" value="8"><label for="p8">8</label>
								<input type="radio" name="star_input" id="p9" value="9"><label for="p9">9</label>
								<input type="radio" name="star_input" id="p10" value="10"><label for="p10">10</label>
					   		</span><br>
					   		<output for="star_input"><b name="score">0</b>점</output>
				  		</span>	
					</td>
					<td width="69%">
					<c:if test="${mvo==null }">	
						<textarea name="content" class="mcont" rows="6" cols="100" placeholder="영화 리뷰는 로그인 후에 작성하실 수 있습니다" wrap="hard" required onclick="loginCheck()"></textarea>
					</c:if>
					<c:if test="${mvo!=null }">	
						<textarea name="content" class="mcont" rows="6" cols="100" wrap="hard" required onkeypress="replySubmit()"></textarea>
					</c:if>
					</td>
					<td width="11%">
						<input type="button" value="입력" id="send" onclick="replycheck()">
					</td>
				</tr>
			</table>
		</form>
		</c:if>	
		<c:forEach var="vo2" items="${replyList }">
			<div class="replyList">
				<div align="left" id="score">
					&nbsp;${vo2.score }
					<!-- 달린 댓글에 별점 표시 -->
					<div style="CLEAR: both;	PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(image/icon_star2.png) 0px 0px;	FLOAT: left;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 89px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
						<p style="WIDTH: ${vo2.score*10}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(image/icon_star.png) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;"></p>
					</div>
				</div>
				<div align="left" id="reContent">
					<pre>${vo2.reContent }</pre>
				</div>
				<div class="nameDate">
					<fmt:formatDate value="${vo2.regDATE }" pattern="yyyy-MM-dd"/> &nbsp;|&nbsp;&nbsp;<span>${vo2.id }</span>
				</div>
				<div align="left" class="deleteBtn">	
					<c:if test="${mvo.id eq vo2.id }"> <!-- 로그인한 아이디랑 댓글 아이디랑 같을 경우 댓글 삭제 버튼 보여줌 -->
						<input class="replyDeleteBtn" type="button" value="댓글삭제" onclick="replydelete('${vo2.reNo}')">	
					</c:if>
				</div>
			</div>
		</c:forEach>
		<!-- 댓글 페이지 -->
		<table width="1000">
			<tr>
				<td align="right">
					<a href="javascript:replyPage(${vo.mNo}, ${1 })">
						<img src="image/begin.gif">
					</a>
					<c:if test="${curpage>block }">
						<a href="javascript:replyPage(${vo.mNo}, ${frompage-1 })">
							<img src="image/prev.gif">
						</a>
					</c:if>
					<c:if test="${curpage<=block }">
						<a href="javascript:replyPage(${vo.mNo}, ${curpage>1 ? curpage-1 : 1})">
							<img src="image/prev.gif">
						</a>
					</c:if>
					<c:forEach var="i" begin="${frompage }" end="${topage }">
						[<c:if test="${curpage==i }">
							<font color="red">${i }</font>
						</c:if>
						<c:if test="${curpage!=i }">
							<a href="javascript:replyPage(${vo.mNo}, ${i })">${i }</a>
						</c:if>]
					</c:forEach>
					<c:if test="${topage<totalpage }">
						<a href="javascript:replyPage(${vo.mNo}, ${topage+1 })">
							<img src="image/next.gif">
						</a>
					</c:if>
					<c:if test="${topage>=totalpage }">
						<a href="javascript:replyPage(${vo.mNo}, ${curpage<totalpage ? curpage+1 : totalpage})">
							<img src="image/next.gif">
						</a>
					</c:if>
					<a href="javascript:replyPage(${vo.mNo}, ${totalpage })">
						<img src="image/end.gif">
					</a>
					&nbsp;
					${curpage } page / ${totalpage } pages
				</td>
			</tr>
		</table>		
	</div>
	
	<!-- 별점 -->
	<script type="text/javascript">	
		var starRating = function() {
			var $star = $(".star_input"), $result = $star.find("output>b");
			$(document).on("focusin", ".star_input>.input", function() {
				$(this).addClass("focus");
			}).on("focusout", ".star_input>.input", function() {
				var $this = $(this);
				setTimeout(function() {
					if ($this.find(":focus").length === 0) {
						$this.removeClass("focus");
					}
				}, 100);
			}).on("change", ".star_input :radio", function() {
				$result.text($(this).next().text());
			}).on("mouseover", ".star_input label", function() {
				$result.text($(this).text());
			}).on("mouseleave", ".star_input>.input", function() {
				var $checked = $star.find(":checked");
				if ($checked.length === 0) {
					$result.text("0");
				} else {
					$result.text($checked.next().text());
				}
			});
		};
		starRating();
	</script>
</body>
</html>
						





















