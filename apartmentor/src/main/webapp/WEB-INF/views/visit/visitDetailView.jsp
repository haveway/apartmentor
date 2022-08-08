<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문 예약 상세페이지</title>
</head>
<body>
<style>
	.visitContent {
		width: 1200px;
		height: 800px;
		margin: auto;
	}

    h1 {
        text-align: left;
        margin-left: 80px;
    }


    .visitDetailContent {
        background-color: #f0eee9;
    }
    
    #visitDetail {
    	margin-left: 100px;
    	
    	
    }
    
    #visitDetail th {
    	width: 100px;
    	text-align: center;
    }

</style>

</head>
<body>

<!-- <jsp:include page="../common/header.jsp"/> -->

<br>
<br>

<div class="visitContent">

	<h1>방문 예약 상세보기</h1>
	

	<br>
	<br>
	
	<div class="visitDetailContent">
	
	<br>
	<br>
	
		<form id="visitDetail" method="post" action="inserStatus.visit">
			<table>
				<tr>
					<th>예약 종류</th>
					<td>&nbsp;&nbsp;</td>
					<td>
						<select name="visitCategory" style="width:70px; height:30px; text-align:center; font-weight:bolder;">
							<option value="전체">전체</option>
							<option value="가스">가스</option>
							<option value="난방">난방</option>
							<option value="소독">소독</option>
							<option value="수도">수도</option>
							<option value="전기">전기</option>
						</select>
					</td>
				</tr>
				<tr style="height: 40px">
					<th>예약 날짜</th>
					<td>&nbsp;&nbsp;</td>
					<td>
						<!-- 더미데이터 -->
						2022-08-05
					</td>
				</tr>
				<tr style="height: 60px">
					<th>예약 시간</th>
					<td>&nbsp;&nbsp;</td>
					<td style="width: 220px">
						<!-- 더미데이터 -->
						09:00
					</td>
					<td>
						<button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#myModal" style="width:100px;">
						  예약 현황
						</button>
					</td>
				</tr>
				<tr>
					<th>참고 사항</th>
					<td>&nbsp;&nbsp;</td>
					<td colspan="6">
						<textarea name="content" rows="20" cols="80" required style="resize:none;" placeholder="참고사항을 입력해주세요">
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="height: 80px; text-align: right;">
						<button type="submit" class="btn btn-info" id="submitBtn">승인</button>
					</td>
					<td colspan="3" style="height: 80px;">
						&nbsp;&nbsp;&nbsp;<button type="reset" class="btn btn-outline-info" id="resetBtn">반려</button>&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
			
			
		</form>
		
	<script>
	$(".btn btn-outline-info").click(function(){
		var data = $(this).data('id');
	    $("#contents.body-contents").val(data);
	    $("#text-contents.body-contents").html(data);
	});
	</script>
	
		<br>
		<br>

	</div>

<br>
<br>

</div>

<br>
<br>

<!-- <jsp:include page="../common/footer.jsp"/> -->

</body>
</html>