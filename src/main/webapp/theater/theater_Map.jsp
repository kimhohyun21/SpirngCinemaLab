<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Map</title>
	<link rel="stylesheet" type="text/css" href="theater/theater_style.css">
</head>
<body>
	<table width="1000" id="map_table">
		<tr>
			<td id="title">
				<h3>${theater } 롯데시네마 위치정보</h3>
			</td>
		</tr>
		<tr>
			<td id="map" style="border: 1px solid #9e9e9e; margin-top: 10px; margin-bottom: 10px;"></td>
		</tr>
		<tr>
			<td id="addr">
				<c:if test="${theater=='신도림' }">
					주소 : 서울특별시 구로구 경인로 662 (신도림동, 디큐브시티 7층)
				</c:if>
				<c:if test="${theater=='영등포' }">
					주소 : 서울특별시 영등포구 경인로102길 13 (영등포동, 시네마동 7층)
				</c:if>
				<c:if test="${theater=='홍대입구' }">
					주소 : 서울특별시 마포구 양화로 176 (동교동, 와이즈파크 8층)
				</c:if>
				<c:if test="${theater=='용인' }">
					주소 : 경기도 용인시 처인구 금령로 86 (김량장동)
				</c:if>
				<c:if test="${theater=='수원' }">
					주소 : 경기도 수원시 권선구 세화로 134 (서둔동, 롯데몰 5층)
				</c:if>
				<c:if test="${theater=='안산' }">
					주소 : 경기도 안산시 상록구 충장로 427 (성포동, 롯데마트 안산점 4층)
				</c:if>
				<c:if test="${theater=='검단' }">
					주소 : 인천광역시 서구 완정로 163 (왕길동)
				</c:if> 
				<c:if test="${theater=='부평' }">
					주소 : 인천광역시 부평구 대정로 66 (부평동, 다운타운일레븐 6층~10층)
				</c:if> 
				<c:if test="${theater=='인천' }">
					주소 : 인천광역시 남동구 예술로 148 (구월동, 롯데백화점 7층)
				</c:if> 
				<c:if test="${theater=='율하' }">
					주소 : 대구광역시 동구 안심로 80 (율하동)
				</c:if> 
				<c:if test="${theater=='상인' }">
					주소 : 대구광역시 달서구 월곡로 247 (상인동, 더콜로니 6층)
				</c:if> 
				<c:if test="${theater=='성서' }">
					주소 : 대구광역시 달서구 성서로 414 (이곡동)
				</c:if> 
				<c:if test="${theater=='해운대' }">
					주소 : 부산광역시 해운대구 해운대로 802 (좌동, 웅신시네아트 7층)
				</c:if>
				<c:if test="${theater=='서면' }">
					주소 : 부산광역시 부산진구 동천로 92 (전포동, NC백화점 6층)
				</c:if>
				<c:if test="${theater=='부산' }">
					주소 : 부산광역시 부산진구 가야대로 772 (부전동, 롯데백화점 10층)
				</c:if> 
			</td>
		</tr>
	</table>
	<div ></div>
	<script type="text/javascript" src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=B89LGmTHAKKmgnTgbizc"></script>
	<script type="text/javascript">
		var cinema;
		if(${theater=='신도림'}){
			cinema=new nhn.api.map.LatLng(37.5081508,126.88806390000002);
		}
		if(${theater=='영등포'}){
			cinema=new nhn.api.map.LatLng(37.515887, 126.907472);
		}
		if(${theater=='홍대입구'}){
			cinema=new nhn.api.map.LatLng(37.557237, 126.924949);
		}
		if(${theater=='용인'}){
			cinema=new nhn.api.map.LatLng(37.235082, 127.205942);
		}
		if(${theater=='수원'}){
			cinema=new nhn.api.map.LatLng(37.264242, 126.997365);
		}
		if(${theater=='안산'}){
			cinema=new nhn.api.map.LatLng(37.317965, 126.846104);
		}
		if(${theater=='검단'}){
			cinema=new nhn.api.map.LatLng(37.601659, 126.658063);
		}
		if(${theater=='부평'}){
			cinema=new nhn.api.map.LatLng(37.493481, 126.726511);
		}
		if(${theater=='인천'}){
			cinema=new nhn.api.map.LatLng(37.447034, 126.701232);
		}
		if(${theater=='율하'}){
			cinema=new nhn.api.map.LatLng(35.867837, 128.694069);
		}
		if(${theater=='상인'}){
			cinema=new nhn.api.map.LatLng(35.816619, 128.539320);
		}
		if(${theater=='성서'}){
			cinema=new nhn.api.map.LatLng(35.854459, 128.507832);
		}
		if(${theater=='해운대'}){
			cinema=new nhn.api.map.LatLng(35.169167, 129.176596);
		}
		if(${theater=='서면'}){
			cinema=new nhn.api.map.LatLng(35.157090, 129.063113);
		}
		if(${theater=='부산'}){
			cinema=new nhn.api.map.LatLng(35.156689, 129.056118);
		}
		
	    var defaultLevel = 11;
	    var oMap = new nhn.api.map.Map(document.getElementById('map'), {
	        point: cinema,
	        zoom: defaultLevel,
	        enableWheelZoom: true,
	        enableDragPan: true,
	        enableDblClickZoom: false,
	        mapMode: 0,
	        activateTrafficMap: false,
	        activateBicycleMap: false,
	        minMaxLevel: [1, 14],
	        size: new nhn.api.map.Size(1000, 480)
	    });
	    var oSlider = new nhn.api.map.ZoomControl();
	    oMap.addControl(oSlider);
	    oSlider.setPosition({
	        top: 10,
	        left: 10
	    });
	
	    var oMapTypeBtn = new nhn.api.map.MapTypeBtn();
	    oMap.addControl(oMapTypeBtn);
	    oMapTypeBtn.setPosition({
	        bottom: 10,
	        right: 80
	    });
	
	    var oThemeMapBtn = new nhn.api.map.ThemeMapBtn();
	    oThemeMapBtn.setPosition({
	        bottom: 10,
	        right: 10
	    });
	    oMap.addControl(oThemeMapBtn);
	
	    var oSize = new nhn.api.map.Size(28, 37);
	    var oOffset = new nhn.api.map.Size(14, 37);
	    var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset); 
	
	    var oInfoWnd = new nhn.api.map.InfoWindow();
	    oInfoWnd.setVisible(false);
	    oMap.addOverlay(oInfoWnd);
	
	    oInfoWnd.setPosition({
	        top: 20,
	        left: 20
	    }); 
	
	    oMap.attach('click', function (oCustomEvent) {
	        var oPoint = oCustomEvent.point;
	        var oTarget = oCustomEvent.target;
	        oInfoWnd.setVisible(false);
	        // 마커 클릭하면
	        if (oTarget instanceof nhn.api.map.Marker) {
	            // 겹침 마커 클릭한거면
	            if (oCustomEvent.clickCoveredMarker) {
	                return;
	            }
	            // - InfoWindow에 들어갈 내용은 setContent로 자유롭게 넣을 수 있습니다. 외부 css를 이용할 수 있으며,
	            // - 외부 css에 선언된 class를 이용하면 해당 class의 스타일을 바로 적용할 수 있습니다.
	            // - 단, DIV의 position style은 absolute가 되면 안되며,
	            // - absolute의 경우 autoPosition이 동작하지 않습니다.
	            oInfoWnd.setContent('<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">' +
	                 '<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight: bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 5px 2px 2px !important">' +
	                    'Hello World <br /> ' + oTarget.getPoint()
	                    + '<span></div>');
	            oInfoWnd.setPoint(oTarget.getPoint());
	            oInfoWnd.setPosition({right: 15, top: 30});
	            oInfoWnd.setVisible(true);
	            oInfoWnd.autoPosition();
	            return;
	        }       
	    });
	    var oMarker1 = new nhn.api.map.Marker(oIcon, { title : '' });  //마커 생성 
	    oMarker1.setPoint(cinema); //마커 표시할 좌표 선택
	    oMap.addOverlay(oMarker1); //마커를 지도위에 표현 
	</script>
</body> 
</html>