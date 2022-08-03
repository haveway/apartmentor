<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문 예약 페이지</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
    h1 {
        text-align: left;
        margin-left: 40px;
    }


    .content {
        background-color: #f0eee9;
    }
    
    #enrollForm {
    	margin-left: 40px;
    	
    	
    }
    
    #enrollForm th {
    	width: 100px;
    	text-align: center;
    }
    
    #btn {
    	width: 80px;
    	height: 40px;
    }

</style>

</head>
<body>

<h1>방문 예약하기</h1>

<div style="margin-left:40px;">
예약 승인 시, 이메일로 일정을 보내 드립니다.<br>
예약 시간은 10분 단위로만 가능합니다.
</div>


<br>

<div class="content">
	<br>

	<form id="enrollForm" method="post" action="">
		<table>
			<tr>
				<th>예약 종류</th>
				<td>&nbsp;&nbsp;</td>
				<td>
					<select name="visitCategory" style="width:70px; height:30px; text-align:center; font-weight:bolder;">
						<option value="가스">가스</option>
						<option value="난방">난방</option>
						<option value="소독">소독</option>
						<option value="수도">수도</option>
						<option value="전기">전기</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>예약 시간</th>
				<td>&nbsp;&nbsp;</td>
				<td>
					<input id="date" type="datetime-local" name="visitStartDate" />
				</td>
				<td>&nbsp;~&nbsp;</td>
				<td>
					<input type="datetime-local" name="visitEndDate" />
				</td>
				<td>&nbsp;</td>
				<td>
					<button id="btn">예약 현황</button>
				</td>
			</tr>
		</table>
	</form>
	
	<!--
	생각해볼 것 :
	input date 타입으로 보낸 값을 어떻게 date 받는 지.. ? 
	어떻게 뭘 어떻게 해야할지?????? 
	
	해야할 것 :
	화면 구현 마저 일단 해보고
	예약 현황 클릭하면 날짜 예약한 거 보여줘야할 것같은데
	진짜 아무런 생각이 1도 없고요 
	 -->

    

</div>


</body>
</html>