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
					<input type="text" value="${title1 }" name="title1" size="40">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" value="${title2 }" name="title2" size="40">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" value="${title3 }" name="title3" size="40">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" value="${title4 }" name="title4" size="40">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" value="${title5 }" name="title5" size="40">
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