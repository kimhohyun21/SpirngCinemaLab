<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Movie List</title>
	<link rel="stylesheet" type="text/css" href="movie/movie_style.css">
	<script type="text/javascript">
		$(document).ready(function(){
			$('#btn${type }').attr("class", "selectedBtn");
		});
		
		function clickCheck(num){
			//ajax로 리스트 내용 갱신
			$.ajax({
				type: "POST",
				url: "movieList.do",
				data: {	type : num },
				success:function(data){
					$('#list_content').html(data);
				},
				error:function(data){
					$.jQueryAlert("실패");
				}
			});
			
			//메뉴 버튼 선택 토글 효과
			$('.selectedBtn').attr("class","list_btn");
			$('#btn'+num).attr("class", "selectedBtn");
		}		
	</script>
</head>
<body>	
	<div class="movielist">   
		<table class="btnArea">
			<tr>
				<td class="movieBtn">
	            	<button class="list_btn" id="btn0" onclick="clickCheck(0)">
						<span class="list">상영 종료 영화</span>
					</button>
					<button class="list_btn" id="btn1" onclick="clickCheck(1)">
						<span class="list">현재 상영 영화</span>
					</button>
					<button class="list_btn" id="btn2" onclick="clickCheck(2)">
						<span class="list">상영 예정 영화</span>
					</button>
			   </td>
			</tr>
		</table>   
		<div id="list_content">
			<jsp:include page="movie_List_Content.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>