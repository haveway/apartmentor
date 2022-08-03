<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<body>
	<h1>자유게시판</h1>
	<br>
	
	<br><br>
	
	<table id="boardList" align="center" >
		<thead>
			<tr>
				<th colspan="6">
					<div align="right">
						<input type="text" placeholder="제목으로검색">
						<button>검색</button>
					</div>
				</th>
			</tr>
			<tr>
				<th>
					<select name="condition">
						<option value="[일반]">[일반]</option>
						<option value="[맘]">[맘]</option>
						<option value="[건의]">[건의]</option>
						<option value="[판매]">[판매]</option>
						<option value="[정보]">[정보]</option>
					</select>
				<th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>게시일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>리스트 보여줄 곳</td>
			</tr>
		</tbody>
	</table>
	
	<button>글쓰기</button>
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>