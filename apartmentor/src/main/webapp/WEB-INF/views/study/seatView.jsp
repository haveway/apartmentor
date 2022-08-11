<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 메인</title>
<!-- timepicker 관련 -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script> -->
<!-- jQuery 관련 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- sweetalter 관련 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- cookie 관련 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
</head>
<style>
    /*
        Skydiver : rgb(0,88,155)
        Cloud Dander : rgb(240, 238, 233)
    */
    
    div {
        display: inline-block;
        /* border: solid 1px red; */
    }
    
    .mainWrap {
		/* position: relative; */

        display: flex;
        flex-direction: row;
    }
    
    #h1 {
    	width: 1200px;
    	height: 60px;
    	text-align: center;
    	padding: 15px;
    }
/* ---------- 좌석 선택 영역 관련 CSS ---------- */ 
    .content {
        background-color:rgb(240, 238, 233); /* Cloud Dancer */
        box-shadow: 1px 1px 5px lightgrey; /* x y blur color */
        
    	width: 1000px;
    	height: 620px;
        padding: 30px 100px 30px 100px; /* T R B L */
        margin-top: 80px; /* 여백 */
        
        position: absolute;
        margin-left: 100px; /* left: 33%;로 하게되면 모달화면 띄울 때 반투명검은색 화면이 되어서 클릭이 안됨. 왜? */
		/* transform: translate(-30%, 10%); */
    }
    
    #seatTable { /* td값 가운데 정렬 */
    	text-align: center;
    }

    .seat-area-L {
        padding-right: 140px;
        border: solid 1px green;
    }
    .seat-area-R {
        padding-bottom: 70px;
        border: solid 1px blue;
    }
/* ---------- 모달 관련 CSS ---------- */  
    .ui-timepicker-container { /* Timepicker appears behind the modal */
     	z-index:1151 !important; 
	}
</style>
<body>

	<jsp:include page="../common/header.jsp" />
	
<!-- 부트스트랩 관련 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>  -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<div class="mainWrap">

	<div id="h1">
		<h1>Study Room</h1>
	</div>
	
	<div class="content">
		<div id="seatTable">
			<div class="seat-area-L">
				<table id="seatTable1" border="1" style="height: 560px; width: 70px;">
					<c:forEach var="i" begin="101" end="108">
						<tr><td id=${ i }>${ i }</td></tr>
						<c:forEach var="s" items="${ list }">
							<script>
								$.ajax({
									url: 'seatView.st',
									data: {
										seatNo: ${ i },
										selectSeatNo: ${ s.seatNo }
									},
									type: 'POST',
									success: function(data){
										if(${i} == ${s.seatNo}){
											$('#'+${s.seatNo}).css('background', 'rgb(0,88,155)').text('이용중');
										}
									}, error: function(){
										console.log('tlqkdhodksehlsmsep');
									}
								});
							</script>	
						</c:forEach>
					</c:forEach>
				</table>          
			</div><!-- seat-area-L -->
       
			<div class="seat-area-R">
				<table id="seatTable2" border="1" style="height: 420px; width: 70px;">
					<c:forEach var="i" begin="109" end="114">
						<tr><td id=${ i }></td></tr>
					</c:forEach>
				</table>            
			</div><!-- seat-area-R -->
			
			<div class="seat-area-L" style="padding-bottom: 70px">
				<table id="seatTable3" border="1" style="height: 420px; width: 70px;">
					<c:forEach var="i" begin="115" end="120">
						<tr><td id=${ i }></td></tr>
					</c:forEach>
				</table>          
			</div><!-- seat-area-L -->
			
			<div class="seat-area-R">
				<table id="seatTable4" border="1" style="height: 420px; width: 70px;">
					<c:forEach var="i" begin="121" end="126">
						<tr><td id=${ i }></td></tr>
					</c:forEach>			
				</table>            
			</div><!-- seat-area-R -->
			
			<div class="seat-area-L" style="padding-bottom: 70px;">
				<table id="seatTable5" border="1" style="height: 420px; width: 70px;">
					<c:forEach var="i" begin="127" end="132">
						<tr><td id=${ i }></td></tr>
					</c:forEach>
				</table>          
			</div><!-- seat-area-L -->
<!-- 좌석 클릭 하면 -->    
            <script>
                $(function(){
                	$('#seatTable tr').on({'mouseenter' : function(){
                        $(this).css('background', 'lightgrey');
                    }, 'mouseout' : function(){
                        $(this).css('background', 'rgb(240, 238, 233)');
                    }, 'click' : function(){
                        $('#myModal').modal('show');
                        var seatNo = $('#seatNo').text().substr(0,3); //클릭한 좌석 번호
                        console.log('클릭한 좌석 번호1 : ' + seatNo);
                    }});

                   	$('td').click(function(event) {
                        var rNum = $(this).attr('id'); // 클릭한 테이블의 번호
                        //console.log('클릭한 좌석 번호2 : ' + rNum);
                    });
                });
            </script>
        </div><!-- seatTable -->
        
<!-- 모달 영역 시작 -->        
        <!-- The Modal -->
        <!-- <form action="reserveSeat.st" method="post"> -->
            <div class="modal" id="myModal">
                <div class="modal-dialog modal-dialog-centered"> <!-- modal-dialog-centered 모달창 중앙으로 -->
                    <div class="modal-content">
                
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title" id="seatNo">
                                <script>
                                    $('td').click(function(event) {
                                        var rNum = $(this).attr('id'); // 클릭한 테이블의 번호

                                        var seatNo = document.getElementById('seatNo');
                                        seatNo.innerHTML = rNum + '번 좌석을 선택하셨습니다.';
                                    });
                                </script>
                            </h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                
                        <!-- Modal body -->
                        <div class="modal-body" id="modal-body">
                            
                            	예약 가능 시간  / 오늘 날짜 보여주기
<!-- 예약 가능 시간표 영역 -->
                            <table id="timeTable" class="table table-bordered" style="width:300px; height:40px" align="center">
                                <tr>
                                    <c:forEach var="i" begin="0" end="5">
                                    	<td id=${ i }>0${i}:00</td>
                                    	<c:forEach var="s" items="${ list }">
                                    		<script>
												$.ajax({
													url: 'seatView.st',
													data: {
														startTime: ${ s.startDate },
														endTime: ${ s.endDate },
														seatNo: ${ s.seatNo }
													},
													type: 'POST',
													success: function(r){
														//console.log(${s.startDate});
														//console.log(${s.endDate});
														//console.log('#'+${i});
														//console.log('#'+${s.seatNo});
														
														$('td').click(function(event) {
					                                        var rNum = $(this).attr('id'); // 클릭한 테이블의 번호
					                                        
					                                        if(rNum == ${s.seatNo}){ // 클릭한 좌석 번호 == 예약된 좌석 번호(DB)
					                                        	if(${i} == ${s.startDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		//console.log(j);
																		$('#'+j).css('background', 'grey');
																		console.log('★☆★☆★성공1★☆★☆★');
																	}
																}
					                                        }
					                                        else if(rNum != ${s.seatNo}){
					                                        	if(${i} == ${s.startDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		//console.log(j);
																		$('#'+j).css('background', 'white');
																		console.log('♥♡♥♡♥성공1♥♡♥♡♥');
																	}
																}
					                                        }
					                                    });
													}, error: function(){
														console.log('tlqkdhodksehlsmsep');
													}
												});
											</script>	
                                    	</c:forEach>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <c:forEach var="i" begin="6" end="11">
                                        <c:choose>
                                            <c:when test="${ i le 9}">
                                                <td id=${ i }>0${i}:00</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td id=${ i }>${i}:00</td>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach var="s" items="${ list }">
                                    		<script>
												$.ajax({
													url: 'seatView.st',
													data: {
														startTime: ${ s.startDate },
														endTime: ${ s.endDate },
														seatNo: ${ s.seatNo }
													},
													type: 'POST',
													success: function(r){
														
														$('td').click(function(event) {
					                                        var rNum = $(this).attr('id'); // 클릭한 테이블의 번호
					                                        
					                                        if(rNum == ${s.seatNo}){ // 클릭한 좌석 번호 == 예약된 좌석 번호(DB)
					                                        	if(${i} == ${s.startDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		console.log(j);
																		$('#'+j).css('background', 'grey');
																		console.log('★☆★☆★성공2★☆★☆★');
																	}
																}
					                                        }
					                                        else if(rNum != ${s.seatNo}){
					                                        	if(${i} == ${s.startDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		//console.log(j);
																		$('#'+j).css('background', 'white');
																		console.log('♥♡♥♡♥성공2♥♡♥♡♥');
																	}
																}
					                                        }
					                                    });
													}, error: function(){
														console.log('tlqkdhodksehlsmsep');
													}
												});
											</script>	
                                    	</c:forEach>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <c:forEach var="i" begin="12" end="17">
                                        <td id=${ i }>${i}:00</td>
                                        <c:forEach var="s" items="${ list }">
                                    		<script>
												$.ajax({
													url: 'seatView.st',
													data: {
														startTime: ${ s.startDate },
														endTime: ${ s.endDate },
														seatNo: ${ s.seatNo }
													},
													type: 'POST',
													success: function(r){
														
														$('td').click(function(event) {
					                                        var rNum = $(this).attr('id'); // 클릭한 테이블의 번호
					                                        
					                                        if(rNum == ${s.seatNo}){ // 클릭한 좌석 번호 == 예약된 좌석 번호(DB)
					                                        	if(${i} == ${s.startDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		console.log(j);
																		$('#'+j).css('background', 'grey');
																		console.log('★☆★☆★성공3★☆★☆★');
																	}
																}
					                                        }
					                                        else if(rNum != ${s.seatNo}){
					                                        	if(${i} == ${s.startDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		//console.log(j);
																		$('#'+j).css('background', 'white');
																		console.log('♥♡♥♡♥성공3♥♡♥♡♥');
																	}
																}
					                                        }
					                                    });
													}, error: function(){
														console.log('tlqkdhodksehlsmsep');
													}
												});
											</script>	
                                    	</c:forEach>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <c:forEach var="i" begin="18" end="23">
                                        <td id=${ i }>${i}:00</td>
                                    </c:forEach>
                                </tr> 
                            </table>
<%-- 타임피커 부분 --%>	
                            <label for="time">시간 선택 <br>
								<input type="text" id="timepickerStartTime" name="time" placeholder="시간 선택" readonly> -
								<input type="text" id="timepickerEndTime" name="time" placeholder="시간 선택" readonly>
                            </label>
                            
                            <script type="text/javascript">
	                        	$(function() {
	                        	    $('#timepickerStartTime').timepicker({
	                        	    	timeFormat: 'HH:mm p',
	                        	        interval: 60,
	                        	        minTime: '00',
	                        	        maxTime: '23:00',
	                        	        defaultTime: '00',
	                        	        startTime: '00:00',
	                        	        dynamic: true,
	                        	        dropdown: true,
	                        	        scrollbar: true    
	                        	    });
	                        	    
	                        	    $('#timepickerEndTime').timepicker({
	                        	    	timeFormat: 'HH:mm p',
	                        	        interval: 60,
	                        	        minTime: '00',
	                        	        maxTime: '23:00',
	                        	        defaultTime: '00',
	                        	        startTime: '00:00',
	                        	        dynamic: true,
	                        	        dropdown: true,
	                        	        scrollbar: true    
	                        	    });
	                        	});
	                        	
	                        </script>
	                        	
                            <button class="btn btn-outline-secondary" onclick="selectTime()">조회</button>
                            
                            <script>
	                            function selectTime(){
	                                /* var startTime = $('timepickerStartTime').val();  
	                                var endTime = $('timepickerEndTime').val(); 
	                                
	                                console.log(startTime);
	                                
	                                var modalBody = document.getElementById('modal-body');
	                                
	                                if((endTime-startTime) > 3){
	                                    modalBody.innerHTML += '<br> 3시간 이상 예약이 불가';
	                                }
	                                else if(endTime == startTime || startTime > endTime){
	                                    modalBody.innerHTML += '<br> 시간 선택이 잘못되었습니다.';
	                                }
	                                else{
	                                    modalBody.innerHTML += '<br>' + startTime + ' - ' + endTime;
	                                } */
	                                
	                                $.ajax({
	                                	url: 'seatView.st',
	                                	data: {
	                                		startTime : $('timepickerStartTime').val(),
	                                		endTime : $('timepickerEndTime').val()
	                                	},
	                                	type: 'POST',
	                                	success: function(r){
	                                		console.log(r);
	                                		console.log(r.startTime);
	                                		
	                                		
	                                	}, error: function(){
	                                		console.log('♥♡♥♡♥♡♥♡♥♡♥♡♥');
	                                	}
	                                })
	                            }
	                        </script>

                        </div><!-- Modal body -->

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="reset" class="btn btn-danger" data-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-primary" onclick="submit()" data-dismiss="modal">확인</button>
                        </div>
                        
                        <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
                        
                        <script>
                            function submit(){
                                $.ajax({
                                    url : 'reserveSeat.st',
                                    data : {
                                    	startTime : $("#timepickerStartTime").val().substr(0,2), // 04
                                		endTime : $("#timepickerEndTime").val().substr(0,2), // 05
                                		seatNo : $('#seatNo').text().substr(0,3) //"110 번 좌석을 선택하셨습니다."에서 앞에 3개만 읽기
                                    },
                                    success : function(r){
                                        console.log('성공');
                                        console.log(r);
                                        
                                        seatNo = r.seatNo;

                                        let valueSeatNo = r.seatNo + '번 좌석';
                                        let valueStartTime = r.startDate;
                                        let valueEndTime = r.endDate;
                                        let valueDate = r.createDate;
                                        
                                        swal(valueDate, valueSeatNo + 
                                        	 valueStartTime + ' - ' + valueEndTime + ' 예약되었습니다.', 
                                        	'success');
            	                        
            	                        var td = 'td#' + r.seatNo;
                                        $(td).css('background', 'black').css('height', '70');
                                        $('#seatTable tr').off('mouseenter').off('mouseout').off('click');
                                        
                                        //console.log(r.seatNo);
                                        //console.log(td)
                                        
                                    }, error : function(){
                                        console.log('안됨');
                                        swal('안됨', '외않되...', 'error');
                                    }
                                })
                            }
                            
                        </script>
                    </div><!-- modal-content -->
                </div><!-- modal-dialog -->
            </div>
        <br>
    </div><!-- content -->
</div><!-- mainWrap -->    

</body>
</html>