<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>메인</title>
    <style>
        #imgSlide{
            width: 1200px;
            height: 400px;
        }
        div[id^=content]{
            width: 500px;
            height: 300px;
        }
        div[id^=contentWrap]{
            width: 1200px;
            height: 300px;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }
        #calendar{
            width: 1200px;
            height: 300px;
        }
        .table{
        text-align: center;
        font-size: 12px;
        }
        .a1 {
        	margin-top: 3px;
        	margin-right: 5px;
        	float: right;
        	padding: 5px;
        	font-weight: bold;
        }
        .a1 a {
            text-decoration: none;
        	color: gray; 
        }
        .a1 a:hover {
            text-decoration: none;
            color:rgb(0,88,155);
        }
        .td1{ width: 100px}
        .td2{ width: 300px}
        .td3{ width: 100px}
        .title{
        	float: left; 
        	text-align:center;
        	margin-left: 5px; 
        	margin-top: 3px;
        	font-size: 25px;
        }
        #boardTr:hover, #noticeTr:hover{
        cursor:pointer;
        background-color: #E2E2E2;
        }
        #content1, #content3{margin-right: 35px;}
        #content2, #content4{margin-left: 35px;}
        

	    .mainImg{
	        width : 1200px; 
	        height : 400px;     
	    }
	    #weather0{
	    	color: gray; 
	    	padding:5px;
	    	padding-left: 67%}
	    #weather1{
	    	font-size:50px; 
	    	font-weight: bold;
	    	padding: 15px;
	    	padding-right: 27%;
	    	padding-left: 33%;
	    }
	    .weatherImg1{
	    	height: 50px;
	    	text-align: center;
	    }
	    #weather2{
	    display: flex;
	    flex-direction: row;}
	    #weather2 div{
	    	height: 100px;
	    	width: 33.33%;
	    	padding: 5px;
	    	text-align: center;
	    	font-size: 20px;
	    }
	    #weather2 img {
	    	width: 20px;
	    	height: 20px;
	    }
	    #weather2_1{
	    	float: left;
	    }
	    #weather2_2{
	    	border-left: 2px gray solid; 
	    	border-right: 2px gray solid;
		}
		#weather2_3{
			float: right;
		}
		
		#weather3{
			margin-top: 40px;
			float: right;
		}
        
    </style>    
</head>
<jsp:include page="common/header.jsp"/>
<body>
    <div class="mainWrap">
        <div class="mainImg">
	        <img class="mainImg" src="./resources/img/main/aptm2.jpg">
    	</div>

        <hr>

        <div id="contentWrap1">
            <div id="content1">
            	<div class="title">
            	공지사항
            	</div>
            	<div class="a1">
            	<a href="list.notice">더보기 + </a>
            	</div>
	           	<table class="table">
	           		<tr>
	           			<th>카테고리</th>
	           			<th>제목</th>
	           			<th>게시일</th>
	           		</tr>
	           		<c:choose>
	           			<c:when test="${empty nList}">
	           				<tr>
	           					<td colspan="3">게시물이 존재하지 않습니다!</td>
	           				</tr>
	           			</c:when>
	           			<c:otherwise>
	           				<c:forEach var="n" items="${nList}" begin="0" end="4">
			           			<tr onclick="location.href='#'" class="td" id="noticeTr">
			           				<td class="td1">${n.noticeCategoryValue}</td>
			           				<td class="td2">${n.noticeTitle}</td>
			           				<td class="td3">${n.createDate}</td>
			           			</tr>
		           			</c:forEach>
	           			</c:otherwise>
	           		</c:choose>
	           	</table>
            </div>
            <div id="content2" onload="weather()">            	
            </div>
        </div>
        <script>
        $(function(){
            weather();
         })
        function weather() {
        	let today = new Date();

        	let year = today.getFullYear();
        	let month = ('0' + (today.getMonth() + 1)).slice(-2);
        	let day = ('0' + today.getDate()).slice(-2);

        	let dateString = year +  month  + day;

        	let hours = ('0' + today.getHours()).slice(-2); 
        	let minutes = ('0' + today.getMinutes()).slice(-2);

        	let timeString = hours +  minutes ;

        	$.ajax({
        		type:"get",
        		url:"https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=Cxg6AeR%2BimSFoU9%2BWZ6JAPNCCMlkuC5%2FLqSiaCg7a5w7ra6MXu%2B2sg6ijMvlcGoNTbQLkKTlMvW7LmzJ41GJIA%3D%3D&pageNo=1&numOfRows=10"
        			+"&dataType=json"
        			+"&nx=55&ny=127"
        			+"&base_date=" + dateString 
        			+"&base_time=" + timeString,
        		data :{},
        		success:function(data){
        			/* console.log(data); */
        			const itemArr = data.response.body.items.item;
        			let date1 = itemArr[1].baseDate;
        			let time1 = itemArr[1].baseTime;
        			let date2 = date1.substr(4, 2);
        			let date3 = date1.substr(6, 2);
        			let time2 = time1.substr(0, 2);
        			
        			let REH = itemArr[1].obsrValue;
        			let RN1 = itemArr[2].obsrValue;
        			let T1H = itemArr[3].obsrValue;
        			let WSD = itemArr[7].obsrValue;
					let value = "";
        			value += '<div id="weather0" class="a1">'
        					  	+ date2 + "월" + date3 + "일 " + time2 + ":00 기준 "
        				   + '</div>'
           				   + '<div id="weather1">'
           				   		+ T1H + "℃" + '<img class="weatherImg1" src="./resources/img/main/high_Temperature.png">'
           				   + '</div>'
           				   + '<div id="weather2">'
	           				   + '<div id="weather2_1">'
		           			  		+ '<img src="./resources/img/main/humidity.png">' + '습도'
		           			   + '<br><br>'
		           			   		+ REH + "%"
	           				   + '</div>'
	           				   + '<div id="weather2_2">'
	           				   		+ '<img src="./resources/img/main/wind.png">' + '풍속'
	           				   + '<br><br>'
	           				   		+ WSD + "m/s"
	           			       + '</div>'
	           			       + '<div id="weather2_3">'
	           				   		+ '<img src="./resources/img/main/raindrops.png">' + '1시간 강수량'
	           				   + '<br><br>'
	           				   		+ RN1 + "mm"
	           				   + '</div>'
           			       + '</div>'
           			       + '<div id="weather3" class="a1">'
           				   		+ '<a href="https://www.weather.go.kr/w/index.do" target="_blank">기상청 바로가기</a>'
           				   + '</div>';
           				$('#content2').html(value);
        		},
				error:{}	        			
        	})
		}
        </script>
        <br>
        <div id="contentWrap2">
            <div id="content3">
	        	<div class="title">
	            	자유 게시판
	           	</div>
	           	<div class="a1">
            		<a href="list.bo">더보기 + </a>
            	</div>
	           	<table class="table">
	           		<tr>
	           			<th>카테고리</th>
	           			<th>제목</th>
	           			<th>게시일</th>
	           		</tr>
	           		<c:choose>
	           			<c:when test="${empty bList}">
	           				<tr>
	           					<td colspan="3">게시물이 존재하지 않습니다!</td>
	           				</tr>
	           			</c:when>
	           			<c:otherwise>
	           				<c:forEach var="b" items="${bList}" begin="0" end="4">
			           			<tr onclick="location.href='detail.bo?bno=${b.boardNo}'" class="td" id="boardTr">
			           				<td class="td1">${b.boardCategory}</td>
			           				<td class="td2">${b.boardTitle}</td>
			           				<td class="td3">${fn:substring(b.createDate,0,10)}</td>
			           			</tr>
		           			</c:forEach>
	           			</c:otherwise>
	           		</c:choose>
	           	</table>
            </div>
            <div id="content4">
                
                <form action="visit.car" method="post">
                    <input type="hidden" name="userNo" value="${loginUser.userNo}">
                    <h4>방문차량등록</h4>
                    <table>
                        <tr>
                            <td>방문일</td>
                            <td><input type="date" id="carDate" name="carDate" min=""><br></td>
                        </tr>
                        <tr>
                            <td>차량번호</td>
                            <td><input type="text" name="carNo" placeholder="ex)12가5678"></td>
                        </tr>
                        <tr>
                            <td>방문 목적</td>
                            <td><input type="text" name="carPurpose" placeholder="ex)친척 방문"></td>
                            <input type="hidden" name="carCategory" value="2">
                        </tr>
                        <tr>
                            <td>비상 연락처</td>
                            <td><input type="text" name="carPhone" placeholder="ex)010-1234-5678"></td>
                        </tr>
                    </table>
                    <button type="submit">방문 예약 등록</button>
                    <script>
                    $('#carDate').click(function(){
                        var date = new Date();
                        var year = date.getFullYear();
                        var month = ("0" + (1 + date.getMonth())).slice(-2);
                        var day = ("0" + date.getDate()).slice(-2);

                        var today =  year + '-' + month  + '-' + day;
                        $('#carDate').attr('min', today);
                    })  // 방문일 선택시 오늘날짜를 기준으로 이전날짜는 선택불가
                    </script>

                </form>
            </div>
        </div>
		<br>
        <div id="calendar">
  			<a href="list.notice">임시</a>
        </div>
    </div>
    
    
    

</body>
<jsp:include page="common/footer.jsp"/>
</html>