<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check=='ok' && loginType==null}">
	<c:redirect url="main.do"/>
</c:if>
<c:if test="${check=='ok' && loginType=='reserve'}">
	<c:redirect url="${url }"/>
</c:if>
<c:if test="${check=='pwdnot' }">
	<script type="text/javascript">
		alert('패스워드가 잘못 되었습니다.');
		history.back();
	</script>
</c:if>
<c:if test="${check=='idnot' }">
	<script type="text/javascript">
		alert('아이디가 잘못 되었습니다.');
		history.back();
	</script>
</c:if>
<<c:if test="${logout eq 'out'}">
	<c:redirect url="main.do"/>
</c:if>
