<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Movie Detail</title>
   <link rel="stylesheet" type="text/css" href="movie/movie_style.css">
   <script type="text/javascript">
		//댓글 내용 입력할 때 로그인 했는지 체크 
		function loginCheck(){
			if(${mvo==null}){
				$.jQueryLogin();
				return;
			}
		}	
		
		 /* 별점 체크 했는지 확인 */
	    function replycheck(){
	    	/* 로그인 먼저 체크 */
			if(${mvo==null}){
				$.jQueryLogin();
				return;
			}else{
				/*평점체크*/    	
		    	var f=document.frm;
		    	if($(':input[name=star_input]:radio:checked').val()==null){
		    		$.jQueryAlert('평점을 체크해 주세요.');
		    		return;
		    	}
		    	if(f.content.value==""){
		    		$.jQueryAlert('내용을 입력해 주세요.');
		    		return;
		    	}else{
		    		if(window.event.keyCode == 13){
						return;
					}
		    	}
		    	
		    	$.ajax({
					type: "POST",
					url: "replyCheck.do",
					data: $('#frm').serialize(),
					success:function(data){
						$('#reply').html(data);
					},
					error:function(data){
						$.jQueryAlert("실패");
					}
				});
			}			
	    }
		 
	    /* 댓글 삭제 */ 
	    function replydelete(reNo){
	       	$.ajax({
				type: "POST",
				url: "replyCheck.do",
				data: {
					no : "${vo.mNo }",
					reNo : reNo
				},
				success:function(data){
					$('#reply').html(data);
				},
				error:function(data){
					$.jQueryAlert("실패");
				}
			});
	    }
	    
	    /* 댓글 페이지 이동 */ 
	    function replyPage(no, page){
	       	$.ajax({
				type: "POST",
				url: "replyCheck.do",
				data: {
					no : no,
					page : page
				},
				success:function(data){
					$('#reply').html(data);
				},
				error:function(data){
					$.jQueryAlert("실패");
				}
			});
	    }	

		//엔터 로그인
		function enter(){
			if(window.event.keyCode == 13){
				login();
			}										  
		}
		
		//엔터 댓글 입력
		function replySubmit(){
			if(window.event.keyCode == 13){
				replycheck();
			}	
		}
	</script>
</head>
<body>
	<!-- 영화 상세 정보 불러오기 -->	
   <div class="detail">
   <!-- 관리자로 로그인했을 시 영화 정보 수정하기 버튼 띄우기 -->
	<c:if test="${mvo.admin eq '1' }">
		<a href="Amodifymovielist.do?no=${no }">
			<span class="modify">영화 수정 </span>
		</a>
	</c:if>
      <div class="detail2">
         <div id="poster_div">
            <img align="left" src="${vo.poster}" width="200" height="270" id="poster"><br>
            <a href="reserve.do?title=${vo.title }&poster=${vo.poster }">
               <c:if test="${type eq '1'}">
	               <button class="reserve_btn">
	                  <span class="list">예매하기</span>
	               </button>
               </c:if>
            </a>
         </div>
         <div id="title">
            <div align="left">
               <h3 class="title_2">${vo.title }</h3>
            </div>
            <div id="content">
               <table width="650">
                  <tr>
                     <td width="30%">
                        <strong>예매율 : </strong><span>${vo.rank } %</span>
                     </td>
                     <td width="36%">
                        <strong>관람 평점 : </strong><span>${vo.movieLike }</span>
                     </td >
                     <td width="33%">
                        <strong>등급 : </strong><span>${vo.grade }세이상 관람가능</span>
                     </td>
                  <tr>
                     <td>
                        <strong>개봉일 : </strong><fmt:formatDate value="${vo.opendate }" pattern="yyyy-MM-dd"/>
                     </td>
                     <td>
                        <strong>장르 : </strong><span>${vo.genre }</span>
                     </td>
                     <td>
                        <strong>상영시간 : </strong><span>${vo.runtime }</span>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3">
                        <strong>감독 : </strong><span>${vo.director }</span>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3">
                        <strong>출연 : </strong><span>${vo.cast }</span>
                     </td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
      <table id="cont" width="1000">
         <tr>
            <td colspan="2" width="867">
               <span id="movieContent">줄거리</span><pre>${vo.content }</pre><br><br>
            </td>
         </tr>
      </table>
      <div id="cast_div">
         <table width="1000">
            <tr>
               <td><span class="cast" >출연진</span></td>
               <td colspan="10" align="right">
               		<c:if test="${mvo.admin eq '1' }">
						<a href="AcharUpdate.do?no=${no }&type=${type }">
							<span class="castmodify">배우 수정</span>
						</a>
					</c:if>
               </td>
            </tr>
            <tr>
               <c:forEach items="${list }" var="cvo">
               <td style="font-size: 14px" align="center">
                  <img src="${cvo.img }" style="border-radius: 84px"><br>
                  ${cvo.cname }
               </td>
               </c:forEach>
            </tr>
         </table>
      </div>
      <iframe marginheight="0" style="display:inline-block;"  width="900" height="400" src="http://www.youtube.com/embed/${url }" frameborder="0" allowfullscreen>
	           해당 브라우저는 iframe을 지원하지 않습니다. IE9 이상, 크롬, 파이어폭스를 이용해주세요.
	  </iframe>	  
      <!-- 댓글 페이지 --> 
      <div align="center" class="replydiv">
         <jsp:include page="movie_Reply.jsp"></jsp:include>
      </div>
   </div>
</body>
</html>
