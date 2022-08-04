<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문 예약</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap 라이브러리 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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


    .visitEnrollContent {
        background-color: #f0eee9;
    }
    
    #visitEnrollForm {
    	margin-left: 100px;
    	
    	
    }
    
    #visitEnrollForm th {
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

	<h1>방문 예약하기</h1>
	
	<div style="margin-left:80px;">
	예약 승인 시, 이메일로 일정을 보내 드립니다.<br>
	예약은 09:00부터 18:00까지, 10분 단위로만 예약 가능합니다.
	</div>

	<br>
	<br>
	
	<div class="visitEnrollContent">
	
	<br>
	<br>
	
		<form id="visitEnrollForm" method="post" action="insert.visit">
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
				<tr style="height: 60px">
					<th>예약 시간</th>
					<td>&nbsp;&nbsp;</td>
					<td>
						<input id="date" type="datetime-local" name="visitStartDate" required />
					</td>
					<td>~&nbsp;&nbsp;&nbsp;</td>
					<td>
						<input type="datetime-local" name="visitEndDate" required />
					</td>
					<td>&nbsp;</td>
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
						<button type="submit" class="btn btn-info" id="submitBtn">등록</button>
					</td>
					<td colspan="3" style="height: 80px;">
						&nbsp;&nbsp;&nbsp;<button type="reset" class="btn btn-outline-info" id="resetBtn">초기화</button>&nbsp;&nbsp;&nbsp;
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
		
	<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">예약 현황</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      
	       	1동 (유저.aptNo.sustring(2) ?) 의 예약 현황입니다<br>
	       	아래 시간을 피해 예약해주세요.<br>
	       	<br>
	       	8월26일 1시 10분 ~ 1시 20분<br>
	       	8월27일 9시 00분 ~ 9시 10분
	       	<br>
	       	<br>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-info" data-dismiss="modal">닫기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
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