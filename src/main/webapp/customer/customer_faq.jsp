<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="customer/customer_style.css">
	<title>FAQ</title>
</head>
<body>
	<div align="center" class="bg">
	<!-- fno순차별로 question과 answer 한 번 씩 출력    -->
		<table>
			<tr id="sub">
				<td>
					<a href="customer.do">
						<button class="list_btn">QnA</button>
					</a>
				</td>
				<td>
					<a href="faq.do">
						<button class="list_btn">FAQ</button>
					</a>
				</td>
			</tr>
		</table>
		<div id="faq_title">FAQ</div>
		<hr>
		<table width="800" align="center" class="faq" style="table-layout: fixed">
			<c:forEach var="vo" items="${list}">
				<tr class="question">
					<td>
						<a href="javascript:void(0);">
							<span class="q">Q.</span>
							<span class="qu">${vo.question}</span>
						</a>
					</td>
				</tr>
				<tr class="answer" style="display: none;">
					<td style="word-break:break-all;">
						<div class="answer_box">
							<span class="a">A.</span>
							<span class="an">${vo.answer}</span>
						</div>
					</td>
				</tr>			
			</c:forEach>
		</table>
	</div>
</body>
<script type="text/javascript">
	$('.faq .question').off().on('click',function(){
		if(!$(this).hasClass('on')){
			$('.faq .question').removeClass('on');
			$('.faq .question').next('.answer').hide();
			$(this).addClass('on');
			$(this).next('.answer').show();
		}else{
			$(this).removeClass('on');
			$(this).next('.answer').hide();
		}
	});
</script>
</html>


















