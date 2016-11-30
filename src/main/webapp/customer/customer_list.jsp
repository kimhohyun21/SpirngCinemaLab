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
		<table id="list_table" width="800px">
			<tr>
				<th width="10%">번호</th>
				<th width="45%">제목</th>
				<th width="15%">이름</th>
				<th width="20%">작성일</th>
				<th width="10%">조회수</th>				
			</tr>
		<c:forEach var="vo" items="${list }">
			<tr id="normal">
				<td width="5%">${vo.qno }</td>
				<td width="45%" id="left_td">
				<c:if test="${vo.group_tab!=0 }">
					<c:forEach var="blank" begin="1" end="${vo.group_tab }">
						&nbsp;
					</c:forEach>
					<img src="image/icon_reply.gif">
				</c:if>
				<a href="content.do?no=${vo.qno }&page=${curPage}">
					${vo.subject }
				</a>
				<fmt:formatDate var="qday" value="${vo.qregdate}" pattern="yyyy-MM-dd"/>
				<c:if test="${qday==today }">
					<sup><img src="image/icon_new (2).gif"></sup>
				</c:if>					
				</td>
				<td width="10%">${vo.name }</td>
				<td width="20%">${qday }</td>
				<td width="5%">${vo.qhit }</td>		
			</tr>
		</c:forEach>
		</table>
		<table class="button_table" width="800px">
			<tr>
				<td width="90%" align="center">
				      <!-- 
				  [1][2][3][4][5][6]
				  fp         tp   
				-->
				<a href="list.do?page=1">
				   <button class="btn_normal2">&lt;&lt; first</button>  
				</a>
				<!-- 기본적으로는 5페이지 단위로 페이지 이동, 처음 블록과 마지막 블록에서만 1페이지씩 이동 -->
				<c:if test="${curPage>block }">
				<a href="list.do?page=${fromPage-1}">
				  	 <button class="btn_normal2">&lt; prev</button>                    
				  </a>
				</c:if>   
				<c:if test="${curPage<=block }">
				  <a href="list.do?page=${curPage>1 ? curPage-1 : 1 }">
				     <button class="btn_normal2">&lt; prev</button>                   
				  </a>
				</c:if>
				<c:forEach var="i" begin="${fromPage }" end="${toPage }">
				  <c:if test="${curPage==i }">
				     <button class="btn_select">${i }</button>               
				  </c:if>
				  <c:if test="${curPage!=i }">
				     	<a href="list.do?page=${i }">
				     		<button class="btn_normal">${i }</button>
				     	</a>
				  </c:if>   
				</c:forEach>
				<c:if test="${toPage<totalPage }">
				  <a href="list.do?page=${toPage+1 }">
				  	<button class="btn_normal2">next &gt;</button>                    
				  </a>
				</c:if>
				<c:if test="${toPage>=totalPage }">
				  <a href="list.do?page=${curPage<totalPage ? curPage+1 : totalPage }">
				  	<button class="btn_normal2">next &gt;</button>                  
				  </a>
				</c:if>
				<a href="list.do?page=${totalPage }">
				  	<button class="btn_normal2">last &gt;&gt;</button>   
				</a>
				&nbsp;
				<span class="text_block">${curPage }page / ${totalPage }page</span>
				</td>
				<td class="right_td">
					<a href="javascript:qnainsert()">
						<img src="image/btn_write.png" title="글쓰기" class="btn_icon">
				        <span class="text_block valign">글쓰기</span>
					</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
