<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Movie List Content</title>
</head>
<body>	
	<!-- 영화 리스트 4개씩 정렬 -->
	<c:set var="i" value="1"/>
	<c:set var="j" value="4" />
	<c:if test="${list!=null }">   
	  <table class="tb">
	  <c:forEach var="vo" items="${list }">
	  <c:if test="${i==1}">
	     <tr>
	  </c:if>
	        <td>
	           <table border="0" id="movie">
	              <tr>
	                 <td colspan="2">
	                    <a href="movieDetail.do?no=${vo.mNo }&type=${vo.type}">
	                       <img src="${vo.poster}" width="200" height="270">
	                    </a>
	                 </td>
	              </tr>
	              <tr>   
	                 <td align="center" colspan="2" class="title" height="42">
	                 <c:if test="${vo.grade=='0'}">
	                 <img src="image/bg_grade_all.png" width="18px" class="grade_image">
	                 </c:if>
	                 <c:if test="${vo.grade=='12'}">
	                 <img src="image/bg_grade_12.png" width="18px" class="grade_image">
	                 </c:if>
	                 <c:if test="${vo.grade=='15'}">
	                 <img src="image/bg_grade_15.png" width="18px" class="grade_image">
	                 </c:if>
	                 <c:if test="${vo.grade=='18'}">
	                 <img src="image/bg_grade_18.png" width="18px" class="grade_image">
	                 </c:if>
	                 ${vo.title }
	                 </td>
	              </tr>
	              <tr>
	                 <td align="center" class="td" height="42">
	                    예매율<br>${vo.rank }%
	                 </td>
	                 <td align="center">
	                    관람 평점<br>${vo.movieLike }
	                 </td>
	              </tr>
	           </table>
	        </td>
	     <c:set var="i" value="${i+1}" />
	     <c:if test="${i==j+1}">
	     </tr>
	     <c:set var="i" value="1" />
	     </c:if>
	     </c:forEach>
	   </table>
	</c:if>
</body>
</html>