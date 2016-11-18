<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Reserve2 Ticket and Seat</title>
	<link rel="stylesheet" type="text/css" href="reserve/reserve_style.css">
	<link rel="stylesheet" type="text/css" href="jStyles/easydropdown.css">	
	<script type="text/javascript">
		function select(){			
			$.ajax({
				type: "POST",
				url: "reserve2.do",
				data:$('#frm').serialize(),
				success:function(data){
					$('#result').html(data);
				},
				error:function(data){
					alert("����");
				}
			});
		};	
	
		$('document').ready(function(){
			$('div.selectBox').click(function(){
				if(${mvo==null}){
					$.jQueryLogin();
					return;
				}
			});
		});				
				
		/*jQuery Login*/
		jQuery.jQueryLogin = function (){
			var $loginform = $.parseHTML('<div id="logindiv">'
											+'<form name="loginfrm" action="login_ok.do" method="post" "id="loginfrm">'
											+'<div class="input">'
											+'<label class="idlabel" for="id">ID</label>'
											+'<input type="text" placeholder="���̵� �Է��ϼ���." name="id" id="id" onkeydown="enter()">'
											+'</div>'+'<div class="input">'
											+'<label class="pwlabel" for="pwd">PW</label>'
											+'<input type="password" placeholder="�н����带 �Է��ϼ���." name="pwd" id="pwd" onkeydown="enter()">'
											+'</div><input type="hidden" name="loginType" value="reserve">'
											+'</form><div id="find">'
											+'<a href="searchId.do">���̵� ã��</a>&nbsp;|&nbsp;'
											+'<a href="searchPwd.do">��й�ȣ ã��</a></div>');
			$("body").append($loginform);
			
			$($loginform).dialog({
				 open: $($loginform),
			     autoOpen: true,
			     width: 400,
			     modal: true,
			     resizable:false, 
			     buttons: {	
			       LOGIN : function() {
				         login();
				   },		 
			       Cancel: function() {
			         $(this).dialog("close");
			       }
			    }
			});
		}
		
		//���� �α���
		function enter(){
			if(window.event.keyCode == 13){
				login();
			}
		}
		
		//�α��� â ���Է� üũ
		function login(){
			var f=document.loginfrm;	
			if(f.id.value==""){
				$.jQueryAlert("���̵� �Է��ϼ���");
				f.id.focus();
				return;
			}
			if(f.pwd.value==""){
				$.jQueryAlert("��й�ȣ�� �Է��ϼ���");
				f.pwd.focus();
				return;
			}
			f.submit();
		}
		
		/* jQuery Alert â */
		jQuery.jQueryAlert = function (msg) {
	        var $messageBox = $.parseHTML('<div id="alertBox"></div>');
	        $("body").append($messageBox);
	
	        $($messageBox).dialog({
	            open: $($messageBox).append(msg),
	            autoOpen: true,
	            modal: true,
	            resizable:false, 
				width: 400,
	            buttons: {
	                OK: function () {
	                    $(this).dialog("close");
	                }
	            }
	        });
	    };
	</script>
	<script src="jStyles/jquery.easydropdown.js"></script>
</head>
<body>
	<div align="center" class="reserve2">
		<!-- Ƽ�� �ż� ���� -->
		<div class="ticket">
			<div class="selectArea">
				<form id="frm">
					<input type="hidden" name="year" value="${year }">
					<input type="hidden" name="month" value="${month }">
					<input type="hidden" name="checkedDay" value="${checkedDay }">
					<input type="hidden" name="checkedDay2" value="${checkedDay2 }">
					<input type="hidden" name="local" value="${local }">
					<input type="hidden" name="tname" value="${tname }">
					<input type="hidden" name="grade" value="${grade }">
					<input type="hidden" name="title" value="${title }">
					<input type="hidden" name="poster" value="${poster }">				
					<input type="hidden" name="theaterNo" value="${theaterNo}">
					<input type="hidden" name="movietime" value="${movietime}">
					<input type="hidden" name="rType" value="seat">				
					<strong>�</strong>
					<div class="selectBox">					
						<select id="adult" class="dropdown" name="adult" onchange="select()">
							<option selected="selected">0</option>
						<c:forEach var="i" begin="1" end="8">
							<option>${i}</option>
						</c:forEach>					
						</select>
					</div>
					<strong>û�ҳ�</strong>
					<div class="selectBox">
						<select id="junior" class="dropdown" name="junior" onchange="select()">
							<option selected="selected">0</option>
						<c:forEach var="i" begin="1" end="8">
							<option>${i}</option>
						</c:forEach>					
						</select>
					</div>	
					<strong>�ôϾ�</strong>
					<div class="selectBox">
						<select id="senior" class="dropdown" name="senior" onchange="select()">
							<option selected="selected">0</option>
						<c:forEach var="i" begin="1" end="8">
							<option>${i}</option>
						</c:forEach>					
						</select>
					</div>			
				</form>
				<!-- ���� �ʱ�ȭ ��ư -->
				<a href="reserve2.do?year=${year }&month=${month }&checkedDay=${checkedDay}
				&checkedDay2=${checkedDay2}&local=${local }&tname=${tname }&grade=${grade }&title=${title}
				&poster=${poster }&theaterNo=${theaterNo}&movietime=${movietime}#nav">
					<div class="resetBtn">�����ʱ�ȭ</div>
				</a>				
			</div>
		</div>
		<!-- �ڸ� ����  include-->
		<div id="result">
			<jsp:include page="${jsp2 }"></jsp:include>		
		</div>			
	</div>
</body>
</html>