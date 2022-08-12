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

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
</head>
<style>
    /* Skydiver : rgb(0,88,155)	/ Cloud Dander : rgb(240, 238, 233) */
    
    #h1 {
    	font-family: 'NanumSquareExtraBold';
    	width: 1200px;
    	height: 60px;
    	text-align: center;
    	padding: 15px;
    }
/* ---------- 좌석 선택 영역 관련 CSS ---------- */ 
    .content {
    	font-family: 'NanumSquareExtraBold';
    	
        background-color:rgb(240, 238, 233); /* Cloud Dancer */
        box-shadow: 1px 1px 5px lightgrey; /* x y blur color */
        
    	width: 1000px;
    	height: 620px;
        padding: 30px 80px 30px 80px; /* T R B L */
        margin-top: 80px; /* 여백 */
        
        margin-left: 100px;
        /* margin-left: 100px; */ /* left: 33%;로 하게되면 모달화면 띄울 때 반투명검은색 화면이 되어서 클릭이 안됨. 왜? */
    }
    
    #seatTable { /* td값 가운데 정렬 */
    	text-align: center;
    }

    .seat-area-L {
        padding-right: 140px;
        float: left;
    }
    .seat-area-R {
    	padding-top: 70px;
        padding-bottom: 70px;
        float: left;
    }
    
    .tdDiv {
    	height: 70px;
    	width: 70px;
    	border-radius: 15px;
    	background-color: rgb(240, 238, 233);
    	box-shadow: 1px 1px 5px lightgrey; /* x y blur color */
    	border: solid 1px lightgrey;
    }
    
    .tdDiv:hover {
    	background: lightgrey;
    }
    
    #waiting {
    	float: right;
    	margin-top: -550px;
    }
    
    #waiting button {
    	height: 50px;
    	width: 50px;
    	
    	border-radius: 15px;
    }
/* ---------- 모달 관련 CSS ---------- */  
    .ui-timepicker-container { /* Timepicker appears behind the modal */
     	z-index:1151 !important; 
	}
	
	.modal-footer > .btnSkydiver {
		background-color: rgb(0,88,155);
		color: white;
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
	<div id="h1"><h1>Study Room</h1></div>
	
	<c:choose>
	<c:when test="${ !empty loginUser.userId }">
	<div class="content">
		<div id="seatTable">
			<div class="seat-area-L">
				<table id="seatTable1" style="height: 560px; width: 70px;">
					<c:forEach var="i" begin="101" end="108">
						<tr><td id=${ i }><div id="${ i }a" class="tdDiv"><br>${ i }</div></td></tr>
						<c:forEach var="s" items="${ list }">
							<script>
								$.ajax({
									url: 'seatView.st',
									data: {
										seatNo: ${ i },
										//selectSeatNo: ${ s.seatNo }
									},
									type: 'POST',
									success: function(data){
										
										var date = new Date();
										var hours = date.getHours();
										
										if(${s.startDate} <= hours && hours<= ${s.endDate}){
											if(${i} == ${s.seatNo}){
												$('#'+${s.seatNo}).css('height', '70px').css('width', '70px').css('border-radius', '15px');
												$('#'+${s.seatNo}).css('background', 'rgb(0,88,155)').css('color', 'lightgrey').text('이용중');
											}
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
				<table id="seatTable2" style="height: 420px; width: 70px;">
					<c:forEach var="i" begin="109" end="114">
						<tr><td id=${ i }><div class="tdDiv"><br>${ i }</div></td></tr>
					</c:forEach>
				</table>            
			</div><!-- seat-area-R -->
			
			<div class="seat-area-L" style="padding-top: 70px; padding-bottom: 70px">
				<table id="seatTable3" style="height: 420px; width: 70px;">
					<c:forEach var="i" begin="115" end="120">
						<tr><td id=${ i }><div class="tdDiv"><br>${ i }</div></td></tr>
					</c:forEach>
				</table>          
			</div><!-- seat-area-L -->
			
			<div class="seat-area-R">
				<table id="seatTable4" style="height: 420px; width: 70px;">
					<c:forEach var="i" begin="121" end="126">
						<tr><td id=${ i }><div class="tdDiv"><br>${ i }</div></td></tr>
					</c:forEach>			
				</table>            
			</div><!-- seat-area-R -->
			
			<div class="seat-area-L" style="padding-top: 70px; padding-bottom: 70px;">
				<table id="seatTable5" style="height: 420px; width: 70px;">
					<c:forEach var="i" begin="127" end="132">
						<tr><td id=${ i }><div class="tdDiv"><br>${ i }</div></td></tr>
					</c:forEach>
				</table>          
			</div><!-- seat-area-L -->
<!-- 좌석 클릭하면 -->    
            <script>
                $(function(){
                	$('#seatTable tr').on({'click' : function(){
               			$('#myModal').modal('show');
               			var seatNo = $('#seatNo').text().substr(0,3); //클릭한 좌석 번호
               			console.log('클릭한 좌석 번호1 : ' + seatNo);
                   	}
               	});

                   	/* $('td').click(function(event) {
                        var rNum = $(this).attr('id'); // 클릭한 테이블의 번호
                        //console.log('클릭한 좌석 번호2 : ' + rNum);
                    }); */
                });
            </script>
        </div><!-- seatTable -->
<!-- 지금 시간 기준으로 이용중, 이용불가 표시 -->        
        <div id="waiting">
				<table>
					<tr width="50px">
						<td>이용중</td>
						<td><button style="background: rgb(0,88,155);" disabled /></td>
					</tr>
					<tr>
						<td>임박</td>
						<td><button style="background: lightyellow;" disabled /></td>
					</tr>
					<tr>
						<td>이용가능</td>
						<td><button style="background: Cloud Dander : rgb(240, 238, 233);" disabled /></td>
					</tr>
				</table>
			</div>
<!-- 모달 영역 시작 -->        
        <!-- The Modal -->
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
                            <script>
	                            var date = new Date();
	
	                            var year = date.getFullYear();
	                            var month = date.getMonth() + 1;
	                            var day = date.getDate();
	                            
	                            var hours = date.getHours();
	                            var minutes = date.getMinutes();
	                            
	                            //console.log(year + '년 ' + month + '월 ' + day + '일');
	                            //console.log(hours + '시 ' + minutes + '분');
	                            
	                            var currentTime = document.getElementById('modal-body');
	                            currentTime.innerHTML = year + '년 ' + month + '월 ' + day + '일 &nbsp;' + hours + '시 ' + minutes + '분';
                            
	                            /* $('#modal-body').css('text-align', 'center'); */	
	                            
	                            </script>
                            <br><br>
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
														//seatNo: ${ s.seatNo }
													},
													type: 'POST',
													success: function(r){
														//console.log(${s.startDate});
														//console.log(${s.endDate});
														//console.log('#'+${i});
														//console.log('#'+${s.seatNo});
														
														$('td').click(function(event) {
					                                        var rNum = $(this).attr('id'); // 클릭한 테이블의 번호
					                                        
															var hour = new Date().getHours();
															
															if(${i} <= hour){
																for(var i = 0; i <= hour; i++){
																	$('#'+i).css('text-decoration', 'line-through');
																}
															}
					                                        
					                                        // 예약 시작시간과 종료시간 사이일 경우 회색
					                                        if(rNum == ${s.seatNo}){ // 클릭한 좌석 번호 == 예약된 좌석 번호(DB)
					                                        	if(${s.startDate} <= ${i} && ${i} <= ${s.endDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		$('#'+j).css('background', 'grey');
																	}
																}
					                                        }
					                                        else if(rNum != ${s.seatNo}){
					                                        	if(${i} == ${s.startDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		$('#'+j).css('background', 'white');
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
														//seatNo: ${ s.seatNo }
													},
													type: 'POST',
													success: function(r){
														
														$('td').click(function(event) {
					                                        var rNum = $(this).attr('id'); // 클릭한 테이블의 번호
					                                        
					                                        var hour = new Date().getHours();
															
															if(${i} <= hour){
																for(var i = 6; i <= hour; i++){
																	$('#'+i).css('text-decoration', 'line-through');
																}
															}
					                                        
					                                        if(rNum == ${s.seatNo}){ // 클릭한 좌석 번호 == 예약된 좌석 번호(DB)
					                                        	if(${s.startDate} <= ${i} && ${i} <= ${s.endDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		$('#'+j).css('background', 'grey');
																	}
																}
					                                        }
					                                        else if(rNum != ${s.seatNo}){
					                                        	if(${i} == ${s.startDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		$('#'+j).css('background', 'white');
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
														//seatNo: ${ s.seatNo }
													},
													type: 'POST',
													success: function(r){
														
														$('td').click(function(event) {
					                                        var rNum = $(this).attr('id'); // 클릭한 테이블의 번호
					                                        
					                                        var hour = new Date().getHours();
															
															if(${i} <= hour){
																for(var i = 12; i <= hour; i++){
																	$('#'+i).css('text-decoration', 'line-through');
																}
															}
					                                        
					                                        if(rNum == ${s.seatNo}){ // 클릭한 좌석 번호 == 예약된 좌석 번호(DB)
					                                        	if(${s.startDate} <= ${i} && ${i} <= ${s.endDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		$('#'+j).css('background', 'grey');
																	}
																}
					                                        }
					                                        else if(rNum != ${s.seatNo}){
					                                        	if(${i} == ${s.startDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		$('#'+j).css('background', 'white');
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
					                                        
					                                        var hour = new Date().getHours();
															
															if(${i} <= hour){
																for(var i = 18; i <= hour; i++){
																	$('#'+i).css('text-decoration', 'line-through');
																}
															}
					                                        
					                                        if(rNum == ${s.seatNo}){ // 클릭한 좌석 번호 == 예약된 좌석 번호(DB)
					                                        	if(${s.startDate} <= ${i} && ${i} <= ${s.endDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		$('#'+j).css('background', 'grey');
																	}
																}
					                                        }
					                                        else if(rNum != ${s.seatNo}){
					                                        	if(${i} == ${s.startDate}){ // 0~5시 == 예약된 시작 시간(DB)
																	for(var j = ${s.startDate}; j <= ${s.endDate}; j++){
																		$('#'+j).css('background', 'white');
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
                            </table>
<%-- 타임피커 부분 --%>	
                           	<label for="time">시간 선택 <br>
							<input type="text" id="timepickerStartTime" class="inputTime" name="time" placeholder="시간 선택" readonly> -
							<input type="text" id="timepickerEndTime" class="inputTime" name="time" placeholder="시간 선택" readonly>
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
	                        	        dynamic: false,
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
	                        	        dynamic: false,
	                        	        dropdown: true,
	                        	        scrollbar: true    
	                        	    });
	                        	});
	                        	
	                        </script>
<%-- 타임피커 조회 버튼 --%>	                        	
                            <button class="btn btn-outline-secondary" onclick="selectTime()">조회</button>
							
                            <script>
	                            function selectTime(){
	                                var startTime = parseInt($('#timepickerStartTime').val().substr(0,2));  
	                                var endTime = parseInt($('#timepickerEndTime').val().substr(0,2)); 
	                                
	                                var modalBody = document.getElementById('modal-body');
	                                
	                                if((endTime-startTime) > 3){
	                                    modalBody.innerHTML += '<br> 3시간 이상 예약이 불가';
	                                }
	                                else if(endTime == startTime || startTime > endTime){
	                                    modalBody.innerHTML += '<br> 시간 선택이 잘못되었습니다.';
	                                }
	                                else{
	                                    modalBody.innerHTML += '<br>' + startTime + ':00 - ' + endTime + ':00 으로 예약하시겠습니까?';
	                                }
	                                
	                                $.ajax({
	                                	url: 'seatView.st',
	                                	data: {
	                                		startTime : $('#timepickerStartTime').val(),
	                                		endTime : $('timepickerEndTime').val()
	                                	},
	                                	type: 'POST',
	                                	success: function(r){
	                                		//console.log(r);
	                                		//console.log(r.startTime);
	                                		console.log('★☆★☆★☆★☆★☆★')
	                                		
	                                	}, error: function(){
	                                		console.log('♥♡♥♡♥♡♥♡♥♡♥♡♥');
	                                	}
	                                })
	                            }
	                        </script>

                        </div><!-- Modal body -->
<%-- Modal footer --%>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="reset" class="btn btn-outline-secondary" onclick="reload();" data-dismiss="modal">취소</button>
                            <button type="button" class="btn btnSkydiver" onclick="submit()" data-dismiss="modal">확인</button>
                        </div>
                        
                        <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
                        
                        <script>
                        
                        	function reload(){
                        		location.reload();
                        	
                        	}
                        	
                            function submit(){
                                $.ajax({
                                    url : 'reserveSeat.st',
                                    data : {
                                    	startTime : $('#timepickerStartTime').val().substr(0,2), // 04
                                		endTime : $('#timepickerEndTime').val().substr(0,2), // 05
                                		seatNo : $('#seatNo').text().substr(0,3), //"110 번 좌석을 선택하셨습니다."에서 앞에 3개만 읽기
                                		userNo : ${loginUser.userNo},
                                		startDay : $('#modal-body').val()
                                    },
                                    success : function(r){
                                    	console.log(r.userNo);

                                    	/* swal(r.createDate, r.seatNo + '번 좌석' + 
                                        		r.startDate + ' - ' + r.endDate + ' 예약되었습니다.', 
                                        	'success'); */
                                    	
                                    	swal({
                            				title : r.createDate,
                            				text : r.seatNo + '번 좌석' + 
                                    				r.startDate + ' - ' + r.endDate + ' 예약되었습니다.',
                            				icon : 'success',
                            				closeOnClickOutside : false, //알럿창 제외하고 클릭시 창 닫히지 않도록
                            				closeOnEsc : false,
                            				
                            			})
                                    	
                                    	var tdDivColor = '#' + r.seatNo + 'a';
                                        $(tdDivColor).css('background', 'deeppink').css('height', '70').text('♥');
                                        
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
    	</div><!-- content -->
        <br>
   </c:when>
    <c:otherwise>
    	<script>
			swal({
				title : '로그인을 해야 합니다.',
				text : ' ',
				icon : 'warning',
				closeOnClickOutside : false, //알럿창 제외하고 클릭시 창 닫히지 않도록
				closeOnEsc : false,
				buttons : {
					doLogin : {
						text : '로그인',
						value : true,
						className : 'btn'
					}
				}
			}).then((result) => { //value를 result로 받아서 사용
				if(result){
					location.href='login.me';
				}
			})
    	</script>
    </c:otherwise>
	</c:choose>
	
	<%--
		- 좌석 예약 수정
		- 로그인 게정 하나당 3시간까지만 예약 가능. 확인(submit버튼 클릭 시 alert띄우기)
			그럼 2시간 / 1시간은? => 10:00 - 12:00 && 15:00 ~ 16:00
	
	
	 --%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</div>
</body>
</html>