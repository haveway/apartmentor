<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	
	
	.content2{
		width:1200px;
		height:800px;
		margin: auto;
	}
	
	#boardList {
		width:800px;
	}
	#boardList th,td {
		text-align:center;
	}
	#boardList th:nth-child(1) {
		width:100px;
	}
	#boardList th:nth-child(2) {
		width:350px;
	}
	#boardList th:nth-child(3) {
		width:120px;
	}
	#boardList th:nth-child(4) {
		width:80px;
	}
	#boardList th:nth-child(5) {
		width:150px;
	}
	#boardList>tbody>tr:hover {cursor:pointer;}
	#search{
		text-align:right;
		padding-right:210px;  
	}
	#pagingArea {width:fit-content; margin:auto;}

</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

	<br>
	<br>
	
	<div class="content2">
	
		<div align="center" style="margin-right:600px;">
			<h1>자유게시판</h1> 
		</div>
		<br>
		
		<br><br>
		<!-- 제목으로 키워드 검색 -->
		<form id="searchForm" action="" method="get" align="center">
			<div id="search">
				<input type="text" name="keyword" placeholder="제목으로 검색" id="searchText">
				<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
			</div>
		</form>
		<br>
		
		<table id="boardList" class="table table-hover" align="center" >
			<thead>
				<tr>
					<th>
						<select name="condition">
							<option value="[일반]">[일반]</option>
							<option value="[맘]">[맘]</option>
							<option value="[건의]">[건의]</option>
							<option value="[판매]">[판매]</option>
							<option value="[정보]">[정보]</option>
						</select>
					</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>게시일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${list}">
					<tr onclick="location.href='detail.bo?bno=${b.boardNo}'">
						<td>${b.boardCategory}</td>
						<td>${b.boardTitle}</td>
						<td>${b.boardWriter}</td>
						<td>${b.count}</td>
                   		<td>${b.createDate}</td>
                   	</tr>	
				</c:forEach>
			</tbody>
		</table>
		<br>
		<br>
		
		<c:if test="${ not empty loginUser }">
			<div align="center" style="margin-left:650px;">
				<button type="button" class="btn btn-primary">글쓰기</button>
			</div>
		</c:if>
		
		<div id="pagingArea">
                <ul class="pagination">
                
                    <c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
		                    <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
						</c:when>
                		<c:otherwise>
                			<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage - 1 }">이전</a></li>
                		</c:otherwise>
                    </c:choose>

                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="list.bo?cpage=${p}">${p}</a></li>
                    </c:forEach>
                    
                    <c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
                   	 	<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage + 1 }">다음</a></li>
					</c:otherwise>
                    </c:choose>
                    
                </ul>
            </div>
		
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>