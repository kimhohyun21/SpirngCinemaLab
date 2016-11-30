<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="customer/customer_style.css">
	<title>Customer Content</title>
</head>
<body>
	<div align="center" class="bg">
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
		<div id="qna_title">QnA</div>
		<hr>
		<table id="content_table" width="800px">
			<tr>
				<th width="20%">번호</th>
				<td width="30%">${vo.qno }</td>
				
				<th width="20%">작성일</th>
				<td width="30%">
					<fmt:formatDate value="${vo.qregdate}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<th width="20%">이름</th>
				<td width="30%">${vo.name }</td>
				
				<th width="20%">조회수</th>
				<td width="30%">${vo.qhit}</td>
			</tr>
			<tr>
				<th width="20%">제목</th>
				<td class="left_td" colspan="3">${vo.qsubject}</td>
			</tr>
			<tr>
				<td colspan="4" id="cont">
					<pre>${vo.qcontent}</pre>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="right_td">
					<c:if test="${mvo.name != null}">
					<a href="reply.do?no=${vo.qno }&page=${page }">
						<img src="image/btn_reply.png" title="리플" class="btn_icon">
						<span class="text_block valign">리플</span>
					</a>
					&nbsp;&nbsp;
					</c:if>
					<c:if test="${mvo.name == vo.name}">
					<a href="update.do?no=${vo.qno }&page=${page }">
						<img src="image/btn_modify.png" title="수정" class="btn_icon">
						<span class="text_block valign">수정</span>
					</a>						
					&nbsp;&nbsp;
					<a href="delete.do?no=${vo.qno }&page=${page }">
						<img src="image/btn_delete.png" title="삭제" class="btn_icon">
						<span class="text_block valign">삭제</span>
					</a>
					&nbsp;&nbsp;
					</c:if>
					<a href="customer.do">						
						<img src="image/btn_list.png" title="리스트" class="btn_icon">
						<span class="text_block valign">리스트</span>
					</a>
				</td>
			</tr>				
		</table>			
	</div>
</body>
</html>
