<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="adminpage/test.css">
<script type="text/javascript">
	function re(){
		top.document.location.reload();
	}
</script>
</head>
<body>
	<input type="hidden" value="${no }">
	<div align="center">
		<form method="post" action="AcharUpdate_ok.do?sno=${no }">
			<table width="700" class="type02">
				<c:forEach var="actor" items="${actor }">
					<tr>
						<th align="center" colspan="2">배우${i=i+1 }
							<select name="actor">
								<c:forEach var="vo" items="${list }">
									<c:if test="${actor.cname==vo.cname }">
										<option selected="selected" value="${vo.cno }">${vo.cname }</option>
									</c:if>
									<c:if test="${actor.cname!=vo.cname }">
										<option value="${vo.cno }">${vo.cname }</option>
									</c:if>
								</c:forEach>
							</select>
						</th>
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