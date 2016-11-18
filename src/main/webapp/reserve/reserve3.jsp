<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Reserve3 Payment</title>
	<link rel="stylesheet" type="text/css" href="reserve/reserve_style.css">
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script type="text/javascript">	
		/* ���� ��� ����� ���� �ʱ�ȭ */
		window.onload=function(){
			var IMP = window.IMP;
			IMP.init('imp74690571'); 
		}
		
		/* ���� ��� ���ÿ� ���� ���� ��� �� ���� �� ȭ�� ǥ�� ��ȯ*/
		function display1() {
			card.style.display='block';
			account.style.display='none';
			return;
		}
		
		function display2(){
			card.style.display='none';
			account.style.display='block';
			return;
		} 
		
		/* ���� ��� ȣ��*/
		function payment(type){
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : type,
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : 'Marvel Cinema ${title} ����',
			    amount : '${payment }',
			    buyer_name : '${mvo.name }',
			    buyer_email :''
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '������ �Ϸ�Ǿ����ϴ�.';
			        /*
			        	����ID : rsp.imp_uid
			        	���� �ŷ�ID : rsp.merchant_uid	
			       		���� �ݾ� : rsp.paid_amount
			        	ī�� ���ι�ȣ : rsp.apply_num
			        */
			        $.jQueryAlert(msg);
			        var $frmBox = $.parseHTML('<input type="hidden" name="pid" value='+rsp.imp_uid+'>'
			        						+'<input type="hidden" name="sid" value='+rsp.merchant_uid+'>'
			        						+'<input type="hidden" name="sp" value='+rsp.paid_amount+'>'
			        						+'<input type="hidden" name="cokn" value='+rsp.apply_num+'>'
			        						+'<input type="hidden" name="paytype" value='+type+'>');
			        $('#paymentfrm').append($frmBox);
			        $('#paymentfrm').submit();
			    } else {
			        var msg = '������ �����Ͽ����ϴ�.<br/>';
			        msg += '�������� : ' + rsp.error_msg+'.';	
			        $.jQueryAlert(msg);
			    }
			    
			});
		}	

		/* jQuery Alert â */
		jQuery.jQueryAlert = function (msg) {
            var $messageBox = $.parseHTML('<div id="alertBox"></div>');
            $("body").append($messageBox);

            $($messageBox).dialog({
                open: $($messageBox).append(msg),
                title: "ó�� ���",
                autoOpen: true,
                modal: true,
                resizable:false, 
				width: 400,
                buttons: {
                    OK: function () {
                        $('div #alertBox').dialog("close");
                    }
                }
            });
        };
        
        function reback(){
			location.href="reserve2.do?year=${year }&month=${month }&checkedDay=${checkedDay}&checkedDay2=${checkedDay2}"
				+"&poster=${poster}&tname=${tname }&grade=${grade }&title=${title}&theaterNo=${theaterNo}&movietime=${movietime}"
				+"&ticketAll=${ticketAll}&payment=${payment}&seatNo=${seatNo }";
		}	
        
	</script>
</head>
<body>
	<div align="center" class="finalPaymentInfo">
		<h2>���� Ȯ��</h2>
		<table class="paymentInfo">
			<tr>
				<th width="33%">��ȭ</th>
				<th width="33%">���� ����</th>
				<th width="33%">�� ���� �ݾ�</th>					
			</tr>
			<tr>
				<td width="40%">
					<img alt="${title }_poster" src="${poster }" width="110px" height="160px">
					<c:if test="${grade=='0'}">
						<img src="image/bg_grade_all.png">
					</c:if>
					<c:if test="${grade=='12'}">
						<img src="image/bg_grade_12.png">
					</c:if>
					<c:if test="${grade=='15'}">
						<img src="image/bg_grade_15.png">
					</c:if>
					<c:if test="${grade=='18'}">
						<img src="image/bg_grade_18.png">
					</c:if>
					<span style="width: 180px;display: inline-block; vertical-align: inherit; color:#f78824;">
						${title }
					</span>				
				</td>
				<td width="30%">
					<ul>
						<li>
							<strong>���� :</strong> 
							<span style="color:#f78824;">
								${year }. ${month }. ${checkedDay } (${checkedDay2 })
							</span>
						</li>
						<li>
							<strong>�󿵽ð� :</strong> 
							<span style="color:#f78824;">	
								${movietime}
							</span>	
						</li>
						<li>
							<strong>�󿵰� :</strong> 
							<span style="color:#f78824;">	
								${tname } ${theaterNo} 
							</span>��
						</li>
						<li>
							<strong>�¼� :</strong>
							<span style="color:#f78824;">  
							${seatNo }
							</span>
						</li>						 
					</ul>
				</td>
				
				<td width="30%">
					<ul>
						<li>
							<strong>��ȭ ���� :</strong>
							<span style="color:#f78824;">  
							<c:if test="${payment!=0 }"> 
								<fmt:formatNumber value="${payment }" pattern=",000"/> 
							</c:if>
							<c:if test="${payment==0 }">
								${payment }
							</c:if>	
							</span>��
						</li>
					</ul>
				</td>
			</tr>
		</table>		
		<h2 class="payment_title">����</h2>
		<table width="700">
			<tr>
				<td align="center" id="td1">�������� �Է�</td>
			</tr>
			<tr>
				<td align="center" id="td2">
					<input type="radio" name="pay" value="card" onclick="display1()" checked>�ſ�ī��
					<input type="radio" name="pay" value="account" onclick="display2()">������ü
					<form id="paymentfrm" action="reserve4.do" method="post">
						<input type="hidden" name="year" value="${year }">
						<input type="hidden" name="month" value="${month }">
						<input type="hidden" name="checkedDay" value="${checkedDay }">
						<input type="hidden" name="checkedDay2" value="${checkedDay2 }">
						<input type="hidden" name="tname" value="${tname }">
						<input type="hidden" name="grade" value="${grade }">
						<input type="hidden" name="title" value="${title }">
						<input type="hidden" name="poster" value="${poster }">					
						<input type="hidden" name="theaterNo" value="${theaterNo}">
						<input type="hidden" name="movietime" value="${movietime}">
						<input type="hidden" name="ticketAll" value="${ticketAll}">
						<input type="hidden" name="payment" value="${payment}">	
						<input type="hidden" name="seatNo" value="${seatNo }">
					</form>
				</td>
			</tr>
		</table>
		<div id="card">
			<table width="700" class="payment_table">
				<tr>
					<td>
						�ſ�ī�� ���� �ȳ�<br>
						1.�������� Ȯ�� �� �����ϱ� ��ư�� Ŭ����, �˾�â�� ��Ÿ���ϴ�.<br>
						2.�ش� �˾����� ���ϴ� ī��縦 ���� �� ���� ������ �Է��Ͻø� �˴ϴ�.
						     �� �ſ�ī�� ���� ���� �ּ� �ݾ��� 1,000�� �̻� �Դϴ�.     
					</td>
				</tr>
			</table>
			<input type="button" value="���" onclick="reback()" class="back_button2">
			<input type="button" value="����" onclick="javascript:payment('card')" class="next_button2">
		</div>
		<div id="account" style="display:none">
			<table width="700" class="payment_table">
				<tr>
					<td>
						�ǽð� ������ü �ȳ�<br>
						1.�������� Ȯ�� �� �����ϱ� ��ư�� Ŭ����, �˾�â�� ��Ÿ���ϴ�.<br>
						2.�ش� �˾����� ���ϴ� ������ ���� �� ������ü ������ �Է��Ͻø� �˴ϴ�.
					</td>
				</tr>
			</table>
			<input type="button" value="���" onclick="reback()" class="back_button2">
			<input type="button" value="����" onclick="javascript:payment('trans')" class="next_button2">
		</div>
	</div>	
</body>
</html>






