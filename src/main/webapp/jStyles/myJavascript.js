/**
 * custom javascript
 */
/*결제 모듈 초기화*/
function startPayment(){
	var IMP = window.IMP;
	IMP.init('imp74690571');
}

//세션 시간 관리
var minute = 29;
var second = 59;
var counter= 59;
var timer;
var timer1;
var timer2;	
function sessionCheck(){			
	timer=setInterval("timeclock()", 1000);
	timer1=setTimeout("outMove()", 1739000);
}	

//접속 시간 표시
function timeclock() {
	if (second == 0) {
		minute = minute - 1;
		second = 59 ;
	} else {
		second = second - 1;
	}
	if (minute < 10 && minute >= 0) {
		$('#txtMins').val(0 +minute.toString());
	} else {
		$('#txtMins').val(minute);
	}			
	if (second < 10) {
		$('#txtSecs').val(0 + second.toString());
	} else {
		$('#txtSecs').val(second);
	}
	if(minute<0 && second <0){     
		return;
	}			
}

//10초 남았을 때 연장 혹은 자동 로그 아웃
function outMove(){			
	$.jQueryTimer();			
}

/* jQuery Timer 창 */
jQuery.jQueryTimer = function () {			
	 var $messageBox = $.parseHTML('<div id="alertBox">'
	  								+'<span id="tchecker"></span>&nbsp;초 후 '	
	  								+'접속시간이 만료될 예정입니다...'
				            		+'</div>');
	 $("body").append($messageBox);         
	  
	 $($messageBox).dialog({
		 open:function(){
			 if(counter==59){
		 		shutDown();
		 		timer2=setInterval("shutDown()", 1000);	
			 }       				
		 },
	     autoOpen: true,
	     modal: true,
	     resizable:false,
	     width: 400,
		 close: function(){
			clearInterval(timer2);
			reloadTime();
		 },
	     buttons: {
	    	 연장:function(){    		               		
	    		 $(this).dialog('close');
	    	 }
		 },
	 });
};
 
//세션 종료 카운트 다운
function shutDown(){
	if(counter!=0){
		$('span#tchecker').html(counter);
	}else if(counter==0){
		$('div#alertBox').html('접속을 종료합니다.');
		$.ajax({
			url: "logout.do",   				
			async: true
		});
		window.location="main.do";
	}
	counter-=1;
}

//시간 연장
function reloadTime(){
	clearInterval(timer1);
	minute = 29;
	second = 59;
	counter= 59;
	$.ajax({
		url: "main.do",
		async: true
	});
	timer1=setTimeout("outMove()", 1739000);
}      	

/* jQuery Alert 창 */
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

/* jQuery Alert 창 - 함수 활용 */
jQuery.jQueryAlertF = function (msg, func) {
    var $messageBox = $.parseHTML('<div id="alertBox"></div>');
    $("body").append($messageBox);

    $($messageBox).dialog({
        open: $($messageBox).append(msg),
        autoOpen: true,
        modal: true,
        resizable:false, 
		width: 400,	
		close: func,
        buttons: {
            OK: function () {
                $(this).dialog("close");
            }
        }
    });
};

jQuery.jQueryAlertY = function (msg) {
    var $messageBox = $.parseHTML('<div id="alertBox"></div>');
    $("body").append($messageBox);

    $($messageBox).dialog({
        open: $($messageBox).append(msg),
        autoOpen: true,
        modal: true,
        resizable:false, 
		width: 400,	
        buttons: {
            예: function () {
                $(this).dialog("close");
            },
            아니오: function () {
                $(this).dialog("close");
                history.back();
            }
        }
    });
};

jQuery.jQueryAlertE = function (msg) {
    var $messageBox = $.parseHTML('<div id="alertBox"></div>');
    $("body").append($messageBox);

    $($messageBox).dialog({
        open: $($messageBox).append(msg),
        autoOpen: true,
        modal: true,
        resizable:false, 
		width: 400,	
		close: function(){
			location.href="main.do";
		},
        buttons: {
            OK: function () {
                $(this).dialog("close");
            }
        }
    });
};

/*jQuery Login*/
jQuery.jQueryLogin = function (){
	var $loginform = $.parseHTML('<div id="logindiv">'
									+'<form name="loginfrm" action="login_ok.do" method="post" "id="loginfrm">'
									+'<div class="input">'
									+'<label class="idlabel" for="id">ID</label>'
									+'<input type="text" placeholder="아이디를 입력하세요." name="id" id="id" onkeydown="enter()">'
									+'</div>'+'<div class="input">'
									+'<label class="pwlabel" for="pwd">PW</label>'
									+'<input type="password" placeholder="패스워드를 입력하세요." name="pwd" id="pwd" onkeydown="enter()">'
									+'</div><input type="hidden" name="loginType" value="reserve">'
									+'</form><div id="find">'
									+'<a href="searchId.do">아이디 찾기</a>&nbsp;|&nbsp;'
									+'<a href="searchPwd.do">비밀번호 찾기</a></div>');
	$("body").append($loginform);
	
	$($loginform).dialog({
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

//로그인 창 값 입력 체크
function login(){
	var id=$('#id').val();	
	if(id==""){
		$.jQueryAlert("아이디를 입력하세요");
		$('#id').focus();
		return;
	}
	var pwd=$('#pwd').val();
	if(pwd==""){
		$.jQueryAlert("비밀번호를 입력하세요");
		$('#pwd').focus();
		return;
	}
	
	$.ajax({
		type: "POST",
		url: "login_ok.do",
		data:$('form').serialize(),
		dataType: "json",
		success:function(data){
			if(data.check=="ok"){
				window.location.reload(true);
			}else if(data.check=="pwdnot"){
				$.jQueryAlert("패스워드가 잘못 되었습니다.");
			}else if(data.check=="idnot"){
				$.jQueryAlert("아이디가 잘못 되었습니다.");
			}
		},
		error:function(data){
			$.jQueryAlert("통신실패");
		}
	});
}