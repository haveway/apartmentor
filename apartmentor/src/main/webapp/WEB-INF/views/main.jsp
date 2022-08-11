<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>메인</title>
    <style>
        #imgSlide{
            width: 1200px;
            height: 400px;
        }
        div[id^=content]{
            width: 500px;
            height: 300px;
        }
        div[id^=contentWrap]{
            width: 1200px;
            height: 300px;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }
        #calendar{
            width: 1200px;
            height: 300px;
        }
        .table{
        text-align: center;
        font-size: 12px;
        }
        .a1 {
        	margin-top: 3px;
        	margin-right: 5px;
        	float: right;
        	padding: 5px;
        	font-weight: bold;
        }
        .a1 a {
            text-decoration: none;
        	color: gray; 
        }
        .a1 a:hover {
            text-decoration: none;
            color:rgb(0,88,155);
        }
        .td1{ width: 100px}
        .td2{ width: 300px}
        .td3{ width: 100px}
        .title{
        	float: left; 
        	text-align:center;
        	margin-left: 5px; 
        	margin-top: 3px;
        	font-size: 25px;
        }
        #boardTr:hover, #noticeTr:hover{
        cursor:pointer;
        background-color: #E2E2E2;
        }
        #content1, #content3{margin-right: 35px;}
        #content2, #content4{margin-left: 35px;}
        
        
    </style>    
</head>
<jsp:include page="common/header_test.jsp"/>
<body>
    <div class="mainWrap">
        <div id="imgSlide">

        </div>
        <br>
        <hr>

        <div id="contentWrap1">
            <div id="content1">
            	<div class="title">
            	공지사항
            	</div>
            	<div class="a1">
            	<a href="#">더보기 + </a>
            	</div>
	           	<table class="table">
	           		<tr>
	           			<th>카테고리</th>
	           			<th>제목</th>
	           			<th>게시일</th>
	           		</tr>
	           		<c:choose>
	           			<c:when test="${empty nList}">
	           				<tr>
	           					<td colspan="3">게시물이 존재하지 않습니다!</td>
	           				</tr>
	           			</c:when>
	           			<c:otherwise>
	           				<c:forEach var="n" items="${nList}" begin="0" end="4">
			           			<tr onclick="location.href='#'" class="td" id="noticeTr">
			           				<td class="td1">${n.noticeCategoryValue}</td>
			           				<td class="td2">${n.noticeTitle}</td>
			           				<td class="td3">${n.createDate}</td>
			           			</tr>
		           			</c:forEach>
	           			</c:otherwise>
	           		</c:choose>
	           	</table>
            </div>
            <div id="content2">
               		날씨
            </div>
        </div>
        <br>
        <div id="contentWrap2">
            <div id="content3">
	        	<div class="title">
	            	자유 게시판
	           	</div>
	           	<div class="a1">
            		<a href="list.bo">더보기 + </a>
            	</div>
	           	<table class="table">
	           		<tr>
	           			<th>카테고리</th>
	           			<th>제목</th>
	           			<th>게시일</th>
	           		</tr>
	           		<c:choose>
	           			<c:when test="${empty bList}">
	           				<tr>
	           					<td colspan="3">게시물이 존재하지 않습니다!</td>
	           				</tr>
	           			</c:when>
	           			<c:otherwise>
	           				<c:forEach var="b" items="${bList}" begin="0" end="4">
			           			<tr onclick="location.href='detail.bo?bno=${b.boardNo}'" class="td" id="boardTr">
			           				<td class="td1">${b.boardCategory}</td>
			           				<td class="td2">${b.boardTitle}</td>
			           				<td class="td3">${fn:substring(b.createDate,0,10)}</td>
			           			</tr>
		           			</c:forEach>
	           			</c:otherwise>
	           		</c:choose>
	           	</table>
            </div>
            <div id="content4">
                <form action="visit.car" method="post">
                    <input type="hidden" name="userNo" value="${loginUser.userNo}">
                    <h4>방문차량등록</h4>
                    <table>
                        <tr>
                            <td>방문일</td>
                            <td><input type="date" name="carDate"><br></td>
                        </tr>
                        <tr>
                            <td>차량번호</td>
                            <td><input type="text" name="carNo" placeholder="ex)12가5678"></td>
                        </tr>
                        <tr>
                            <td>방문 목적</td>
                            <td><input type="text" name="carPurpose" placeholder="ex)친척 방문"></td>
                            <input type="hidden" name="carCategory" value="2">
                        </tr>
                        <tr>
                            <td>비상 연락처</td>
                            <td><input type="text" name="carPhone" placeholder="ex)010-1234-5678"></td>
                        </tr>
                    </table>
                    <button type="submit">방문 예약 등록</button>
                </form>
            </div>
        </div>

        <div id="calendar">
  			<a href="list.notice">임시</a>
        </div>
    </div>
    
    
    

</body>
<jsp:include page="common/footer.jsp"/>
</html>