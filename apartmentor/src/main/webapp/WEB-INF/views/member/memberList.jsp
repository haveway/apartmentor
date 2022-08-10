<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content-area{
		width:1200px;
		height:800px;
		margin: auto;
	}
	#memberTable{
		width: 800px;
		margin:auto;
		text-align: center;
	}
	thead tr{background-color: #e9ecef}
	tbody tr{height: 30px}
	th{height: 20px;}
	td{height: 20px;}
	
	.th1{width: 100px}
	.th2{width: 190px}
	.th3{width: 190px}
	.th4{width: 200px}
	.th5{width: 120px}
	
	.btn1{
		width: 100%;
		height:100%;
		margin: auto;
		
	}
	table {
	align-content: center;
	align-items: center;
	align-self: center;
	}
	.height50{height: 40%}
	.b1{font-size: 20px}

</style>
<jsp:include page="../common/header.jsp"/>
</head>
<body>
	<br><br>
	<div align="center" style="margin-right:632px;">
			<h1>회원 관리</h1> 
	</div>
	<br>
	<div class="mainWrap">		
		<table id="memberTable"class="table table-bordered">
			<thead>
				<tr>
					<th class="th1" rowspan="2"><p class="height50">회원번호</p></th>
					<th class="th2">이름</th>
					<th class="th3">아이디</th>
					<th class="th4">생년월일</th>
					<th class="th5" rowspan="2"><p class="height50">승인 / 정지</p></th>			
				</tr>
				<tr>
					<th>세대번호</th>
					<th>번호</th>
					<th>이메일</th>		
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${empty mList}">
					<tr> 
						<th colspan="5">등록된 회원이 없습니다! </th>
					</tr> 
				</c:when>
				<c:otherwise>
					<c:forEach var="m" items="${mList}">
						<tr>
							<td rowspan="2"><br>${m.userNo}</td>
							<td>${m.userName}</td>
							<td>${m.userId}</td>
							<td>${m.birthday}</td>
							<td rowspan="2">
								<c:choose>
									<c:when test="${m.status eq 'W'}">
										<button class="btn btn-dark btn1">
											<b class="b1">승인</b>
										</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-dark btn1">
											<b class="b1">정지</b>
										</button>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>${m.aptNo}</td>
							<td>${m.phone}</td>
							<td>${m.email}</td>					
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>	
			</tbody>
		</table>
	</div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>