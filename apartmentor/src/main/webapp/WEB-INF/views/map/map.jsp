<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>우리아파트 주변지도</title>
	<!-- jQuery 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style>
		.wrap {
			width: 1200px;
			margin: auto;
			min-height: 1000px;
		}
	</style>
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	<div class="wrap">
		<div id="map" style="width:800px;height:600px;margin-left:100px;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7a0d8fb50d86ba5e9d0d3d346e697ce"></script>
		<script>
			var container = document.getElementById('map');
			var mapOption = {
				center: new kakao.maps.LatLng(37.52446782011257, 126.8756965780569), // 지도의 중심좌표
				level: 4 // 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(container, mapOption); // 지도를 생성합니다

			
			$(function(){
				bike();
				loadBus();
				setInterval(loadBus, 5000);
			})
			


			function loadBus() {
				$.ajax({
					url: 'bus640.api',
					type: "GET",
					dataType: "text",
					success: function (data) {
						if (data) {
							$(data).find('itemList').each(function () {
								

								var tmX = $(this).find("tmX").text();
								var tmY = $(this).find("tmY").text();
								var plainNo = $(this).find("plainNo").text();
								var congetion = $(this).find("congetion").text();
								var stopFlag = $(this).find("stopFlag").text();
								
								if(congetion == 0){
									congetion = "정보없음";
								} else if(congetion == 3){
									congetion = "여유";
								} else if(congetion == 4){
									congetion = "보통";
								} else if(congetion == 5){
									congetion = "혼잡";
								} else if(congetion == 6){
									congetion = "매우혼잡";
								}

								if(stopFlag == 0){
									stopFlag = "운행중";
								} else if(stopFlag == 1){
									stopFlag = "도착";
								}

								var imageSrc = 'http://drive.google.com/uc?export=view&id=1ZsZzIM-_5QnTcSHM1obZGyOh6gqya7p4', // 마커이미지의 주소입니다    
									imageSize = new kakao.maps.Size(35, 35) // 마커이미지의 크기입니다

								// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
									markerPosition = new kakao.maps.LatLng(tmY, tmX); // 마커가 표시될 위치입니다

								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
									position: markerPosition,
									image: markerImage, // 마커이미지 설정
								});
									
								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
								
								// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
								var iwContent = '<div style="padding:5px;width:200px;height:80px;">' + plainNo + '<br>' + '혼잡도 : ' + congetion + '<br>' + 
												'정류소도착여부 : ' + stopFlag + '</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
								});

								// 마커에 마우스오버 이벤트를 등록합니다
								kakao.maps.event.addListener(marker, 'mouseover', function() {
								// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
									infowindow.open(map, marker);
								});

								// 마커에 마우스아웃 이벤트를 등록합니다
								kakao.maps.event.addListener(marker, 'mouseout', function() {
									// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
									infowindow.close();
								});
								
								// 4.995초뒤에 마커삭제
								setTimeout(function(){
									marker.setMap(null);
								}, 4995);
							});
						}
					}
				});

				$.ajax({
					url: 'bus6628.api',
					type: "GET",
					dataType: "text",
					success: function (data) {
						if (data) {
							$(data).find('itemList').each(function () {
								

								var tmX = $(this).find("tmX").text();
								var tmY = $(this).find("tmY").text();
								var plainNo = $(this).find("plainNo").text();
								var congetion = $(this).find("congetion").text();
								var stopFlag = $(this).find("stopFlag").text();
								
								if(congetion == 0){
									congetion = "정보없음";
								} else if(congetion == 3){
									congetion = "여유";
								} else if(congetion == 4){
									congetion = "보통";
								} else if(congetion == 5){
									congetion = "혼잡";
								} else if(congetion == 6){
									congetion = "매우혼잡";
								}

								if(stopFlag == 0){
									stopFlag = "운행중";
								} else if(stopFlag == 1){
									stopFlag = "도착";
								}

								var imageSrc = 'http://drive.google.com/uc?export=view&id=1G2PDkrFJShCBk-qz7xFFw0ljMzE_3d-W', // 마커이미지의 주소입니다    
									imageSize = new kakao.maps.Size(35, 35) // 마커이미지의 크기입니다

								// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
									markerPosition = new kakao.maps.LatLng(tmY, tmX); // 마커가 표시될 위치입니다

								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
									position: markerPosition,
									image: markerImage, // 마커이미지 설정
								});
									
								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
								
								// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
								var iwContent = '<div style="padding:5px;width:200px;height:80px;">' + plainNo + '<br>' + '혼잡도 : ' + congetion + '<br>' + 
												'정류소도착여부 : ' + stopFlag + '</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
								});

								// 마커에 마우스오버 이벤트를 등록합니다
								kakao.maps.event.addListener(marker, 'mouseover', function() {
								// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
									infowindow.open(map, marker);
								});

								// 마커에 마우스아웃 이벤트를 등록합니다
								kakao.maps.event.addListener(marker, 'mouseout', function() {
									// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
									infowindow.close();
								});
								
								// 4.995초뒤에 마커삭제
								setTimeout(function(){
									marker.setMap(null);
								}, 4995);
							});
						}
					}
				});


				
			}


			function bike(){
				var positions = [];
				$.ajax({
					type: "GET",
					url: "http://openapi.seoul.go.kr:8088/6d7657696e6861763739414950794f/json/bikeList/1/1000/",
					data: {},
					success: function(data){
						let bikeList = data["rentBikeStatus"]["row"]
						for(let i = 0; i < bikeList.length; i++){
							let stationName = bikeList[i]["stationName"]
							let parkingBikeTotCnt = bikeList[i]["parkingBikeTotCnt"]
							let stationLatitude = bikeList[i]["stationLatitude"]
							let stationLongitude = bikeList[i]["stationLongitude"]

							positions.push({content:'<div style="padding:5px;width:280px;height:60px;">' + stationName + '<br>' + '거치 대수 : ' + parkingBikeTotCnt + '</div>',
											latlng: new kakao.maps.LatLng(stationLatitude, stationLongitude)}) 
						}
						
						for (var i = 0; i < positions.length; i ++) {

							var imageSrc = 'http://drive.google.com/uc?export=view&id=1btfKJNyY1UEqieXMyEf6PWr-y9VL2Uh6', // 마커이미지의 주소입니다    
									imageSize = new kakao.maps.Size(35, 35) // 마커이미지의 크기입니다

								// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								map: map, // 마커를 표시할 지도
								position: positions[i].latlng, // 마커의 위치
								image: markerImage
							});

							// 마커에 표시할 인포윈도우를 생성합니다 
							var infowindow = new kakao.maps.InfoWindow({
								content: positions[i].content // 인포윈도우에 표시할 내용
							});

							// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
							// 이벤트 리스너로는 클로저를 만들어 등록합니다 
							// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
							kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
							kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
						}

							// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
							function makeOverListener(map, marker, infowindow) {
								return function() {
									infowindow.open(map, marker);
								};
							}

							// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
							function makeOutListener(infowindow) {
								return function() {
									infowindow.close();
								};
							}



					}
				})
			}

							

							





		</script>

	</div>


	<jsp:include page="../common/footer.jsp" />
</body>

</html>