<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 메인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- sweetalter -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>  -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
    /*
        Skydiver : rgb(0,88,155)
        Cloud Dander : rgb(240, 238, 233)
    */
    
    div {
        display: inline-block;
        /* border: solid 1px black; */
    }

    .content {
        background-color:rgb(240, 238, 233);
        padding-left: 20px;
    }

    .seat-area-L {
        padding-right: 100px;
    }
    .seat-area-R {
        padding-bottom: 70px;
    }
    
</style>
<body>

    <h1>Study Room</h1>

    <div class="content">

        <br>
        <div id="seatTable">
            <div id="seat-area-1">
                <div class="seat-area-L">
                    <table id="seatTable1" border="1" style="height: 560px; width: 70px;">
                        <c:forEach var="i" begin="101" end="108">
                        	<tr><td data-row=${ i }></td></tr>
                        </c:forEach>
                    </table>          
                </div><!-- seat-area-L -->
        
                <div class="seat-area-R">
                    <table id="seatTable2" border="1" style="height: 420px; width: 70px;">
                        <c:forEach var="i" begin="109" end="114">
                        	<tr><td data-row=${ i }></td></tr>
                        </c:forEach>
                        
                    </table>            
                </div><!-- seat-area-R -->
            </div><!-- seat-area-1 -->
    
            <div id="seat-area-2">
                <div class="seat-area-L" style="padding-bottom: 70px">
                    <table id="seatTable1" border="1" style="height: 420px; width: 70px;">
                        <c:forEach var="i" begin="115" end="120">
                        	<tr><td data-row=${ i }></td></tr>
                        </c:forEach>
                    </table>          
                </div><!-- seat-area-L -->
        
                <div class="seat-area-R">
                    <table id="seatTable2" border="1" style="height: 420px; width: 70px;">
                        <c:forEach var="i" begin="121" end="126">
                        	<tr><td data-row=${ i }></td></tr>
                        </c:forEach>
                    </table>            
                </div><!-- seat-area-R -->
            </div><!-- seat-area-2 -->
            
            <div id="seat-area-3">
                <div class="seat-area-L" style="padding-bottom: 70px; padding-right: 200px;">
                    <table id="seatTable1" border="1" style="height: 420px; width: 70px;">
                        <c:forEach var="i" begin="127" end="132">
                        	<tr><td data-row=${ i }></td></tr>
                        </c:forEach>
                    </table>          
                </div><!-- seat-area-L -->
            </div><!-- seat-area-3 -->
    
            <script>
                $(function(){
                    $('#seatTable tr').on({'mouseenter' : function(){
                        $(this).children().css('background', 'lightgrey').text('');
                    }, 'mouseout' : function(){
                        $(this).children().css('background', 'rgb(240, 238, 233)').text('');
                    }, 'click' : function(){
                        $('#myModal').modal('show');
                    }});
                })
            </script>
        </div><!-- seatTable -->
        
        
        <!-- The Modal -->
        <!-- <form action="reserveSeat.st" method="post"> -->
            <div class="modal" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title" id="seatNo">
                                <script>
                                    $('td').click(function(event) {
                                        var rNum = $(this).attr('data-row'); // 클릭한 테이블의 번호

                                        var seatNo = document.getElementById('seatNo');
                                        seatNo.innerHTML = rNum + '번 좌석을 선택하셨습니다.';
                                    });
                                    
                                </script>
                            </h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                
                        <!-- Modal body -->
                        <div class="modal-body" id="modal-body">
                            
                            	예약 가능 시간 <br>
                            >> 오늘 날짜 보여주기

                            <!-- 예약 가능한 시간 보여주기. 테이블로? 
                                예약이 된 시간은 표시하기
                                클릭하면 oprion startTime변경 -->
                            <table id="timeTable" border="1" style="width:120px; height:40px">
                                <tr>
                                    <c:forEach var="i" begin="0" end="5">
                                        <td>0${i}:00</td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <c:forEach var="i" begin="6" end="11">
                                        <c:choose>
                                            <c:when test="${ i le 9}">
                                                <td>0${i}:00</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td>${i}:00</td>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <c:forEach var="i" begin="12" end="17">
                                        <td>${i}:00</td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <c:forEach var="i" begin="18" end="23">
                                        <td>${i}:00</td>
                                    </c:forEach>
                                </tr> 
                            </table>

                            <br>

                            <select id="startTime">
                                <c:forEach var="i" begin="0" end="23">
                                    <c:choose>
                                        <c:when test="${ i le 9}">
                                            <option value="${i}">0${i}:00</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${i}">${i}:00</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                            -
                            <select id="endTime">
                                <c:forEach var="i" begin="0" end="23">
                                    <c:choose>
                                        <c:when test="${ i le 9}">
                                            <option value="${i}">0${i}:00</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${i}">${i}:00</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>

                            <button class="btn btn-outline-secondary" onclick="selectTime()">조회</button>

                        </div><!-- Modal body -->

                        <script>
                            function selectTime(){
                                var startTime = $("#startTime option:selected").val();  
                                var endTime = $("#endTime option:selected").val(); 
                                
                                var modalBody = document.getElementById('modal-body');
                                
                                if((endTime-startTime) > 3){
                                    modalBody.innerHTML += '<br> 3시간 이상 예약이 불가';
                                }
                                else if(endTime == startTime || startTime > endTime){
                                    modalBody.innerHTML += '<br> 시간 선택이 잘못되었습니다.';
                                }
                                else{
                                    modalBody.innerHTML += '<br>' + startTime + ' - ' + endTime;
                                }
                            
                            }
                        </script>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="reset" class="btn btn-danger" data-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-primary" onclick="submit()" data-dismiss="modal">확인</button>
                        </div>
                        <script>
                            function submit(){
                                $.ajax({
                                    url : 'reserveSeat.st',
                                    data : {
                                    	startTime : $('#startTime option:selected').val(),
                                		endTime : $('#endTime option:selected').val(),
                                		seatNo : $('#seatNo').text().substr(0,3) //"110 번 좌석을 선택하셨습니다."에서 앞에 3개만 읽기
                                    },
                                    success : function(r){
                                        console.log('성공');
                                        console.log(r);
                                        
                                        let valueSeatNo = r.seatNo + '번 좌석';
                                        let valueStartTime = r.startDate + ':00';
                                        let valueEndTime = r.endDate + ':00';
                                        let valueDate = r.createDate;

                                        swal(valueDate, valueSeatNo + 
                                        	 valueStartTime + ' - ' + valueEndTime + ' 예약되었습니다.', 
                                        	'success');
                                        
                                    }, error : function(){
                                        console.log('안됨');
                                        swal('안됨', '외않되...', 'error');
                                    }
                                })
                            }
                        </script>
                        

                    </div>
                </div>
            </div>
        <!-- </form> -->

        <br>

    </div><!-- content -->
    
</body>
</html>