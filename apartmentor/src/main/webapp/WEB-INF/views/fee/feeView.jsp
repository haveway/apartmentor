<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리비 조회</title>
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
		<br><br>
		<div class="accordion" id="accordionExample">
		
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						관리비 조회
					</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<br>
						<canvas id="myChart" style="width:100%;max-width:800px"></canvas>
						<script>
							var ctx = document.getElementById('myChart').getContext('2d');
							var myChart = new Chart(ctx, {
							    type: 'line',
							    data: {
							        labels: ['5월', '6월', '7월'],
							        datasets: [{
							            label: '오늘은 우요일!',
							            data: [65, 59, 80],
							            fill: false,
							            borderColor: 'rgb(0,88,155)',
							            tension: 0.1,
							            pointHoverBackgroundColor: 'rgb(245, 223, 77)',
							          }]
							    },
							    options: {
							        scales: {
							            y: {
							                beginAtZero: false
							            }
							        },
							        onClick: function(point, event) {
							            if(event.length <= 0) return;
							            
							            document.getElementById('viewArea').innerHTML = '<table class="table">'
												
												   + '<tr rowspan="2">'
												   + '<td>'
												   + '관리비내역'
												   + '</td>'
												   + '<td>'
												   + '</td>'
												   + '</tr>'
	
												   + '<tr>'
												   + '<td>'
												   + '2022년 7월'
												   + '</td>'
												   + '<td>'
												   + '320,110원'
												   + '</td>'	
												   + '</tr>'
	
												   + '</table>';
															   
							            /* document.getElementById('viewArea').innerHTML = '<table class="table">'
				
																					   + '<tr rowspan="2">'
																					   + '<td>'
																					   + '관리비내역'
																					   + '</td>'
																					   + '<td>'
																					   + '</td>'
																					   + '</tr>'
				
																					   + '<tr>'
																					   + '<td>'
																					   + '2022년 7월'
																					   + '</td>'
																					   + '<td>'
																					   + '320,110원'
																					   + '</td>'	
																					   + '</tr>'
				
																					   + '</table>';	 */				
											
							        },
							    }
							});
							
							//console.log(myChart.data.labels[0]);
							//console.log(myChart.data.datasets[0].label);// 오늘은 우요일
							
							var month = myChart.data.labels[0];
							
							//month.onclick = function
				
							
							
						</script>
						<br>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						상세조회
					</button>
				</h2>
				<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					<br>
					<div class="accordion-body" id="viewArea">
						
					</div>
				</div>
			</div>
		
		</div><!-- accordionExample -->
		
		
		
		
		
		
	</div><!-- chartArea -->
</div><!-- mainWrap -->





















<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>