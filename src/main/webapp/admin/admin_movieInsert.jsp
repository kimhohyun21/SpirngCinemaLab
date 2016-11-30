<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Admin Movie Insert</title>
	<link rel="stylesheet" type="text/css" href="adminpage/admin_style.css">
	<script type="text/javascript">
		//엔터키 입력
		function enter(){
			if(window.event.keyCode == 13){
				send();
			}
		}
		function num(){
			if( (event.keyCode<48)||(event.keyCode>57) ){
				event.returnValue=false;
			}
		}
		function send(){
			var f=document.frm;
			if(f.title.value==""){
				$.jQueryAlert("제목을 입력 해 주세요");
				return;
			}
			if(f.grade.value==4){
				$.jQueryAlert("시청연령을 골라주세요");
				return;
			}
			if(f.poster.value==""){
				$.jQueryAlert("포스터URL을 입력 해 주세요");
				return;
			}
			if(f.year.value=="" || f.month.value=="" || f.day.value==""){
				$.jQueryAlert("상영일을 입력 해 주세요");
				return;
			}
			if(f.type.value==4){
				$.jQueryAlert("상영타입을 골라주세요");
				return;
			}
			if(f.director.value==""){
				$.jQueryAlert("감독님을 써주세요");
				return;
			}
			if(f.runtime.value==""){
				$.jQueryAlert("상영시간을 써주세요");
				return;
			}
			if(f.genre.value==""){
				$.jQueryAlert("장르를 써주세요");
				return;
			}		
			if(f.trailer.value==""){
				$.jQueryAlert("예고편URL을 써주세요");
				return;
			}
			if(f.cast.value==""){
				$.jQueryAlert("출연인물을 써주세요");
				return;
			}
			if(f.content.value==""){
				$.jQueryAlert("줄거리를 써주세요");
				return;
			}
			
			f.submit();
		}		
	</script>
</head>
<body>
	<div align="center">
	<form action="aMovieInsert_ok.do" name="frm" method="post">
		<table width="700" height="300" class="type02">
			<thead>
				<tr>
					<td align="center" colspan="4">
						영화등록
					</td>
				</tr>
			</thead>
			<tr>
				<th>
					<input type="hidden" name="no">
					제목
				</th>
				<td align="left">
					<input type="text" name="title" size="30" onkeydown="enter()">					
				</td>
				<th>시청연령</th>
				<td align="left">
					<select name="grade">
						<option value="4">선택</option>	
							<option value="12">12</option>
							<option value="15">15</option>
							<option value="18">18</option>						
					</select>
					세
				</td>
			</tr>
			
			<tr>
				<th>포스터 URL</th>
				<td align="left" colspan="3">
					<input type="text" name="poster" style="width:95%" onkeydown="enter()"
					placeholder="ex)http://movie.phinf.naver.net/20111223_44/1324635585945KDOJ5_JPEG/movie_image.jpg">
				</td>
			</tr>
			
			<tr>
				<th>
					상영일
				</th>
				<td align="left">					
					<input type=text name="year" size="1" placeholder="년도" onkeypress="num()" onkeydown="enter()"><b>- </b>
					<input type="text" name="month" size="1" placeholder="월" onkeypress="num()" onkeydown="enter()"><b>- </b>
					<input type="text" name="day" width="10"  size="1" placeholder="일" onkeypress="num()" onkeydown="enter()">
				</td>
				<th>상영종류</th>
				<td align="left">
					<select name="type">
						<option value="4">선택</option>
						<option value="0">상영종료</option>
						<option value="1">상영중</option>
						<option value="2">상영예정</option>						
					</select>					
				</td>
			</tr>
			
			<tr>
				<th>감독</th>
				<td align="left">
					<input type="text" name="director" onkeydown="enter()">
				</td>
				<th>상영시간</th>
				<td align="left">
					<input type="text" size="1" name="runtime" onkeypress="num()" onkeydown="enter()">분
				</td>
			</tr>
			<tr>
				<th>장르</th>
				<td colspan="3">
					<input type="text" name="genre" style="width: 90%" placeholder="ex)액션,판타지,SF,모험" onkeydown="enter()">
				</td>
			</tr>
			<tr>
				<th>예고편</th>
				<td align="left" colspan="3">
					<input type="text" name="trailer" style="width:90%" placeholder="ex)https://youtu.be/awyG1-xvqFY" onkeydown="enter()">
				</td>
			</tr>
			<tr>
				<th>출연인물</th>
				<td align="left" colspan="3">
					<input type="text" name="cast" style="width:90%" onkeydown="enter()"
					placeholder="ex)크리스 헴스워스(토르), 나탈리 포트만(제인 포스터), 톰 히들스턴(로키) 등">
				</td>
			</tr>
			<tr>
				<th>줄거리</th>
				<td colspan="3">
					<pre><textarea style="width: 95%" cols="50" rows="10" name="content"></textarea></pre>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="4">
					<input type="button" value="전송" onclick="send()" class="table_btn">
					<input type="button" value="뒤로" onclick="javascript:history.back()" class="table_btn">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>