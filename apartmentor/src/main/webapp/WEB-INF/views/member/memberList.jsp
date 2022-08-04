<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#memberTable{
		width: 900px;
		margin-top : 200px;
		margin-right: 150px;
		margin-left: 150px;
		text-align: center;
	}
	thead{background-color: #e9ecef}
	tbody{height: 30px}
	th{height: 30px;}
	
	.th1{width: 70px}
	.th2{width: 250px}
	.th3{width: 200px}
	
	.btn1{
		width: 100%;
		margin: auto;
	}
</style>
<jsp:include page="../common/header.jsp"/>
</head>
<body>
	<div class="mainWrap">		
		<table id="memberTable"class="table table-bordered">
			<thead>
				<tr>
					<th class="th1" rowspan="2" >회원번호</th>
					<th class="th2">이름</th>
					<th class="th3">아이디</th>
					<th class="th4">생년월일</th>
					<th class="th5" rowspan="2">승인 / 정지</th>
				</tr>
				<tr>
					<th>세대번호</th>
					<th>번호</th>
					<th>이메일</th>					
				</tr>
			</thead>
			<tbody>
				<tr>
					<th rowspan="2">1</th>
					<th>길동</th>
					<th>user1111</th>
					<th>99911</th>
					<th rowspan="2">
						<button class="btn btn-dark btn1">
							승인
						</button>
					</th>
				</tr>
				<tr>
					<th>1001동1110호</th>
					<th>01044440000</th>
					<th>asdgasdf@asdfasdf.com</th>					
				</tr>
			</tbody>
		</table>
	</div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>