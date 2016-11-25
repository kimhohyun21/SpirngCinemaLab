<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="adminpage/astyle.css">
<script type="text/javascript">
	function re(){
		top.document.location.reload();
	}
</script>
</head>
<body>
	<input type="hidden" value="${no }">
	<input type="hidden" value="${type }">
	<div>
		<form method="post" action="AcharUpdate_ok.do?sno=${no }&type=${type }">		
			<table width="700" class="type03">
				<tr>
					<th colspan="2" class="char_title">배우 수정</th>
				</tr>
				<c:forEach var="actor" items="${actor }">
					<tr height="35">
						<th align="center">배우${i=i+1 }</th>
						<td>
							<select name="actor" class="char_select">
							<c:forEach var="vo" items="${list }">
								<c:if test="${actor.cname==vo.cname }">
									<option selected="selected" value="${vo.cno }">${vo.cname }</option>
								</c:if>
								<c:if test="${actor.cname!=vo.cname }">
									<option value="${vo.cno }">${vo.cname }</option>
								</c:if>
							</c:forEach>
						</select>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td align="center" colspan="2">
						<input type="button" value="초기화" onclick="re()" class="table_btn">
						<input type="submit" value="수정" class="table_btn">
						<input type="button" value="취소" onclick="javascript:history.back()" class="table_btn">
					</td>
				</tr>
			</table>			
		</form>
	</div>
</body>
</html>