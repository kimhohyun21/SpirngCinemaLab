	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Theater</title>
	<link rel="stylesheet" type="text/css" href="theater/theater_style.css">
	<script type="text/javascript">
		function daySelect(no){			
			$.ajax({
				type: "POST",
				url: "theater.do",
				data: $('#frm'+no).serialize(),
				success:function(data){
					$('#theater_List').html(data);
					$('.daySelected').attr("class", "day");
					$('#day'+no).attr("class", "daySelected");
				},
				error:function(data){
					$.jQueryAlert("실패");
				}
			});
		};		
	</script>
</head>
<body>
	<div align="center">
		<div id="local">
			<ul>
				<c:forEach var="vo" items="${localList }">
					<li onclick="location.href='theater.do?local=${vo.local }'">
						<span>${vo.local }</span>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div id="theater_List">
			<jsp:include page="theater_List.jsp"></jsp:include>
		</div>		
	</div>
</body>
</html>





























