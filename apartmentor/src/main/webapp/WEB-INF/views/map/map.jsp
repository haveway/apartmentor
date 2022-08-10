<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>우리아파트 주변지도</title>
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
				pharm()
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
									clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
								});
									
								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
								
								// 인포윈도우를 생성합니다
								var iwContent = '<div style="padding:5px;width:200px;height:80px;">' + plainNo + '<br>' + '혼잡도 : ' + congetion + '<br>' + 
												'정류소도착여부 : ' + stopFlag + '</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
									iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
									removable : iwRemoveable
								});

								// 마커에 클릭이벤트를 등록합니다
							kakao.maps.event.addListener(marker, 'click', function() {
								// 마커 위에 인포윈도우를 표시합니다
								infowindow.open(map, marker);  
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
									clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
								});
									
								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
								
								// 인포윈도우를 생성합니다
								var iwContent = '<div style="padding:5px;width:200px;height:80px;">' + plainNo + '<br>' + '혼잡도 : ' + congetion + '<br>' + 
												'정류소도착여부 : ' + stopFlag + '</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
									iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
									removable : iwRemoveable
								});

								// 마커에 클릭이벤트를 등록합니다
							kakao.maps.event.addListener(marker, 'click', function() {
								// 마커 위에 인포윈도우를 표시합니다
								infowindow.open(map, marker);  
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
						var bikeList = data["rentBikeStatus"]["row"]
						for(var i = 0; i < bikeList.length; i++){
							var stationName = bikeList[i]["stationName"]
							var parkingBikeTotCnt = bikeList[i]["parkingBikeTotCnt"]
							var stationLatitude = bikeList[i]["stationLatitude"]
							var stationLongitude = bikeList[i]["stationLongitude"]

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
								image: markerImage,
								clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
							});

							// 마커에 표시할 인포윈도우를 생성합니다 
							var infowindow = new kakao.maps.InfoWindow({
								content: positions[i].content, // 인포윈도우에 표시할 내용
								removable: true
							});

							// 이벤트 리스너로는 클로저를 만들어 등록합니다 
							// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
							kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
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

			function pharm(){
				
				var today = new Date();
				var locdate = [];
				var yyyymmdd = getFullToday();
				var currTime = today.getHours().toString() + today.getMinutes().toString();
				var yoil = today.getDay();
			
				
				function getFullToday(){
									var date = new Date();
									var year = date.getFullYear();
									var month = ("0" + (1 + date.getMonth())).slice(-2);
									var day = ("0" + date.getDate()).slice(-2);

									return year + month + day;
								}
				
					$.ajax({
						type: "GET",
						url: "https://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?serviceKey=3vbFSNBucTjUmlz76x3t%2FXHUxbPw4FBSuJfqY2xhH5n6sriEAxlGGP%2Fdqlhf2FiOxzA4PbMcX7GpGC%2FowflUrQ%3D%3D&numOfRows=100&_type=json&solYear=" + today.getFullYear(),
						data: {},
						success : function (data){
							var restDayList = data["response"]["body"]["items"]["item"]
							for(var i = 0; i < restDayList.length; i++){
								locdate.push(restDayList[i]["locdate"]);
							}

							for(var i = 0; i < locdate.length; i++){
									if(locdate[i] == yyyymmdd){
									yoil = 8;
									}
							}
						}
					})
				

				$.ajax({
					type: "GET",
					url: "https://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire?serviceKey=3vbFSNBucTjUmlz76x3t%2FXHUxbPw4FBSuJfqY2xhH5n6sriEAxlGGP%2Fdqlhf2FiOxzA4PbMcX7GpGC%2FowflUrQ%3D%3D&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EC%96%91%EC%B2%9C%EA%B5%AC&ORD=NAME&pageNo=1&numOfRows=300",
					data: "text",
					success: function (data) {
						if (data) {
							$(data).find('item').each(function () {
								var tmY = $(this).find("wgs84Lat").text();
								var tmX = $(this).find("wgs84Lon").text();
								var dutyName = $(this).find("dutyName").text();
								var dutyTel1 = $(this).find("dutyTel1").text();
								var dutyAddr = $(this).find("dutyAddr").text();
								var dutyTime1c = $(this).find("dutyTime1c").text();
								var dutyTime1s = $(this).find("dutyTime1s").text();
								var dutyTime2c = $(this).find("dutyTime2c").text();
								var dutyTime2s = $(this).find("dutyTime2s").text();
								var dutyTime3c = $(this).find("dutyTime3c").text();
								var dutyTime3s = $(this).find("dutyTime3s").text();
								var dutyTime4c = $(this).find("dutyTime4c").text();
								var dutyTime4s = $(this).find("dutyTime4s").text();
								var dutyTime5c = $(this).find("dutyTime5s").text();
								var dutyTime5s = $(this).find("dutyTime5s").text();
								var dutyTime6c = $(this).find("dutyTime3s").text();
								var dutyTime6s = $(this).find("dutyTime6s").text();
								
								var dutyTime7c;
								if($(this).find("dutyTime7c").text() !== ""){
									dutyTime7c = $(this).find("dutyTime7c").text();
								} else {
									dutyTime7c = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
								}

								var dutyTime7s;
								if($(this).find("dutyTime7s").text() !== ""){
									var dutyTime7s = $(this).find("dutyTime7s").text();
								} else {
									dutyTime7s = "휴무";
								}

								var dutyTime8c;
								if($(this).find("dutyTime8c").text() !== ""){
									var dutyTime8c = $(this).find("dutyTime8c").text();
								} else {
									dutyTime8c = "";
								}

								var dutyTime8s;
								if($(this).find("dutyTime8s").text() !== ""){
									var dutyTime8s = $(this).find("dutyTime8s").text();
								} else {
									dutyTime8s = "휴무";
								}

								for(var i = 1; i < 9; i++){
									if(yoil == i){
										if(eval('dutyTime' + i + 's') < currTime && currTime < eval('dutyTime' + i + 'c')){
											var imageSrc = 'http://drive.google.com/uc?export=view&id=1zzt3UCNDqkjVbE2JggHTj9qk4Y6MPGn6', // 마커이미지의 주소입니다    
											imageSize = new kakao.maps.Size(35, 35) // 마커이미지의 크기입니다
										} else {
											var imageSrc = 'http://drive.google.com/uc?export=view&id=1Ppck2GSKy6W8wHI3psyN46GDoEzigrot', // 마커이미지의 주소입니다    
											imageSize = new kakao.maps.Size(35, 35) // 마커이미지의 크기입니다
										}
									}	
								}

								// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
									markerPosition = new kakao.maps.LatLng(tmY, tmX); // 마커가 표시될 위치입니다

								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
									position: markerPosition,
									image: markerImage, // 마커이미지 설정
									clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
								});
									
								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
								
								// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
								var iwContent = '<div style="padding:5px;width:400px;"><b>' + dutyName + '</b><br>' 
											  + '대표전화 : ' + dutyTel1 + '<br>'
											  + '주소 : ' + dutyAddr + '<br><hr>'
											  + '<b>월요일 : </b>' + dutyTime1s + ' ~ ' + dutyTime1c
											  + '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;화요일 : </b>' + dutyTime2s + ' ~ ' + dutyTime2c + '<br>'
											  + '<b>수요일 : </b>' + dutyTime3s + ' ~ ' + dutyTime3c
											  + '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목요일 : </b>' + dutyTime4s + ' ~ ' + dutyTime4c + '<br>'
											  + '<b>금요일 : </b>' + dutyTime5s + ' ~ ' + dutyTime5c
											  + '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;토요일 : </b>' + dutyTime6s + ' ~ ' + dutyTime6c + '<br>'
											  + '<b>일요일 : </b>' + dutyTime7s + ' ~ ' + dutyTime7c
											  + '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공휴일 : </b>' + dutyTime8s + ' ~ ' + dutyTime8c + '</div>'

								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
									removable : true
								});

								// 마커에 마우스오버 이벤트를 등록합니다
								kakao.maps.event.addListener(marker, 'click', function() {
								// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
									infowindow.open(map, marker);
								});


							});
						}
					}
				});
			}






		</script>

	</div>


	<jsp:include page="../common/footer.jsp" />
</body>

</html>