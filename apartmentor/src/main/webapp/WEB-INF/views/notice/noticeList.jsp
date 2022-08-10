<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap 라이브러리 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>

.noticeContent {
	width: 1200px;
	height: 800px;
	margin: auto;
}

h1 {
    text-align: left;
    margin-left: 80px;
}

#noticeList {
	width: 800px;
}

#noticeList th, td {
	text-align: center;
}

#noticeList th:nth-child(1) {
	width: 100px;
}

#noticeList th:nth-child(2) {
	width: 120px;
}

#noticeList th:nth-child(3) {
	width: 120px;
}

#noticeList th:nth-child(4) {
	width: 150px;
}


#noticeList>tbody>tr:hover {
	cursor: pointer;
}

#pagingArea {
	width: fit-content;
	margin: auto;
}
</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>



<br>
<br>

<div class="noticeContent">

	<h1>공지사항</h1>
	
	<br>
	<br>

	<table id="noticeList" class="table table-hover" align="center" >
		<thead>
			<tr>
				<th>
					<select name="noticeCategory" id="noticeCategory" style="width: 70px; height: 30px; text-align: center; font-weight: bolder;">
						<option value="전체">[전체]</option>
						<option value="공지">[공지]</option>
						<option value="행사">[행사]</option>
						<option value="알림">[알림]</option>
					</select>
				</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>게시일</th>
				</tr>
		</thead>
		<tbody>
			<!-- 더미 데이터 -->
			<tr>
				<td>[공지]</td>
				<td>가스 검침 일정 안내</td>
				<td>관리자</td>
				<td>13</td>
				<td>2022-08-10</td>
			</tr>
			<tr>
				<td>[행사]</td>
				<td>지니어스 아파트 벼룩시장 행사 안내</td>
				<td>관리자</td>
				<td>13</td>
				<td>2022-08-10</td>
			</tr>
			<tr>
				<td>[알림]</td>
				<td>아파트 앞 화단 담배꽁초 민원 결과</td>
				<td>관리자</td>
				<td>13</td>
				<td>2022-08-10</td>
			</tr>
		</tbody>
	</table>


</body>
</html>