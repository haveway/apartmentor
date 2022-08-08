<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체육시설 예약</title>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<style>
    .content{
        background-color: rgb(240, 238, 233);
		color: black;
		width: 1200px;
		margin: auto;
		margin-top: 30px;
    }
    
   	.btn-div a{
		margin: 0 90px;
	}
	
	.reserve_miniGym{
		text-align: center;
		font-size: 22px;
		width: 300px;
		height: 50px;
	}

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<div class="content">
	
		<div>사진 1, 사진2</div>
	
		<br>
		
		<div class="btn-div">
			<a href="golf.sp" class="query btn btn-lg btn-secondary">실내 골프 연습장</a>
			<a href="miniGym.sp" class="btn btn-lg btn-outline-secondary">미니 GYM</a>
			<a href="" class="btn btn-lg btn-outline-secondary">이용내역</a>
		</div>
		
		<br><br>
			<div align="center" style="width: 1200px; height: 80px; border: 2px solid pink; padding: 10px;">
				<label>예약 날짜 <input class="reserve_miniGym" id="datepicker" name="date" type="text" placeholder="날짜 선택"></label>
				<label>예약 시간 <input class="reserve_miniGym" id="timepicker" name="time" type="text" placeholder="시간 선택"></label>
				<label><button class="btn btn-primary" id="btn">검색하기</button></label>
			</div>
		<br><br>
		
		
		<table id="golf_seat" class="table" align="center">
			<thead>
				<tr>
					<th colspan="5">
						<h1 align="center">실내 골프 연습장 좌석 안내</h1><br>
					</th>
				</tr>
			</thead>
			<tbody>
		
			</tbody>
		</table>
		
		
		
		
		
		
		



<br><br><br><br><br><br><br><br><br>
	</div>

	
    <script>
    
    	//$(function(){
    		// 댓글조회하는 기능을 호출
    		//selectReplyList();
    	//})
    	
    	// 날짜와 시간을 조회하는 버튼 기능 
    	window.onload = function(){
    		var btn = document.getElementById("btn");
    		btn.addEventListener("click",function(){
    		
    			$.ajax({
    				
    				url : "golfSeatList.sp",
    				data : {
    					startDay : $("#datepicker").val(),
    					startDate : $("#timepicker").val()
    					
    				},
 					success : function(){
 						let value = '';
    					value += 
    				'<tr>'
    					+ '<td align="center">'
    					+ '<img src="https://cdn.golfmagazinekorea.com/news/photo/202108/2530_3998_403.jpg" alt="" width="100%" height="200">'
    					+ '1번자리</td>'
    					+ '<td align="center">'
    					+ '<img src="https://cdn.golfmagazinekorea.com/news/photo/202108/2530_3998_403.jpg" alt="" width="100%" height="200">'
    					+ '2번자리</td>'
    					+ '<td align="center">'
    					+ '<img src="https://cdn.golfmagazinekorea.com/news/photo/202108/2530_3998_403.jpg" alt="" width="100%" height="200">'
    					+ '3번자리</td>'
    					+ '<td align="center">'
    					+ '<img src="https://cdn.golfmagazinekorea.com/news/photo/202108/2530_3998_403.jpg" alt="" width="100%" height="200">'
    					+ '4번자리</td>'
    					+ '<td align="center">'
    					+ '<img src="https://cdn.golfmagazinekorea.com/news/photo/202108/2530_3998_403.jpg" alt="" width="100%" height="200">'
    					+ '5번자리</td>'
    					
   				 + '</tr>'
					+ '<tr>'
						+ '<td align="center">'
							+ '<a class="btn btn-lg btn-outline-secondary" data-value="1">예약하기</a>'
						+ '</td>'
						+ '<td align="center">'
							+ '<a class="btn btn-lg btn-outline-secondary" data-value="2">예약하기</a>'
						+ '</td>'
						+ '<td align="center">'
							+ '<a class="btn btn-lg btn-outline-secondary" data-value="3">예약하기</a>'
						+ '</td>'
						+ '<td align="center">'
							+ '<a class="btn btn-lg btn-outline-secondary" data-value="4">예약하기</a>'
						+ '</td>'
						+ '<td align="center">'
							+ '<a class="btn btn-lg btn-outline-secondary" data-value="5">예약하기</a>'
						+'</td>'
					+ '</tr>';	
							   
 				$('#golf_seat tbody').html(value);
 					},
 					error : function(){
 						console.log("좌석을 다시 입력해주세요.")
 					}
    			})
    			
    			
    		})
    		
    	}
    	
    	//function selectReplyList(){
    		
    		//$.ajax({

    			//url : 'rlist.bo', // 전체조회가 아님! 게시글에 딸린 댓글만 조회해야한다(현재 게시글 번호만 넘겨야한다.)
    			//data : {bno : ${ b.boardNo }},
    			//success : function(list){
    				
    			//	let value = '';
    			//	for(let i in list){
    			//		value += '<tr>'
				//			   + '<td>' + list[i].replyWriter + '</td>'
				//			   + '<td>' + list[i].replyContent + '</td>'
				//			   + '<td>' + list[i].createDate + '</td>'
				//			   + '</tr>'
    			//	}
    			//	$('#replyArea tbody').html(value);
    			//	$('#rcount').text(list.length);
    			
    			//},
    			//error : function(){
    			//	console.log('실패');
    			//}
    			
    			
    			
    			
    		//})
    	//}
    </script>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	<script type="text/javascript">
	  $( function() {
	    $( "#datepicker" ).datepicker({
	    	  buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
	    	  changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
	    	  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
	    	  minDate: '-0y', // 현재날짜로부터 100년이전까지 년을 표시한다.
	    	  nextText: '다음 달', // next 아이콘의 툴팁.
	    	  prevText: '이전 달', // prev 아이콘의 툴팁.
	    	  numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
	    	  stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
	    	  yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
	    	  showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
	    	  currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
	    	  closeText: '닫기',  // 닫기 버튼 패널
	    	  dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
	    	  showAnim: "slide", //애니메이션을 적용한다.
	    	  showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
	    	  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
	    	  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
	    });
	  });
	
	
	
	
	
	$(function() {
	    $('#timepicker').timepicker({
		    timeFormat: 'HH:mm',
		    interval: 120,
		    minTime: '10',
		    maxTime: '18',
		    startTime: '10',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true    
	    });
	});
	</script>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>



<jsp:include page="../common/footer.jsp" />
</body>
</html>