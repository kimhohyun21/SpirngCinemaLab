<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Q&A List</title>
	<link rel="stylesheet" type="text/css" href="customer/customer_style.css">
	<script type="text/javascript">
		function qnainsert(){
			if(${mvo==null}){
				$.jQueryLogin();
				return;
			}
			location.href='insert.do';
		}		
		
		//엔터 로그인
		function enter(){
			if(window.event.keyCode == 13){
				login();
			}
		}
		
		//로그인 창 값 입력 체크
		function login(){
			var f=document.loginfrm;	
			if(f.id.value==""){
				$.jQueryAlert("아이디를 입력하세요");
				f.id.focus();
				return;
			}
			if(f.pwd.value==""){
				$.jQueryAlert("비밀번호를 입력하세요");
				fs.pwd.focus();
				return;
			}
			
			$.ajax({
				type: "POST",
				url: "login_ok.do",
				data:$('form').serialize(),
				dataType: "json",
				success:function(data){
					if(data.check=="ok"){
						window.location.reload(true);
					}else if(data.check=="pwdnot"){
						$.jQueryAlert("패스워드가 잘못 되었습니다.");
					}else if(data.check=="idnot"){
						$.jQueryAlert("아이디가 잘못 되었습니다.");
					}
				},
				error:function(data){
					$.jQueryAlert("실패");
				}
			});
		}	
	</script>
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
		<table border="0" width="800">
			<tr align="left">
				<td>
					<button type="button" class="insert" onclick="qnainsert()">글쓰기</button>
				</td>
			</tr>
		</table>
		<table class="list" width="800">
			<tr>
				<th width="10%" align="center">번호</th>
				<th width="45%" align="center">제목</th>
				<th width="15%" align="center">이름</th>
				<th width="20%" align="center">작성일</th>
				<th width="10%" align="center">조회수</th>
			</tr>
			<c:forEach var="vo" items="${list}">
			<tr class="list_tr">
				<td width="10%" align="center">${vo.qno}</td>
				<td width="45%" align="left" class="subject">
					<fmt:formatDate var="qday" value="${vo.qregdate}" pattern="yyyy-MM-dd"/>
					<c:if test="${vo.group_tab!=0}">
						<c:forEach var="i" begin="1" end="${vo.group_tab}">
							&nbsp;&nbsp;							
						</c:forEach>
						<img alt="reply" src="image/icon_reply.gif">
					</c:if>
					<a href="content.do?no=${vo.qno}&page=${page }">${vo.qsubject}</a>					
					<c:if test="${qday==today}">
						<sup><img alt="new" src="image/icon_new (2).gif"></sup>
					</c:if>
				</td>
				<td width="15%" align="center">${vo.name}</td>
				<td width="20%" align="center">
					${qday }
				</td>
				<td width="10%" align="center">${vo.qhit}</td>
			</tr>
			</c:forEach>
		</table>
		<table width="800">
			<tr>
				<td align="right">
					<a href="customer.do?page=${page>1?page-1:page}" style="color: red">이전</a>
					&nbsp;
					<a href="customer.do?page=${page<totalpage?page+1:page}" style="color: blue">다음</a>
					&nbsp;&nbsp;
					${page} page / ${totalpage} pages
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
