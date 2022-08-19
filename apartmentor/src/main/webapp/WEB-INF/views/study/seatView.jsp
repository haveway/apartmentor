<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 메인</title>
<!-- 제발 무사히 푸쉬 되어주길... -->
<!-- timepicker 관련 -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script> -->
<!-- jQuery 관련 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- sweetalter 관련 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
    /* Skydiver : rgb(0,88,155)	/ Cloud Dander : rgb(240, 238, 233) */
    
    #h1 {
    	width: 1200px;
    	height: 60px;
    	text-align: center;
    	padding: 15px;
    }
    .h1Btn {
    	border: none;
    	background-color: white;
    	font-size: 50px;
    }
    .h1Btn:hover {
    	color: rgb(0,88,155);
    	font-weight: 1000;
    }
/* ---------- 좌석 선택 영역 관련 CSS ---------- */ 
    .content {
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
	
	.mySeat button { /* 모달 내부 타임테이블 예약 가능 자리 */
		height: 20px;
		width: 45px;
		
		border-radius: 5px;
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
	<div id="h1">
		<button class="h1Btn" onclick="showMyStudyInfo();">STUDY ROOM</button>
	</div>
	<script>
		function showMyStudyInfo(){
			$('#myStudyInfo').modal('show');
		}
		
		function hideModal(){
			$('#myStudyInfo').modal('hide'); // 예약 정보
			$('#myModal').modal('hide'); // 예약 
			$('#updateModal').modal('hide'); // 예약 수정
		}
	</script>
	
<!-- 예약정보 조회 모달 : The Modal -->
	<div class="modal" id="myStudyInfo">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
	
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"><c:if test="${!empty loginUser}">${loginUser.userName}님의 독서실 예약 정보</c:if></h4>
					<button type="button" class="close" data-dismiss="modal" onclick="hideModal();">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body" id="myStudyInfo-body">
					
					<c:forEach var="s" items="${ list }">
						<script>
							if(${s.userNo} == ${loginUser.userNo}){
								var modalBody = document.getElementById('myStudyInfo-body');

								modalBody.innerHTML = '${s.createDate}' + ' ' + ${s.startDate} + ':00 - ' + ${s.endDate} + ':00 '
								+ ${s.seatNo} + '번';
							}
						</script>
		
					</c:forEach>
					
					<!-- <button id="updateBtn" style="height: 25px; border-radius:5px; border: none; background: lightgrey;" onclick="updateReserve();">예약변경</button>  -->                                   
					
					
					<c:forEach var="s" items="${ list }">
						<c:if test="${ !empty s.seatNo}">
							<button id="deleteBtn" style="height: 25px; border-radius:5px; border: none; background: lightgrey;" onclick="deleteReserve();">예약취소</button>                                    
						</c:if>
					</c:forEach>
				</div>
				<script>
					/* function updateReserve(){
						$('#myStudyInfo').modal('hide');
						$('#updateModal').modal('show');
						
						$.ajax({
							url: 'updateReserve.st',
							data: {
								userNo: ${loginUser.userNo}
							},
							success: function(){
								console.log('꺄홋');
							}, error: function(){
								console.log('에효 니가 안되는 건 내 잘못이겠지');
							}
						})
					} */
					
					function deleteReserve(){
						$.ajax({
							url: 'deleteReserve.st',
							data: {
								userNo: ${loginUser.userNo}
							},
							success: function(){
								console.log('삭제되어줘ㅠㅠ ');
								swal('예약이 취소되었습니다',' ','success');
								$('#myStudyInfo').modal('hide');
							}, error: function(){
								console.log('에효 니가 안되는 건 내 잘못이겠지');
							}
						})

					}
				</script>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal" onclick="hideModal();">닫기</button>
				</div>
		
			</div><!-- modal-content -->
		</div>
	</div><!-- modal -->
	
<!-- 예약 취소 모달 : The Modal -->
	<div class="modal" id="deleteModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
	
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"><c:if test="${!empty loginUser}">${loginUser.userName}님 예약한 자리를 취소하시겠습니까?</c:if></h4>
					<button type="button" class="close" data-dismiss="modal" onclick="hideModal();">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body" id="deleteModal-body">
					
					<c:forEach var="s" items="${ list }">
						<script>
							if(${loginUser.userNo} == ${s.seatNo}){
								
							}

						</script>
					</c:forEach>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal" onclick="hideModal();">닫기</button>
				</div>
		
			</div><!-- modal-content -->
		</div>
	</div><!-- 예약취소 modal -->


	<c:choose>
	<c:when test="${ !empty loginUser.userId }">
	<div class="content">
		<div id="seatTable">
			<div class="seat-area-L">
				<table id="seatTable1" style="height: 560px; width: 70px;">
					<c:forEach var="i" begin="101" end="108">
						<tr><td id=${ i }><div id="${ i }a" class="tdDiv"><br>${ i }</div></td></tr>
						<c:forEach var="s" items="${ list }">
							<script type="text/javascript">
								function markSeat(){
									$.ajax({
										url: 'seatView.st',
										data: {},
										type: 'POST',
										success: function(data){
											
											var date = new Date();
				                            var hours = date.getHours();
				                            
				                            if(${s.startDate} <= hours && hours < ${s.endDate}){ // 현재시간이 예약시작시간이랑 종료시간 사이일 경우
				                            	$('#'+${s.seatNo}).css('height', '70px').css('width', '70px').css('border-radius', '15px');
				                            
				                            	if(${loginUser.userNo} == ${s.userNo}){ //내가 예약
													$('#'+${s.seatNo}).css('background', 'rgb(245, 223, 77)').css('color', 'black').text('이용중');
													$('#'+${s.seatNo}).css('box-shadow', '1px 1px 5px lightgrey');
												}
												else{ // 다른 사람이 예약
													$('#'+${s.seatNo}).css('background', 'darkgrey').css('color', 'black').text('이용중');
													$('#'+${s.seatNo}).css('box-shadow', '1px 1px 5px lightgrey');
												}
				                            
				                            } else {
				                            	if(${loginUser.userNo} == ${s.userNo}){ // 로그인한회원번호 == 예약회원번호
				                            		if(${s.seatNo} == ${i}){
				                            			$('#'+${i}+'a').css('height', '70px').css('width', '70px').css('border-radius', '15px').text('내가 예약한 좌석');                    
														$('#'+${i}+'a').css('box-shadow', '1px 1px 5px lightgrey').css('border', 'solid 1px lightgrey');
				                            		}
												}
				                            }
										}, error: function(){
											console.log('tlqkdhodksehlsmsep');
										}
									});
								}
								
								markSeat();
							</script>
						</c:forEach>
					</c:forEach>
				</table>          
			</div><!-- seat-area-L -->
       
			<div class="seat-area-R">
				<table id="seatTable2" style="height: 420px; width: 70px;">
					<c:forEach var="i" begin="109" end="114">
						<tr><td id=${ i }><div id="${ i }a" class="tdDiv"><br>${ i }</div></td></tr>
						<c:forEach var="s" items="${ list }">
							<script>markSeat();</script>
						</c:forEach>
					</c:forEach>
				</table>            
			</div><!-- seat-area-R -->
			
			<div class="seat-area-L" style="padding-top: 70px; padding-bottom: 70px">
				<table id="seatTable3" style="height: 420px; width: 70px;">
					<c:forEach var="i" begin="115" end="120">
						<tr><td id=${ i }><div id="${ i }a" class="tdDiv"><br>${ i }</div></td></tr>
						<c:forEach var="s" items="${ list }">
							<script>markSeat();</script>
						</c:forEach>
					</c:forEach>
				</table>          
			</div><!-- seat-area-L -->
			
			<div class="seat-area-R">
				<table id="seatTable4" style="height: 420px; width: 70px;">
					<c:forEach var="i" begin="121" end="126">
						<tr><td id=${ i }><div id="${ i }a" class="tdDiv"><br>${ i }</div></td></tr>
						<c:forEach var="s" items="${ list }">
							<script>markSeat();</script>
						</c:forEach>
					</c:forEach>			
				</table>            
			</div><!-- seat-area-R -->
			
			<div class="seat-area-L" style="padding-top: 70px; padding-bottom: 70px;">
				<table id="seatTable5" style="height: 420px; width: 70px;">
					<c:forEach var="i" begin="127" end="132">
						<tr><td id=${ i }><div id="${ i }a" class="tdDiv"><br>${ i }</div></td></tr>
						<c:forEach var="s" items="${ list }">
							<script>markSeat();</script>
						</c:forEach>
					</c:forEach>
				</table>          
			</div><!-- seat-area-L -->
			
<!-- 좌석 클릭 show 모달 -->    
            <script>
                $(function(){
                	$('#seatTable tr').on({'click' : function(){
               			$('#myModal').modal('show');
               			console.log('클릭한 좌석 번호1 : ' + ($('#seatNo').text().substr(0,3)));
                   	}})
               	});
            </script>
        </div><!-- seatTable -->
        
<%-- 지금 시간 기준으로 이용중, 이용불가 표시 --%>        
        <div id="waiting">
			<table>
				<tr width="50px">
					<td>이용중</td>
					<td><button style="background: darkgrey;" disabled /></td>
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
<!-- 모달  시작 -->        
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
                            <button type="button" class="close" onclick="hideModal();">&times;</button>
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
	                            
	                            var currentTime = document.getElementById('modal-body');
	                            currentTime.innerHTML = year + '년 ' + month + '월 ' + day + '일 &nbsp;' + hours + '시 ' + minutes + '분';
                            
	                            /* $('#modal-body').css('text-align', 'center'); */	
	                            </script>

	                            <div class="mySeat">
	                            	<table>
	                            		<tr>
	                            			<td>예약중</td>
	                            			<td><button style="background: grey;" disabled /></td>
	                            			<td>♡MY♡</td>
	                            			<td><button style="background: rgb(245, 223, 77);" disabled /></td>
	                            		</tr>
	                            	</table>
	                            </div>
<!-- 예약 가능 시간표 영역 -->
                            <table id="timeTable" class="table table-bordered" style="width:300px; height:40px" align="center">
                                <tr>
                                    <c:forEach var="i" begin="0" end="5">
                                    	<td id=${ i }>0${i}:00</td>
                                    	<c:forEach var="s" items="${ list }">
                                    		<script>
	                                    		function timeTable(){
	                                    			$('td').click(function(event) {
				                                        var clickNo = $(this).attr('id'); // 클릭한 테이블의 번호
				                                        
				                                        var date = new Date();
							                            var year = date.getFullYear();
							                            var month = date.getMonth() + 1;
							                            var day = date.getDate();
							                            var hours = date.getHours();
							                            
							                            if(month < 10){var today = year+'-'+'0'+month+'-'+ day;}
							                            else{		   var today = year+'-'+month+'-'+ day;}
														
														if(${i} <= hours){ // i : 0,1,2,3,4,5
															for(var i = 0; i <= hours; i++){
																$('#'+i).css('text-decoration', 'line-through');
															}
														}
														
														if(clickNo == ${s.seatNo}){ 
															for(var j = ${s.startDate}; j < ${s.endDate}; j++){
																if(${loginUser.userNo} == ${s.userNo}){
																	$('#'+j).css('background', 'rgb(245,223,77)');
																}else{
																	$('#'+j).css('background', 'grey');
																}
															}
														}else if(clickNo != ${s.seatNo}){
															for(var j = ${s.startDate}; j < ${s.endDate}; j++){
																$('#'+j).css('background', 'white');
															}
														}
				                                    });
	                                    		}	
                                    			timeTable();
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
												timeTable();
											</script>	
                                    	</c:forEach>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <c:forEach var="i" begin="12" end="17">
                                        <td id=${ i }>${i}:00</td>
                                        <c:forEach var="s" items="${ list }">
                                    		<script>
												timeTable();
											</script>
                                    	</c:forEach>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <c:forEach var="i" begin="18" end="23">
                                        <td id=${ i }>${i}:00</td>
                                        <c:forEach var="s" items="${ list }">
                                    		<script>
												timeTable();
											</script>	
                                    	</c:forEach>
                                    </c:forEach>
                                </tr> 
                            </table>
<%-- 타임피커 부분 --%>	
                           	<label for="time">시간 선택 <br>
							<input type="text" id="timepickerStartTime" class="time" placeholder="시간 선택" readonly> -
							<input type="text" id="timepickerEndTime" class="time" placeholder="시간 선택" readonly>
                            </label>
                            
                            <script type="text/javascript">
                            
	                            $(function() {
	                            	
	                            	var date = new Date();
	                            	var hours = date.getHours();
	                            	
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
	                        	    
	                        	    /* $('#timepickerEndTime').click(function(event){

	                            		var tpStartTime = $('#timepickerStartTime').val();
	                            		var tpStartHour = parseInt($('#timepickerStartTime').val().substr(0,2));
	                            		console.log(tpStartHour);
	                            		
	                            		$('#timepickerEndTime').timepicker({
		                        	    	timeFormat: 'HH:mm p',
		                        	        interval: 60,
		                        	        minTime: '00',
		                        	        defaultTime: tpStartTime,
		                        	        startTime: tpStartTime,
		                        	        maxHour: tpStartHour + 3,
		                        	        dynamic: false,
		                        	        dropdown: true,
		                        	        scrollbar: true    
		                        	    });
	                            	}) */
	                        	});
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
                            	var startTime = parseInt($('#timepickerStartTime').val().substr(0,2));  
                                var endTime = parseInt($('#timepickerEndTime').val().substr(0,2)); 
                                
                                console.log(startTime);
                                console.log(endTime);
                                
                                <%-- 현재 시간부터 예약 가능, 이전 시간 선택시 예약 불가 알럿 --%>
                                var date = new Date();
	                            var hours = date.getHours();
                                
                                if((hours > startTime) || // 지금시간 > 선택한 시간
                                   (startTime > endTime) || // 시작시간 > 종료시간
                                   ((endTime - startTime) > 3) || // 3시간이상 예약 불가
                                   (startTime == endTime) // 시작시간 == 종료시간
                                ){ 
                                	swal('시간 선택 다시 해~','똑바로 읽어도 거꾸로 읽어도 우영우','warning');
                                	$('#timepickerStartTime').val(''); // input값 초기화
                                	$('#timepickerEndTime').val('');
                                	
                                }else{
                                	$.ajax({
                                        url : 'reserveSeat.st',
                                        data : {
                                        	startTime : $('#timepickerStartTime').val().substr(0,2), // 04
                                    		endTime : $('#timepickerEndTime').val().substr(0,2), // 05
                                    		seatNo : $('#seatNo').text().substr(0,3), //"110 번 좌석을 선택하셨습니다."에서 앞에 3개만 읽기
                                    		userNo : ${loginUser.userNo},
                                    		loginUserNo : ${loginUser.userNo},
                                    		startDay : $('#modal-body').val()
                                        },
                                        success : function(r){
       	                                	swal({
                                   				title : r.createDate,
                                   				text : r.seatNo + '번 좌석' + r.startDate + ' - ' + r.endDate + ' 예약되었습니다.',
                                   				icon : 'success',
                                   				closeOnClickOutside : false, //알럿창 제외하고 클릭시 창 닫히지 않도록
                                   				closeOnEsc : false,
                                   			})
                                           	
                                           	var tdDivColor = '#' + r.seatNo + 'a';
                                               $(tdDivColor).css('background', 'deeppink').css('height', '70').text('♥너가 예약한 자리♥');
                                               
                                               //location.reload();
                                               $('#myModal').modal('hide');
                                            
                                        }, error : function(){
                                            console.log('안됨');
                                            swal('안됨', '외않되...', 'error');
                                        }
                                    })
                                }
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
<%-- 오늘 날짜가 아니면 상태 컬럼 N으로 변경 --%>
	<script>
	    var date = new Date();
	    var year = date.getFullYear();
	    var month = date.getMonth() + 1;
	    var day = date.getDate();
	   
	    if(month < 10){
        	var today = year+'-'+'0'+month+'-'+ day;
        }
        else{
        	var today = year+'-'+month+'-'+ day;
        }
	    
	    $.ajax({
	    	url: 'updateStatus.st',
	    	data: {
	    		today: today
	    	},
	    	success: function(data){
	    		console.log(today);
	    	}, error: function(){
	    		console.log('니가 안되는 건 내 잘못이겠지');
	    	}
	    })
	</script>
	
	<%--
	
		완 - 모달 내부 타임테이블 css 수정
		
		완 - 예약 정보 진입 버튼 => 헤더에 달아놓을까? 도전~! => 개같이 실패... 그래서 Study Room로고를 버튼으로 만들기!
		
		완 - Study Room 버튼이 버튼처럼 보이게 하기. 누르고 싶게 만들기 => hover주기?
		
		- DB가 비어 있으면 아예 표시를 안하는 것에 대해서? 나만 모른척하면 아무도 모를 거 같기는 한데
		
		- 좌석 예약 수정
		
		- 로그인 계정 하나당 3시간까지만 예약 가능. 확인(submit버튼 클릭 시 alert띄우기)
			그럼 2시간 / 1시간은? => 10:00 - 12:00 && 15:00 ~ 16:00
			내가 2시간을 먼저 예약하면 2를 DB에 저장하고
			귀찮은데... 수정 기능 만들고 다시 돌아올게
			
		완 - 모달 타임피커에서 시간 선택을 잘못하면 바로 다시 예약할 수 있도록? 어떠케...?
		
		어쩔티비 - 모달 타임피커 시작시간 클릭 시 종료시간 드롭다운 설정 - 뭔가 되긴 했는데 왜 선택한 시간 이전 시간이 다 뜨는지..?
		
		완 - 내가 예약한 좌석
		완 - 예약종료시간이 되지 않았을 경우 '내가 예약한 좌석'임을 표시 하고 
		완 - 내가 예약한 시간은 회색 말고 노란색으로 표시
		완 - 예약한 시간이 지났을 경우 다시 좌석 번호로 표시
		완 -  내가 예약한 좌석이면 노란색 이용중 다른사람은 파란색 이용중
		
		완 - 하루가 지나면 상태 'N'으로 변경 / 날짜가 오늘이 아니면?
		
		완 - 내가 예약한 자리인데 시작 시간 전이면 예약한 자리임을 표시
		
		
		
		
		
		
	 --%>
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</div>
</body>
</html>