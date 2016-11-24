<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="adminpage/astyle.css">
<script type="text/javascript">
	function send(){
		var f=document.frm;
		
		f.submit();
}
</script>
</head>
<body>
	<div align="center">
	<form action="ACharInsert_ok.do" name="frm" method="post">
		<table width="700" height="280" class="type02">
			<thead>
				<tr>
					<td align="center" colspan="2">
						배우등록
					</td>
				</tr>
			</thead>
			<tr>
				<th align="right">
					이름
				</th>
				<td align="left">
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th align="right">
					이미지URL
				</th>
				<td align="left">
					<input type="text" name="img">
				</td>
			</tr>			
			<tr>
				<td align="center" colspan="4">
					<input type="button" value="전송" onclick="send()" class="table_btn">	
					<input type="button" value="취소" onclick="javascript:history.back()" class="table_btn">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>