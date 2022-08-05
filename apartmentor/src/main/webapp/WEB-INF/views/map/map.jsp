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

	<script>

	</script>

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
				loadBus();
				setInterval(loadBus, 10000);
			})
			


			function loadBus() {
				$.ajax({
					url: 'bus640.api',
					type: "GET",
					dataType: "text",
					success: function (data) {
						console.log(data);
						if (data) {
							$(data).find('itemList').each(function () {
								

								var tmX = $(this).find("tmX").text();
								var tmY = $(this).find("tmY").text();
								var plainNo = $(this).find("plainNo").text();
								var congetion = $(this).find("congetion").text();
								
								if(congetion == 0){
									congetion = "없음";
								} else if(congetion == 3){
									congetion = "여유";
								} else if(congetion == 4){
									congetion = "보통";
								} else if(congetion == 5){
									congetion = "혼잡";
								} else if(congetion == 6){
									congetion = "매우혼잡";
								}

								var imageSrc = 'http://drive.google.com/uc?export=view&id=1ZsZzIM-_5QnTcSHM1obZGyOh6gqya7p4', // 마커이미지의 주소입니다    
									imageSize = new kakao.maps.Size(40, 42), // 마커이미지의 크기입니다
									imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

								// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
									markerPosition = new kakao.maps.LatLng(tmY, tmX); // 마커가 표시될 위치입니다

								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
									position: markerPosition,
									image: markerImage, // 마커이미지 설정
									clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
								});
									
								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
								
								// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
								var iwContent = '<div style="padding:5px;height:auto;">' + plainNo + '<br>' + '혼잡도:' + congetion + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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
								}, 9995);
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