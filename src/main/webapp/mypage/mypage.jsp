<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="login/style3.css">
<style type="text/css">
	tr,td{
		padding: 10px;
	}
	#menubar{
    margin-bottom: 50px;
    border-color: black;
    border-width: 2px;    
	border-collapse:collapse;  
	}
	#menubar tr,td{
		padding:0px;
	}
	#menubar tr :HOVER {
		background-color: windowframe;
	}
</style>
</head>
<body>
	<div class="bg">
		<input type="hidden" value="${mvo.birth }" name="birth">
		<div align="center">
					<br>
			<table id="menubar" border="1" width="900" height="100">
				<tr>
					<td align="center">
						<a href="reserveList.do?no=${mvo.no }">
							예매내역
						</a>
					</td>			
					<td align="center">
						<a href="memberModify.do?strno=${mvo.no }">
							회원정보 수정
						</a>
					</td>			
					<td align="center">
						<a href="memberChangepwd.do">
							비밀번호 수정
						</a>
					</td>			
					<td align="center">
						<a href="memberDelete.do?no=${mvo.no }">
							회원탈퇴
						</a>
					</td>
					<c:if test="${mvo.admin == 1 }">
						<td align="center">
							<a href="Amovielist.do">
								<b style="color: olive;">비밀의 방</b>
							</a>	
						</td>
					</c:if>
				</tr>
			</table>		
			<div align="center">
				<jsp:include page="${jsp2 }"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>