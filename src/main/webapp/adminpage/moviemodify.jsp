<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="adminpage/astyle.css">
<script type="text/javascript">
	function send(){
		var f=document.frm;
		
		f.submit();
}
	function num(){
		if( (event.keyCode<48)||(event.keyCode>57) ){
			event.returnValue=false;
		}
	}
	function re(){
		top.document.location.reload();
	}
</script>
</head>
<body>
	<div align="center">
	<form action="Amodify_Ok.do" name="frm" method="post">
		<table width="700" height="280" class="type02">
			<thead>
				<tr>
					<th align="center" colspan="4" class="char_title">
						영화수정
					</th>
				</tr>
			</thead>
			<tr class="br">
				<th>
					<input type="hidden" value="${no }"	name="no">
					제목
				</th>
				<td align="left">
					<input type="text" value="${vo.title }" name="title" style="width: 60%">					
				</td>
				<th>
					시청연령
				</th>
				<td align="left">
					<select name="grade">
						<option>선택</option>						
						<c:if test="${vo.grade eq '12' }">
							<option value="12" selected="selected">12</option>
							<option value="15">15</option>
							<option value="18">18</option>
						</c:if>
						<c:if test="${vo.grade eq '15' }">
							<option value="12">12</opticon>
							<option value="15" selected="selected">15</option>
							<option value="18">18</option>
						</c:if>
						<c:if test="${vo.grade eq '18' }">
							<option value="12">12</option>
							<option value="15">15</option>
							<option value="18" selected="selected">18</option>
						</c:if>
					</select>
					세
				</td>
			</tr>
			
			<tr>
				<th>
					포스터 URL
				</th>
				<td align="left" colspan="3">
					<input type="text" value="${vo.poster }" name="poster" style="width:90%">
				</td>
			</tr>
			
			<tr>
				<th>
					상영일
				</th>
				<td align="left">					
					<input type=text value="${year }" name="year" size="1" placeholder="년도" onkeypress="num()">
					<b>- </b><input type="text" value="${month }" name="month" size="1" placeholder="월" onkeypress="num()">
					<b>- </b><input type="text" value="${day }" name="day" width="10"  size="1" placeholder="일" onkeypress="num()">
				</td>
				<th>
					상영종류
				</th>
				<td align="left">
					<select name="type">
						<option>선택</option>
						<c:if test="${vo.type eq '0' }">
							<option value="0" selected="selected">상영종료</option>
							<option value="1">상영중</option>
							<option value="2">상영예정</option>
						</c:if>
						<c:if test="${vo.type eq '1' }">
							<option value="0">상영종료</option>
							<option value="1" selected="selected">상영중</option>
							<option value="2">상영예정</option>
						</c:if>
						<c:if test="${vo.type eq '2' }">
							<option value="0">상영종료</option>
							<option value="1">상영중</option>
							<option value="2" selected="selected">상영예정</option>
						</c:if>
					</select>					
				</td>
			</tr>
			
			<tr>
				<th>
					감독
				</th>
				<td align="left">
					<input type="text" value="${vo.director }" name="director" style="width: 60%">
				</td>
				<th>
					상영시간
				</th>
				<td align="left">
					<input type="text" value="${vo.runtime }" size="1" name="runtime" onkeypress="num()">분
				</td>
			</tr>
			<tr>
				<th>
					장르
				</th>
				<td colspan="3">
					<input type="text" value="${vo.genre }" name="genre" style="width: 90%">
				</td>
			</tr>
			<tr>
				<th>
					예고편
				</th>
				<td align="left" colspan="3">
					<input type="text" value="${vo.trailer }" name="trailer" style="width:90%">
				</td>
			</tr>
			<tr>
				<th>
					출연인물
				</th>
				<td align="left" colspan="3">
					<pre><textarea style="width: 95%" cols="50" rows="10" name="cast">${vo.cast }</textarea></pre>
				</td>
			</tr>
			<tr>
				<th>
					줄거리
				</th>
				<td colspan="3">
					<pre><textarea style="width: 95%" cols="50" rows="10" name="content">${vo.content }</textarea></pre>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="4">
					<input type="button" value="초기화" onclick="re()" class="table_btn">
					<input type="button" value="전송" onclick="send()" class="table_btn">	
					<input type="button" value="취소" onclick="javascript:history.back()" class="table_btn">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>