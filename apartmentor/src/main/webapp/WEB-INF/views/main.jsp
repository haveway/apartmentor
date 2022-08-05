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
               		 공지
            </div>
            <div id="content2">
               		날씨
            </div>
        </div>
        <div id="contentWrap2">
            <div id="content3">
              		  자유
            </div>
            <div id="content4">
                <form action="visit.car">
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
          		  캘
        </div>
    </div>
    

</body>
<jsp:include page="common/footer.jsp"/>
</html>