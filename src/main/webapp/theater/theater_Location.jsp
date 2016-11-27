<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="theater/theater_style.css">
</head>
<body>
	<center id="location_center">
		<c:if test="${theater=='신도림' }">
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<th width="10%">
						<img src="image/icon_bus.png"><br>버스
					</th>
					<td width="90%">
						· 일반버스 : 10, 83, 88, 510, 11-1, 11-2<br>
						· 좌석버스 : 320, 301<br>
						· 간선버스 : 503, 670, 260, 160, 600<br>
						· 지선버스 : 6515, 5714, 6512, 6513, 6637, 6640, 5615, 6648, 6649<br>
						· 마을버스 : 구로09<br>
						* 신도림역 2번 출구 : 6618, 6411, 6611, 6651, 5619, 6511, 6650, 6653, 영등포01<br>
					</td>
				</tr>
				<tr>
					<th>
						<img src="image/icon_subway.png"><br>지하철
					</th>
					<td>
						· 1,2호선 신도림역 : 1번 출구 지하도 바로 연결 > 건물 진입 후 엘리베이터 이용 7층
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<th width="10%">
						<img src="image/icon_car.png"><br>자가용
					</th>
					<td width="90%">
						· 디큐브시티로 오시는 여의도에서 영등포구간은 상습적인 교통정체구간으로 신도림 진입 시 많은 시간이 소요됩니다.<br>
						&nbsp;&nbsp;특히 주말이나 공휴일은 차량이 많아 주차에 많은 시간이 소요되오니 가급적 대중교통을 이용하여 주시기 바랍니다.<br> 
						&nbsp;&nbsp;(지하철 1,2호선 신도림역에서 도보로 5분 소요)
					</td>
				</tr>
				<tr>
					<th>
						<img src="image/icon_pkLot.png"><br>주차안내
					</th>
					<td>
						· 위치 : 디큐브시티 지하주차장(1,580대 주차 가능)<br>
						· 주차요금 : 영화관람 고객 3시간 무료 (3시간 초과시 10분당 1,000원)<br>
						· 주말, 공휴일은 차량이 많아 주차에 많은 시간이 소요되오니 가급적 대중교통을 이용하여 주시기 바랍니다.<br>
						&nbsp;&nbsp;(지하철 1,2호선 신도림역에서 도보로 5분 소요)<br>
						· 21시 입차 고객은 지하 3층~지하 5층까지만 주차가 가능합니다
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${theater=='영등포' }">
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_bus.png"><br>버스
					</td>
					<td width="90%">
						· 간선버스 (B) :261번(구 48번), 600 번(구123번), 605 번(구128번), 260번, 360번, 503번, 650번<br>
						· 지선버스 (G) : 5614번(구94번), 5615번(구119번), 5616번(구120번), 5714번(구118번), 6211번(구211번), <br>
						&nbsp;&nbsp;6512번(구114번), 6513번(구121번), 6514번(구303번), 6623번(구326번), 6628번(구122-1번), 6629번(구22번), <br>
						&nbsp;&nbsp;6631번(구125번), 5612번, 5625번, 5713번, 6630번, 6638번, 6639번, 7612번<br>
						· 광역버스 (R) : 9408번
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_subway.png"><br>지하철
					</td>
					<td>
						· 5호선 영등포 시장역 : 영등포 시장에서 도보로 10~15분 거리<br>
						· 1호선 영등포역 : 5번 출구 (롯데백화점 1층 > 엘리베이터 이용 7층)
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_car.png"><br>자가용
					</td>
					<td width="90%"> 
						· 서울 영등포구 영등포동, 618-496 시네마동
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_pkLot.png"><br>주차안내
					</td>
					<td>
						· 주간/야간, 주말 및 공휴일 : 티켓 소지 시 3시간 무료 주차 (지상주차장)
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${theater=='홍대입구' }">	
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_bus.png"><br>버스
					</td>
					<td width="90%">
						· 간선버스 (B) : 271번, 602번, 603번, 604번, 760번<br>
						· 지선버스 (G) : 5712번, 5714번, 6712번, 6716번, 7016번, 7612번, 7711번<br>
						· 광역버스 (R) : 921번
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_subway.png"><br>지하철
					</td>
					<td>
						· 2호선 홍대입구역 : 8번 출구 (도보 직진 50미터 > 우측 건물 진입 > 엘리베이터 10층)
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_car.png"><br>자가용
					</td>
					<td width="90%">
						· 서울 마포구 동교동 160-170
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_pkLot.png"><br>주차안내
					</td>
					<td>
						· 위치 : 롯데시네마 건물 지하주차장(건물뒷편 주차장입구)<br>
						· 영화 관람시 요금<br>
						&nbsp;&nbsp;&nbsp;&nbsp;- 평일 3시간 무료 / 주말 2시간 30분 무료<br>
						&nbsp;&nbsp;&nbsp;&nbsp;- 입차권 소지 후 매표소에서 주차 할인권을 받으세요.<br>
						&nbsp;&nbsp;(무료 주차 이후 추가 10분당 1,000원)<br>
						* 영화 관람하지 않을시 요금<br>
						&nbsp;&nbsp;&nbsp;&nbsp;- 기본 30분 2,000원 (기본 30분 이후 추가 10분당 1,000원)<br>
						* 티켓 환불시 주차 할인권도 회수 됩니다.<br>
						* 주차 할인권 분실시 재발급이 되지 않습니다.<br>
						* 주차장이 협소하여 만차가 될 확률이 높으니, 가급적 대중교통 이용 부탁드립니다.
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${theater=='용인' }">
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_bus.png"><br>버스
					</td>
					<td width="90%">
						· 공영버스 : 6-1, 68, 69, 81, 82, 82-1, 86-2, 88<br>
						· 도시형버스 : 2, 3, 7, 10, 10-5, 66, 66-1, 66-3, 66-4, 67, 820<br>
						· 마을버스 : 5경남<br>
						· 일반버스 : 2-1, 3-1, 93-1, 103<br>
						· 직행버스 : 5005
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_subway.png"><br>지하철
					</td>
					<td>
		
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_car.png"><br>자가용
					</td>
					<td width="90%">
						· 용인삼거리에서 처인구청 방향으로 800m 지점<br>
						· 용인시장, 우리은행 맞은 편<br>
						· 경기도 용인시 처인구 금령로 86 (김량장동)
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_pkLot.png"><br>주차안내
					</td>
					<td>
						· 영화 관람 시 3시간 무료주차 (지하주차장)<br>
						· 3시간 이후 10분당 200원<br>
						· 매표소에서 주차증에 확인 도장 받으세요
				</tr>
			</table>
		</c:if>
		
		<c:if test="${theater=='수원' }">
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_bus.png"><br>버스
					</td>
					<td width="90%">
						· 수원시내버스 : 2-1, 5-1, 16, 16-3, 22-1, 32, 32-1, 35-1, 36, 37, 38, 40, 82, 82-1, 83, 83-1, 85, 311, 9996<br>
						· 수원근접도시연계버스 : 24, 24-1, 25, 34, 46, 46-1, 300, 301, 305, 310, 707<br>
						· 서울연계버스 : 777, 888, 900, 900-1, 1115-13, 1007, 3000, 3001, 3003, 7770<br>
						· 분당연계버스 : 7, 7-2, 700, 700-2, 720, 720-1, 720-2, 1004<br>
						· 에버랜드 연계버스 : 10-5, 66, 66-4, 600, 6000
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_subway.png"><br>지하철
					</td>
					<td>
						· 1호선, 분당선 수원역 : 3번 출구 (도보 직진 200미터 > 건물 진입 후 엘리베이터 이용 5층)
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_car.png"><br>자가용
					</td>
					<td width="90%">
						· 장안방면 - 팔달로, 팔달방면 - 매산로, 영통방면 - 권선로, 화성봉담 방면 - 매송고색로, 화성동탄 방면 - 덕영대로, <br>
						&nbsp;&nbsp;용인기흥 방면- 세화로, 용인수지 방면 - 경수대로 이용하여 롯데몰 수원 주차장 진입<br>
						· 네비게이션 이용시 : 경기도 수원시 권선구 세화로 134 롯데몰 수원
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_pkLot.png"><br>주차안내
					</td>
					<td>
						· 롯데시네마 이용 시 주차장 사전 예약 없이 입차 가능 <br>
						· 영화관람 증빙(바로티켓 포함) 제시 시 주중/주말 3시간 30분 무료주차, 시간초과시 10분당 500원 ※ 내부/외부 주차장 이용 시 적용 <br>
						· 주차장 : 지하2층~지상4층 <br>
						· 주차가능 대수 : 2,320대
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${theater=='안산' }">
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_bus.png"><br>버스
					</td>
					<td width="90%">
						* 중앙역, 예술인아파트, 안산버스터미널 정류장<br>
						· 시내버스 : 30, 30-2, 30-3, 30-7, 52, 62, 70, 77, 99, 99-1, 101<br>
						· 좌석버스 : 314, 5601, 909
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_subway.png"><br>지하철
					</td>
					<td>
						· 4호선 중앙역 : 1번출구 (도보 직진 250미터 > 전방 횡단보도 이용 > 도보 직진 250미터 > 전방 횡단보도 이용 ><br>
						&nbsp;&nbsp;좌측 횡단보도 이용 > 도보 직진 200미터 > 우측 건물 진입 후 엘리베이터 이용 4층)
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_car.png"><br>자가용
					</td>
					<td width="90%">
						· 안산시외버스터미널 옆 롯데마트 4층에 위치
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_pkLot.png"><br>주차안내
					</td>
					<td>
						· 영화 관람 시 무료주차 가능합니다. (요일무관)<br>
						· 롯데마트 주차장은 주말에는 매우 혼잡하므로 영화관 방문에 시간적 여유를 두시거나, 대중교통 이용을 권장합니다.
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${theater=='검단' }">
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_bus.png"><br>버스
					</td>
					<td width="90%">
						· 시외버스 : 1101번<br>
						· 좌석버스 : 90번<br>
						· 시내버스 : 1번, 7번, 17-1번, 77번, 78번, 120번, 841번
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_subway.png"><br>지하철
					</td>
					<td>
						· 검암역 하차(김포방면) 후 901, 66, 7, 1, 903, 17, 1번 버스 탑승 > 검단 농협 혹은 검단1동 주민센터 정류장에서 하차 > <br>
						&nbsp;&nbsp;도보 직진 200미터 > 건물 진입 후 엘리베이터 이용 6층
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_car.png"><br>자가용
					</td>
					<td width="90%">
						· 검암역에서 강화방면으로 직진, 완정사거리에서 좌회전, 원당대로에서 직진, 검단 금호 어울림아파트 좌측으로 둔 <br>
						&nbsp;&nbsp;상태에서 우회전 완정로 에서 좌회전 후 검단사거리 까지 직진(택시비용 약 4~5,000원)
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_pkLot.png"><br>주차안내
					</td>
					<td>
						· 서울방면에서 오실경우 검단 사거리에서 좌회전 하신뒤 50m 진입 태백산 음식점으로 우회전 하신뒤 티티트리플 타워<br>
					    &nbsp;&nbsp;뒷편으로 오시면 전용주차타워가 있습니다.<br>
						· 인천방면에서 오실경우 검단 사거리 진입 전 오일뱅크 주유소가 있는 사거리에서 좌회전 하신 뒤 티티트리플 타워 <br>
						&nbsp;&nbsp;뒷편으로 오시면 전용주차타워가 있습니다.
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${theater=='부평' }">
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_bus.png"><br>버스
					</td>
					<td width="90%">
						* 부평역 정류장<br>
						· 시내버스 : 12, 30, 34, 67-1<br>
						· 광역버스 : 1400, 9500<br>
						· 지선버스 : 551<br>
						· 좌석버스 : 103, 111<br>
						· 간선버스 : 2, 14-1<br>
						&nbsp;&nbsp;&nbsp;&nbsp;- 부평역 하차 문화의거리를 지나 시장로터리로 오시면 다운타운빌딩(14층건물) 6층<br>
						· 진선미예식장 정류장<br>
						· 시내버스 : 1, 10, 23, 24, 24-1, 35, 45, 67<br>
						· 지선버스 : 552<br>
						&nbsp;&nbsp;&nbsp;&nbsp;-시장로터리 방면 전방100M 다운타운빌딩(14층건물) 6층
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_subway.png"><br>지하철
					</td>
					<td>
						· 1호선, 인천1호선 부평역
						· 지하출구에서 지하상가를 따라 부평시장로터리 방향으로 직진 > 20번출구 > 도 보 직진 100미터 다운타운빌딩 6층
						· 인천 1호선 : 20-B 출구 (도보 직진 300미터 > 우측 코너 30미터 > 우측 건물 진입 후 엘리베이터 이용 6층
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_car.png"><br>자가용
					</td>
					<td width="90%">
						· 인천광역시 부평구 대정로 66 (부평동)
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_pkLot.png"><br>주차안내
					</td>
					<td>
						· 부평역에서 부평시장로터리 방면으로 직진하면 우측에 다운타운빌딩(14층 건물) 지하 1층에서 지하 5층<br>
						· 경인고속도로 부평IC 부평방면 출구에서 직진하여 시장로터리 진입 다운타운빌딩(14층 건물) 지하 1층에서 지하 5층<br>
						· 주차 후 3시간 무료, 3시간 이후 30분에 1,000원씩 추가요금 (티켓소지고객)
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${theater=='인천' }">
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_bus.png"><br>버스
					</td>
					<td width="90%">
						· 일반버스 : 3, 4, 6, 11, 13, 21, 21-1, 22, 27, 35, 36, 38<br>
						· 좌석버스 : 111, 700<br>
						· 마을버스 : 514-1, 520, 523, 534<br>
						· 광역버스 : 1300, 9901, 9902<br>
						· 지방경찰청 앞 : 21,77<br>
						· 백화점 앞 - 41<br>
						· 길병원 응급센터 맞은편 - 45
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_subway.png"><br>지하철
					</td>
					<td>
						· 1호선 예술회관역 : 롯데백화점 방향<br>
						· 1호선 예술회관역 : 5번출구<br>
						(도보 직진 100미터 > 전방 횡단보도 이용 > 도보 50미터 > 좌측 건물 진입 후 엘리베이터 이용 7층)
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_car.png"><br>자가용
					</td>
					<td width="90%">
						· 주말 및 공휴일에는 구월동 도로의 극심한 교통 체증으로 주차장 이용에 불편을 겪으실 수 있사오니 
						&nbsp;&nbsp;대중교통의 이용을 적극 권장합니다.
						· 인천 남동구 구월동,1455
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_pkLot.png"><br>주차안내
					</td>
					<td>
						· 위치 : 롯데백화점 본관 주차장 B3 ~ B6<br>
						· 요금 : 영화관람시 3시간 무료 주차 (영화 상영시간에 따라 탄력적 운용)<br>
						· 주말 및 공휴일에는 구월동 도로의 극심한 교통 체증으로 주차장 이용에 불편을 겪으실 수 있사오니<br> 
						&nbsp;&nbsp;대중교통의 이용을 적극 권장합니다.
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${theater=='율하' }">
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_bus.png"><br>버스
					</td>
					<td width="90%">
						· 518, 618, 719번
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_subway.png"><br>지하철
					</td>
					<td>
						· 1호선 율하역 : 3, 4번 출구 앞 (건물 진입 후 엘리베이터 이용 4층)
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_car.png"><br>자가용
					</td>
					<td width="90%">
						· 수성IC -> 대구부산고속도로 -> 화랑로 동대구IC -> 범물/대구스타디움 방면(우회전) -> 롯데시네마 율하
						· 동대구IC -> 화랑 동대구IC 방향 -> 대구 스타디움 방면 (우회전) -> 롯데시네마 율하
						· 북대구IC -> 시청/신천대로 방면 우측방향 -> 신천대로 -> 노원로 신청대로 -> 동북로 경찰서 앞(좌회전) 
						&nbsp;&nbsp;-> 화랑로 효목네거리(좌회전) -> 범물/대구스타디움 방면(우회전) -> 롯데시네마 율하
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_pkLot.png"><br>주차안내
					</td>
					<td>
						· 총 : 1,127대 (무료주차)<br>
						· 지하(2F) : 400대<br>
						· 지상(3~6F) : 727대<br>
						- 4F 주차장을 이용 하시면 영화관을 보다 편히 이용하실수 있습니다.
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${theater=='성서' }">
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_bus.png"><br>버스
					</td>
					<td width="90%">
						· 성서우방타운건너편 : 305 ,405, 503, 521, 655, 달서 2번<br>
						· 성서우체국 건너편 : 564번<br>
						· 조흥은행 대구지점 앞 : 425, 805, 성서1, 성서2, 성서3번
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_subway.png"><br>지하철
					</td>
					<td>
						· 2호선 성서산업단지역 : 7번 출구 (도보 직진 200미터 > 전방 횡단보도 이용 > 도보 직진 50미터 ><br>
						&nbsp;&nbsp;우측 건물 진입 후 엘리베이터 이용 4층)
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_car.png"><br>자가용
					</td>
					<td width="90%">
						· 시내 방면 : 반월당네거리 → 계산오거리 → 두류네거리 → 죽전네거리 → 성서네거리 우회전 → 롯데시네마 성서<br>
						· 서부정류장 방면 : 서부정류장(성당네거리) → 본리네거리 → 성서 네거리 직진→ 롯데시네마 성서<br>
						· 경산 방면 : 경산 I.C(경부고속도로) → 동대구 I.C → 북대구 I.C → 서대구 I.C→ 계명대 방향 <br>
						&nbsp;&nbsp;&nbsp;&nbsp;→ 성서네거리(대구은행네거리) 우회전 → 롯데시네마 성서<br>
						· 수성구 방면 : 신천대로 → 팔달교방면 → 성서,성주방향(성서 I.C하차) → 성서네거리(대구은행네거리) 우회전 <br>
						&nbsp;&nbsp;&nbsp;&nbsp;→ 롯데시네마 성서
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_pkLot.png"><br>주차안내
					</td>
					<td>
						· 출차시 주차권과 영화티켓 및 매점, 건물 내 타 이용시설 영수증을제시해 주시기 바랍니다.<br>
						· 기본요금은 10분당 200원입니다.<br>
						· 주말, 공휴일구분없이 동일하게 적용됩니다.<br>
						· 이용가능 주차장<br>
						&nbsp;&nbsp;&nbsp;&nbsp;- 롯데시네마 건물 지하 1, 2, 3층<br>
						&nbsp;&nbsp;&nbsp;&nbsp;- 영화관 관람고객: 3시간 무료<br>
						&nbsp;&nbsp;&nbsp;&nbsp;- 매점 및 건물내상가 이용고객: 2시간 무료
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${theater=='해운대' }">
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_bus.png"><br>버스
					</td>
					<td width="90%">
						· 일반버스 - 36, 38, 1001, 115-1번 장산역 하차<br>
						· 마을버스 - 해운대2, 해운대8, 해운대9-1번 장산역 하차
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_subway.png"><br>지하철
					</td>
					<td>
						· 2호선 장산역 : 7번,9번 출구 바로 연결 (건물 진입 후 엘리베이터 이용 7층)
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_car.png"><br>자가용
					</td>
					<td width="90%"> 
						· 부산시 해운대구 해운대로 802 (네비게이션)
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_pkLot.png"><br>주차안내
					</td>
					<td>
						· 롯데시네마 지하주차장 340여대<br>
						· 주차요금 당일 관람객에 한해 3시간 무료주차
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${theater=='서면' }">
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_bus.png"><br>버스
					</td>
					<td width="90%">
						· 일반버스 : 5, 5-1, 10, 10-1, 17, 29-1, 35, 43, 52, 52-1, 57, 57-1, 67, 80, 80-1, 85, 86, 89, 98, 99, 103, 111, 111-2번
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_subway.png"><br>지하철
					</td>
					<td>
						· 1, 2호선 서면역 : 8번 출구 (도보 직진 200미터 > 대각선 횡단보도 이용 > 건물 진입 후 엘리베이터 이용 6층)
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_car.png"><br>자가용
					</td>
					<td width="90%">
						· 부산 부산진구 전포동,668-1번지
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_pkLot.png"><br>주차안내
					</td>
					<td>
						· 주차요금: 티켓 소지시 3시간 무료(초과시 10분당 500원)<br>
						· 주차위치: NC백화점 서면점 건물 내 지하 1~2층 주차장 또는 건물외곽 타워 주차장 2 ~6층
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${theater=='부산' }">
			<h3 align="left">대중교통 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_bus.png"><br>버스
					</td>
					<td width="90%">
						· 김해공항 -> 롯데백화점 : 공항리무진(1시간 단위)<br>
						· 사상방면 -> 롯데백화점 : 107번, 108번, 62번 등<br>
						· 부산역방면 -> 롯데백화점 : 98번, 67번, 167번, 81번, 28번<br>
						· 해운대방면 -> 롯데백화점 : 141번, 40번, 31번, 5번<br>
						· 동래방면 -> 백화점 : 111번, 77번, 31번, 52번
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_subway.png"><br>지하철
					</td>
					<td>
						· 서면역 1, 2호선 지하 롯데백화점과 바로 연결 (엘리베이터 이용 10층)
					</td>
				</tr>
			</table>
			<h3 align="left">자가용 이용 시</h3>
			<table width="1000" id="location_info">
				<tr>
					<td width="10%">
						<img src="image/icon_car.png"><br>자가용
					</td>
					<td width="90%">
						· 부산 부산진구 부전동,503-15
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/icon_pkLot.png"><br>주차안내
					</td>
					<td>
						· 평일, 주말, 공휴일 : 3시간 무료
						· 영화를 관람하신 후 주차하실 때 뽑으신 주차카드와 영화관람권을 영화관 매표소로 <br>
						&nbsp;&nbsp;가지고 오시면 주차카드에 3시간 무료 충전을 드립니다.<br>
						· 3시간 무료 주차 이후, 저녁 7시 이전은 10분당 500원씩 추가되며 저녁 7시 이후에는 시간당 500원씩 추가됩니다.
					</td>
				</tr>
			</table>
		</c:if>
	</center>
</body>
</html>





















