<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="adminpage/astyle.css">
<title>Insert title here</title>
</head>
<body>
	<div align="center" class="bg">
		<table id="table_content" width="501" class="tb">
			<tr>
				<th width="20%" align="center">예약일</th>
				<td width="80%" align="center" colspan="3">
					<fmt:formatDate value="${vo.rdate}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<th width="20%" align="center">번호</th>
				<td width="30%" align="center">${vo.rno}</td>
				<th width="20%" align="center">이름</th>
				<td width="30%" align="center">${vo.name}</td>
			</tr>
			<tr>
				<th width="20%" align="center">영화이름</th>
				<td width="30%" align="center">${vo.title}</td>
				<th width="20%" align="center">결제번호</th>
				<td width="30%" align="center">${vo.payment_id}</td>
			</tr>
			<tr>
				<th width="20%" align="center">좌석</th>
				<td width="30%" align="center">${vo.seat}</td>
				<th width="20%" align="center">티켓수</th>
				<td width="30%" align="center">${vo.ticket}</td>
			</tr>
			<tr>
				<th width="20%" align="center">예매금액</th>
				<td width="30%" align="center">${vo.payment}</td>
				<th width="20%" align="center">지불방법</th>
				<td width="30%" align="center">${vo.paytype}</td>
			</tr>	
			<tr>
				<th width="20%" align="center">결제금액</th>
				<td width="30%" align="center">${vo.serverpay}</td>
				<th width="20%" align="center">shop_id</th>
				<td width="30%" align="center">${vo.shop_id}</td>
			</tr>	
			<tr>
				<th width="20%" align="center">승인번호</th>
				<td width="30%" align="center">${vo.cardoknum}</td>
				<th width="20%" align="center">극장</th>
				<td width="30%" align="center">${vo.theater}</td>
			</tr>
			<tr>
				<th width="20%" align="center">상영관</th>
				<td width="30%" align="center">${vo.theaterno}</td>
				<th width="20%" align="center">상영시간</th>
				<td width="30%" align="center">${vo.movietime}</td>
			</tr>
			<tr>
				<th width="20%" align="center">취소</th>
				<td width="30%" align="center">${vo.cancel}</td>
				<th width="20%" align="center">환불</th>
				<td width="30%" align="center">${vo.refund}</td>
			</tr>
		</table>
		<table>
			<tr align="right">
				<td>
					<a href="reservelist.do">돌아가기</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
