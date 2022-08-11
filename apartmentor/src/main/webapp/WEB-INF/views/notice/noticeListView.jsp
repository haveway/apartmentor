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

#search {
	text-align: right;
	padding-right: 210px;
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
	
	<c:if test="${loginUser.userName eq '관리자'}">
		<div align="right"style="margin-right:200px;">
			<button type="button" class="btn btn-info" onclick="location.href='enrollForm.notice'">글쓰기</button>
		</div>
	</c:if>
	
	<table id="noticeList" class="table table-hover" align="center" >			
		<thead>
			<tr>
				<th>
					<select name="noticeCategory" id="noticeCategory" style="width: 70px; height: 30px; text-align: center; font-weight: bolder;">
						<option value="전체">[전체]</option>
						<option value="공지">[공지]</option>
						<option value="알림">[알림]</option>
						<option value="행사">[행사]</option>
					</select>
				</th>
				<th style="width: 300px;">제목</th>
				<th>작성자</th>
				<th>게시일</th>
				</tr>
		</thead>
		<tbody>
			<c:forEach var="n" items="${list}">
				<tr onclick="location.href='detail.notice?nno=${n.noticeNo}'">
					<td>${n.noticeCategoryValue}</td>
					<td>${n.noticeTitle}</td>
					<td>${n.userName}</td>
					<td>${n.createDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

		<c:if test="${ not empty category }">
		<script>
			$(function(){
				$("#noticeList option[value=${category}]").attr("selected", true);  
			})
	    </script>
	</c:if>
	
	<script>
		$(function(){
			$('#noticeCategory').change(function(){
				var category = $("#noticeCategory option:selected").val();
				location.href='categoryList.notice?currentPage=1&category=' + category;
			})
		})
	</script>


	<div id="pagingArea">

	</div>
	
<jsp:include page="../common/footer.jsp"/>

</body>
</html>