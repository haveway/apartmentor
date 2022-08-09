<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>메인</title>
    <style>
        div{
            box-sizing : border-box;
            border : 1px solid red;
        }    
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
        .a1{
        	margin-top: 3px;
        	margin-right: 5px;
        	float: right;
        	border: solid 1px gray;
        	border-radius: 60%; 
        	padding: 5px;
        	text-decoration: none; 
        }
    </style>    
</head>
<jsp:include page="common/header.jsp"/>
<body>
    <div class="mainWrap">
        <div id="imgSlide">

        </div>
        <br>
        <hr>

        <div id="contentWrap1">
            <div id="content1">
            	<a class="a1" href="#">더보기 + </a>
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
	           				<c:forEach var="n" items="${nList}">
			           			<tr>
			           				<td>${n.noticeCategory}</td>
			           				<td>${n.noticeTitle}</td>
			           				<td>${n.createDate}</td>
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
        <div id="contentWrap2">
            <div id="content3">
            	<a class="a1" href="#">더보기 + </a>
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
	           				<c:forEach var="b" items="${bList}">
			           			<tr>
			           				<td>${b.boardCategory}</td>
			           				<td>${b.boardTitle}</td>
			           				<td>${b.createDate}</td>
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
          		  <a href="enrollForm.visit">임시로</a>
        </div>
    </div>
    

</body>
<jsp:include page="common/footer.jsp"/>
</html>