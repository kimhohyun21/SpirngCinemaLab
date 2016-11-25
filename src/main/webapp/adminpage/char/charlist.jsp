<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="adminpage/astyle.css">
</head>
<body>
	<center>
		<table width="699" class="reg_btn">
			<tr>
				<td>
					<a href="ACharInsert.do">
						<button class="menu_insert">배우등록</button>						
					</a>
				</td>
			</tr>
		</table>
		<table width="700" class="type01">
		<thead>
			<tr>
				<th align="center">
					이름
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="vo" begin="${start }" end="${end }">
				<tr>
					<td align="left">
						<a href="ACContent.do?cno=${vo.cno }">
							${vo.cname }
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
			<tr class="nhover">
				<td colspan="5" align="right">
					<c:if test="${page>block }">
						<a href="ACList.do?page=1">
							처음
						</a>&nbsp;
						<a href="ACList.do?page=${fromPage-1 }" style="color: red">
							이전
						</a>&nbsp;
					</c:if>
					
					<c:if test="${page<=block }">
						<a href="ACList.do?page=1">
							처음
						</a>&nbsp;
						<a href="ACList.do?page=${page>1?page-1:page }" style="color: red">
							이전
						</a>&nbsp;
					</c:if>
					
					<c:forEach var="i" begin="${fromPage }" end="${toPage }">
						[
						<c:if test="${page==i }">
							<span style="color:red">${i }</span>
						</c:if>
						<c:if test="${page!=i }">
							<a href="ACList.do?page=${i }">${i }</a>
						</c:if>
						]&nbsp;
					</c:forEach>
					
					<c:if test="${toPage<totalPage }">
						<a href="ACList.do?page=${toPage+1 }" style="color: blue">
							다음
						</a>&nbsp;
						<a href="ACList.do?page=${totalPage }">
							마지막
						</a>
					</c:if>
					
					<c:if test="${toPage>=totalPage }">
						<a href="ACList.do?page=${page<totalPage?page+1:page }" style="color: blue">
							다음
						</a>&nbsp;
						<a href="ACList.do?page=${totalPage }">
							마지막
						</a>
					</c:if>										
					&nbsp;&nbsp;
					${page }page / ${totalPage }pages
				</td>
			</tr>
		</table>
	</center>
</body>
</html>