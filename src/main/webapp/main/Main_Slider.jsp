<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Main Slider</title>
	 <!-- Insert to your webpage before the </head> -->
    <script src="carouselengine/amazingcarousel.js"></script>
    <link rel="stylesheet" type="text/css" href="carouselengine/initcarousel-1.css">
    <script src="carouselengine/initcarousel-1.js"></script>
    <!-- End of head section HTML codes -->
</head>
<body>
	<div align="center">
	    <!-- Insert to your webpage where you want to display the carousel -->
		<div id="amazingcarousel-container-1">
			<div class="posttitle">현재 상영작</div>
		    <div id="amazingcarousel-1" style="display:none;position:relative;width:100%;max-width:1200px;margin:0px auto 0px;">
		        <div class="amazingcarousel-list-container">
					<ul class="amazingcarousel-list">
					<c:forEach var="vo" items="${plist2 }">
						<li class="amazingcarousel-item">
							<div class="amazingcarousel-item-container">
							<script>
								console.log('${vo.mNo}');
							</script>
								<div class="amazingcarousel-image" id="${vo.mNo}">
									<a href="#" class="html5lightbox"> 
										<img src="${vo.poster }"/>
										<script type="text/javascript">
											$(function(){
												$('div#${vo.mNo} div.amazingcarousel-hover-effect').click(function(){													
													location.href="reserve.do?title=${vo.title}&poster=${vo.poster }";
												});
											});
										</script>
									</a>	
								</div>
							</div>
						</li>
					</c:forEach>		
					</ul>
					<div class="amazingcarousel-prev"></div>
		            <div class="amazingcarousel-next"></div>
		        </div>
		        <div class="amazingcarousel-nav"></div>
		        <div class="amazingcarousel-engine"><a href="http://amazingcarousel.com">jQuery Scroller</a></div>
		    </div>
		</div>
		<!-- End of body section HTML codes -->
	</div>
</body>
</html>