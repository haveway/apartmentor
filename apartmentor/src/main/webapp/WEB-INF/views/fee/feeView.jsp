<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리비 조회</title>
<!-- chart.js 관련 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="mainWrap">
	<canvas id="myChart" style="width:100%;max-width:600px"></canvas>
	
	<script>
	var xValues = [50,60,70,80,90,100,110,120,130,140,150];
	var yValues = [7,8,8,9,9,9,10,11,14,14,15];
	
	new Chart("myChart", {
	  type: "line",
	  data: {
	    labels: xValues,
	    datasets: [{
	      fill: false,
	      lineTension: 0,
	      backgroundColor: "rgba(0,0,255,1.0)",
	      borderColor: "rgba(0,0,255,0.1)",
	      data: yValues
	    }]
	  },
	  options: {
	    legend: {display: false},
	    scales: {
	      yAxes: [{ticks: {min: 6, max:16}}],
	    }
	  }
	});
	</script>
</div>



</body>
</html>