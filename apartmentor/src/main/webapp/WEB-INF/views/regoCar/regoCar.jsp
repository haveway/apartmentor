<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량등록</title>
<style>
    .content{
        background-color: rgb(240, 238, 233);
		color: black;
		width: 1200px;
		margin: auto;
		margin-top: 30px;
    }
    
    .regoCar-title{
    	padding-left: 19em;
    }
     
    .regoCar-title2{
    	display : flex;
		flex-direction: row;
    	padding-left: 19em;
    }
    .regoCar-title2>h6{
    	padding-top: 15px;
    	padding-left: 1em;
    }
    
     #regoCar-phone{
		padding-left: 3em;
	}
    
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="content">
	
		<br><br><br>
		
		<h1 align="center">${ loginUser.getAptNo() }</h1>
		
		<br><br><br>
		
		<div class="regoCar-title">
			<h2>주차차량 등록</h2>
		</div>
		
		<br>
		
		<div align="center">
			<label>차량번호 : <input id="carNo" name="carNo" type="text" placeholder="ex)123가1234"></label>
			<label id="regoCar-phone">연락처 : <input id="carPhone" name="carPhone" type="text" placeholder="ex)010-1234-5678"></label>
			<label><button onclick="regoCar();">등록하기</button></label>
		</div>
		
		<br><br>
		
		<div class="regoCar-title2">
			<h2>주차등록현황</h2><h6>(3대 이상부터 1대당 5만원의 관리비가 부가됩니다.)</h6>
		</div>
		
		<div style="margin:auto; width:700px;">
		<table class="table table-hover" align="center">
			<thead>
				<tr style="width: 70px; height: 30px; text-align: center; font-weight: bolder;">
					<th>No.</th>
					<th>차량번호</th>
					<th>연락처</th>
					<th>승인현황</th>
				</tr>
			</thead>
			<tbody>
				
			</tbody>
		</table>
		</div>
		











		<script>
			function regoCar(){
				if($("#carNo").val() == "" || $("#carPhone").val() == ""){
					swal({
						title : "차량번호랑, 연락처를 적어주세요!",
					    	icon  : "error",
					    	closeOnClickOutside : false
					})
				}
				else{
					$.ajax({
						url : "insertRegoCar.rg",
						data : {
							carNo : $("#carNo").val(),
							carPhone : $("#carPhone").val(),
							userNo : ${ loginUser.getUserNo()}
						},
						success : function(){
	 						swal({
								title : "등록이 완료 되었습니다. 관리자에게 승인요청하겠습니다.",
							    	icon  : "success",
							    	closeOnClickOutside : false
							})
						},
						error : function(){
	 						swal({
								title : "오류입니다. 관리자에게 문의하세요",
							    	icon  : "error",
							    	closeOnClickOutside : false
							})
						}
						
						
						
						
					})
				}
					
					
				
				
			}
		</script>



	<br><br><br><br><br><br>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>