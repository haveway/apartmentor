<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        div{
            box-sizing : border-box;
        }
        .wrap{
            width : 1200px;
            height : 80px;
            margin : auto;
        }
        
        /*footer*/
        #footer{
        	height: 130px;
        	text-align: left;
        }
        #footer > div{
        	height : 100%;
        	float : left;
        }
        #footer1{
        	width: 60%;
        	margin-left: 25px;
        }
        #footer2{
        	width: 20%;
        	margin-left: 100px;
        }
        #footer p{font-size: 12px;}
        #footer a{
        	text-decoration: none;
        	color: rgb(63, 74, 224);
        }       
    </style>
</head>
<body>
    <div id="footerWrap">
        <hr>
        <div class="wrap">
            
            <div id="footer">


                <div id="footer1"> 
                    <p style="font-size: 15px;">APARTMENTOR</p>
                    <p>주소 : 서울시 어딘가</p>
                    <p>대표 : Team1 APARTMENTOR</p>
                </div>
                <div id="footer2"> 
                    <p style="font-size: 15px;"><a href="#">고객센터</a></p>
                    <p>이용약관</p>
                    <p>개인정보처리방침</p>
                </div>
                <div id="footer3"> 
                    <p style="font-size: 15px;">운영시간</p>
                    
                </div>

            </div>

            <br>

        </div>
    </div>
    
</body>
</html>