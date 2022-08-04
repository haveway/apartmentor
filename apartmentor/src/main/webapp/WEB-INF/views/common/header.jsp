<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <title>Document</title>
    <style>
        div{
            border: 1px solid red;
            
        }
        #header{
            background-color: rgb(0,88,155);
            width: 1200px;
            height: 50px;
            display: flex;
            flex-direction: row;
            margin: auto;
        }
        .mainWrap{
        width: 1200px;
        margin: auto;
        min-height: 1000px;
        }
        #menuBar{
            height: 100%;
            width: 200px;
        }
        .main-nav-left:hover .sub-menu{
            height: 100%;
            width: 200px;
            overflow: hidden
        }
        /* 서브메뉴 */
        .sub-menu {
            position: fixed;
            width: 200px;
            height: 100%;
            transition: 0.5s;
        }
        .sub-menu{
            width: 0;
            height: 100%;
            overflow: hidden;
            background-color: rgb(0,88,155);
            transition-duration: 0.3s;
        }
        .sub-menu ul {
            list-style: none;
            padding: 0;
        }
        .sub-menu-list li {
            line-height: 1rem;
            margin-left: 20px;
        }
        #logo{
            width: 100px;
            height: 100%;
            justify-content: center;
            margin: auto;
        }

        #changeInfor,#logout{
            float: right;
            margin-right : 30px;
        }
    </style>
</head>
<body>
    <div id="header" style="border: solid yellow 3px;">
        <div id="menuBar">
            <div class = main-nav-left> 
                <div id="menuImg">asd</div>
                <div class = "sub-menu">
                    <ul class = "sub-menu-list">
                        <li>
                            <a href="#">New</a>
                        </li><hr>
                        <li>
                            <a href="#">Basic</a>
                        </li><hr>
                        <li>
                            <a href="#">Best Item</a>
                        </li><hr>
                        <li>
                            <a href="memberList.do">회원관리</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="logo">로고 자리
        </div>
        <div id="logout">
            <a href="#">로그아웃</a>
        </div>
        <div id="changeInfor">
            <a href="#">회원정보수정</a>
        </div>
    </div>

</body>
</html>