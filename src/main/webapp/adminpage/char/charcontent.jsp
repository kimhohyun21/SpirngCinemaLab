<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="adminpage/test.css">
<script type="text/javascript">
	function send(){
		var f=document.frm;
		
		f.submit();
}
	function re(){
		top.document.location.reload();
	}
</script>
</head>
<body>
	<div align="center">
	<form action="ACUpdate.do?cno=${vo.cno }" name="frm" method="post">
		<table width="550" height="280" class="type02">
			<tr>
				<th align="right">
					이름
				</th>
				<td align="left">
					<input type="text" value="${vo.cname }" name="name" size="40">
				</td>
			</tr>
			<tr>
				<th align="right">
					이미지URL
				</th>
				<td align="left">
					<input type="text" value="${vo.img }" name="img" size="40">
				</td>
			</tr>
			<tr>
				<th align="right" rowspan="5" valign="baseline">
					출연영화
				</th>
				<td>
					<select name="mno1">
						<option value="0">영화선택</option>						
						<c:forEach var="mList" items="${mList }">
							<c:if test="${mList.mNo == vo.mno1 }">
								<option selected="selected" value="${mList.mNo }">${mList.title }</option>
							</c:if>
							<c:if test="${mList.mNo != vo.mno1 }">
								<option value="${mList.mNo }">${mList.title }</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<select name="mno2">
						<option value="0">영화선택</option>
						<c:forEach var="mList" items="${mList }">
							<c:if test="${mList.mNo == vo.mno2 }">
								<option selected="selected" value="${mList.mNo }">${mList.title }</option>
							</c:if>
							<c:if test="${mList.mNo != vo.mno2 }">
								<option value="${mList.mNo }">${mList.title }</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<select name="mno3">
						<option value="0">영화선택</option>
						<c:forEach var="mList" items="${mList }">
							<c:if test="${mList.mNo == vo.mno3 }">
								<option selected="selected" value="${mList.mNo }">${mList.title }</option>
							</c:if>
							<c:if test="${mList.mNo != vo.mno3 }">
								<option value="${mList.mNo }">${mList.title }</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<select name="mno4">
						<option value="0">영화선택</option>
						<c:forEach var="mList" items="${mList }">
							<c:if test="${mList.mNo == vo.mno4 }">
								<option selected="selected" value="${mList.mNo }">${mList.title }</option>
							</c:if>
							<c:if test="${mList.mNo != vo.mno4 }">
								<option value="${mList.mNo }">${mList.title }</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<select name="mno5">
						<option value="0">영화선택</option>
						<c:forEach var="mList" items="${mList }">
							<c:if test="${mList.mNo == vo.mno5 }">
								<option selected="selected" value="${mList.mNo }">${mList.title }</option>
							</c:if>
							<c:if test="${mList.mNo != vo.mno5 }">
								<option value="${mList.mNo }">${mList.title }</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="초기화" onclick="re()" class="table_btn">
					<input type="button" value="전송" onclick="send()" class="table_btn">	
					<input type="button" value="취소" onclick="javascript:history.back()" class="table_btn">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>