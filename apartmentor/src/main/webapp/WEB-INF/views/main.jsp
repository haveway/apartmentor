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
        #mainWrap{
            width: 1500px;
       
        }
        #imgSlide{
            width: 1500px;
            height: 400px;
        }
        div[id^=content]{
            width: 600px;
            height: 300px;
        }
        div[id^=contentWrap]{
            width: 1500px;
            height: 300px;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }
        #calendar{
            width: 1500px;
            height: 300px;
        }
    </style>    
</head>
<body>
    <div id="mainWrap">
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
            		    차
            </div>
        </div>

        <div id="calendar">
          		  캘
        </div>
    </div>
    

</body>
</html>