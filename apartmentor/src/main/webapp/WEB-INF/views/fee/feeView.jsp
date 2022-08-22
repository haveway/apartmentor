<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리비 조회</title>
<!-- 제발 무사히 푸쉬 되어주길... -->
<style>
	.accordion-item {
		background-color: pink;
	}
</style>
<!-- w3school chart관련 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<!-- chart.js 관련 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="mainWrap">
	<div id="chartArea" align="center">
		<br><h2>관리비 조회</h2><br>
		<canvas id="myChart" style="width:100%;max-width:800px"></canvas>
		<script>
			const data = {
				labels: ['4월', '5월', '6월', '7월'],
				datasets: [{
					label: '2022년',
					data: [178000, 184000, 189000, 187000],
					backgroundColor: 'rgb(0,88,155)',
					borderColor: 'rgb(0,88,155)',
					borderWidth: 1,
					tension: 0.1
				}]
			};

			const config = {
				type: 'line',
				data,
				options: {
					scales: {
						y: {
							beginAtZero: false
						}
					}
				}
			};

			const myChart = new Chart(
				document.getElementById('myChart'),
				config
			);
   
			function clickHandler(click){
				const points = myChart.getElementsAtEventForMode(click, 'nearest', {
				intersect : true}, true);
				
				if(points[0]){
					const dataset = points[0].datasetIndex;
					const index = points[0].index;
   		
					//console.log(myChart.data.labels[index]); // 4월
					//console.log(myChart.data.datasets[0].data[index]); // 178200
					//console.log(myChart.data.datasets[0].label); // 2022년

			   		document.getElementById('viewArea').innerHTML = '<table class="table">'
						
																   + '<tr rowspan="2">'
																   + '<td>'
																   + '납부금액'
																   + '</td>'
																   + '<td>'
																   + '</td>'
																   + '</tr>'
									
																   + '<tr>'
																   + '<td>'
																   +  myChart.data.datasets[0].label + ' ' + myChart.data.labels[index]
																   + '</td>'
																   + '<td>'
																   +  myChart.data.datasets[0].data[index] + '원'
																   + '</td>'	
																   + '</tr>'
									
																   + '</table>';
			   	}
   			}
   
			myChart.canvas.onclick = clickHandler;
		</script>
		<br><br>
		<div class="accordion" id="accordionPanelsStayOpenExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="panelsStayOpen-headingOne">
					<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
						상세조회
					</button>
				</h2><br>
				<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
					<div class="accordion-body" id="viewArea">
						<!-- <h2>니가 안나오는 건 내 잘못이겠지..고멘..</h2> -->
					</div>
				</div><!-- panelsStayOpen-collapseOne -->
			</div><!-- accordion-item -->
		</div><!-- accordionPanelsStayOpenExample -->
		
	</div><!-- chartArea -->
</div><!-- mainWrap -->


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>