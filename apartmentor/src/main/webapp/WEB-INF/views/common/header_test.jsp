<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	
   	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>Document</title>
    <style>
    	div{
            border: 1px solid red;
            
        } 
        #header{       
            background-color: rgb(0,88,155);
            width: 100%;
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
            width: 230px;
            height: 100%;
            justify-content: center;
            font-weight :bold;
            font-size: 30px;
            margin: auto;
        }
        #logo a{
            margin-left: 30px;
        	color: white;
        	text-decoration: none;
        }
		#memberInfo{
			float: right;
			width: 90px;
		}
		#memberInfo p{ margin: auto;}
        #changeInfor,#logout,#memberInfo{
            float: right;
            margin-right : 7px;
            margin-top: 3px;        	
        	padding: 10px;
        	text-decoration: none;
			padding-right: 0px;
			padding-left: 0px;        	
        }
        #changeInfor button,#logout a, #memberInfo p{        	
        	color: white;
        	text-decoration: none;
        } 
		#changeInfor button{
			background: none;
			border: none;
			padding-top: 0px
		}
		.modal-body input{
            margin-top: 7.5px;
            height: 20px;
            width: 100%;
            font-size: 20px;
            border: none;
        }
        .modal-body input:focus {outline:none;}
        .modal-body b{
            font-size: 20px;
            margin-bottom: 30px;
            margin-top: 30px;
        }
        .modal-body p{
            font-size: 7px;
            color: grey;
        }
        .modal-input{
            height: 40px; 
            border: solid gray 2px;
        }
        .submit{
            background-color: rgb(0,88,155);    
            color: white;        
        }
        
        
        
        
        
    /* 메뉴바 */    
    input[id="menuicon"] {display:none;}
    input[id="menuicon"] + label {display:block;margin:0px;width:50px; height:40px; position:relative; cursor: pointer;}
    input[id="menuicon"] + label span {display:block; position:absolute;width:100%;height:5px;  border-radius: 30px; background: #000; transition:all .35s;}
    input[id="menuicon"] + label span:nth-child(1) {top:0;}
    input[id="menuicon"] + label span:nth-child(2) {top: 50%; transform:translatey(-50%);}
    input[id="menuicon"] + label span:nth-child(3) {bottom:0;}
    input[id="menuicon"]:checked + label {z-index:2;}
    input[id="menuicon"]:checked + label span {background:#fff;}
    input[id="menuicon"]:checked + label span:nth-child(1) {top: 50%; transform:translateY(-50%) rotate(45deg);}
    input[id="menuicon"]:checked + label span:nth-child(2) {opacity: 0;}
    input[id="menuicon"]:checked + label span:nth-child(3) {bottom: 50%; transform:translateY(50%) rotate(-45deg);}
    div[class="sidebar"] {width:300px; height: 100%; background:rgb(0,88,155); position: fixed; top: 0; left: -300px; z-index: 1; transition:all .35s;}
    input[id="menuicon"]:checked + label + div {left:0;}
        
    </style>
</head>
<body>

	<c:if test="${not empty alertMsg1}">
		<script>
			swal('오류', "${alertMsg1}", 'warning');
		</script>
		<c:remove var="alertMsg1"/>
	</c:if>	
	<c:if test="${not empty alertMsg2}">
		<script>
			swal('성공!', "${alertMsg2}", 'success');
		</script>	
		<c:remove var="alertMsg2"/>
	</c:if>	

    <div id="header">
<%--         <div id="menuBar">
            <div class = main-nav-left> 
                <div id="menuImg">asd</div>
                <div class = "sub-menu">
                    <ul class = "sub-menu-list">
                        <li>
                            <a href="map.api">지도</a>
                        </li><hr>
                        <li>
                            <a href="list.bo">자유게시판</a>
                        </li><hr>
                        <li>
                            <a href="seatView.st">독서실</a>
                        </li><hr>
                        <li>
                            <a href="golf.sp">실내골프연습장</a>
                        </li><hr>
                        <li>
                            <a href="miniGym.sp">미니 GYM</a>
                        </li><hr>
                        <c:choose>
                        	<c:when test="${loginUser.userId eq 'admin'}">
		                        <li>
		                            <a href="list.visit">방문예약 목록페이지</a>
                        		</li><hr>
	                        </c:when>
	                        <c:otherwise>
		                        <li>
		                            <a href="enrollForm.visit">방문예약 페이지</a>
		                        </li><hr>
	                        </c:otherwise>
                        </c:choose>
                        <c:if test="${loginUser.userId eq 'admin'}">
	                        <li>
	                            <a href="list.me">회원관리</a>
	                        </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div> --%>
	    <input type="checkbox" id="menuicon">
	    <label for="menuicon">
	        <span></span>
	        <span></span>
	        <span></span>
	    </label>
	    <div class="sidebar">
	    	
	    </div>
        <div id="logo">
        	<a href="main.do" id="logo">APARTMENTOR</a>
        </div>
        <div style="width: 290px;">
	        <div id="logout">
	            <a href="logout.do">로그아웃</a>
	        </div>
	        <div id="changeInfor">
		        <button data-toggle="modal" data-target="#myModal4" class="modal1">
		           	 회원정보수정
		        </button> 
	        </div>
	        <div id="memberInfo">
	        	<p>${loginUser.userName} 님</p>
	        </div>
    	</div>
    </div>
    
    
    
    
    <!-- 회원가입 모달 -->
    <div class="modal" id="myModal4">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Head -->
                <div class="modal-header">
                    <h2>회원가입</h2>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Body -->
                <form action="update.me" method="post">
                    <div class="modal-body">
                        <b>아이디 : </b>
                        <div class="modal-input">
                            <input type="text" id="addId" name="userId" oninput="checkId();" required readonly  value="${loginUser.userId}">
                        </div>
                        <p id="p1">영문 대 소문자, 숫자 조합 4글자 이상 8글자 이하로 사용하세요.</p>

                        <b>비밀번호 : </b>
                        <div class="modal-input">
                            <input type="password" id="addPwd" name="userPwd" oninput="checkPwd();" required >
                        </div>
                        <p id="p2">6~10자 영문 대 소문자, 숫자, 특수문자(!,@,#,$)를 사용하세요.</p>
                        
                        <b>비밀번호 확인 : </b>
                        <div class="modal-input">
                            <input type="password" id="rePwd1" oninput="ReconfirmPwd1()" required>
                        </div>
                        <p id="p3">비밀번호를 일치하게 입력해주세요.</p>
                        
                        <b>이름 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addName" name="userName"  oninput="checkName()" required readonly value="${loginUser.userName}">
                        </div>
                        <p id="p4">한글이름으로 입력하세요.</p>

                        <b>생년월일 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addBirthday" name="birthday"  oninput="checkBirth()" required readonly value="${loginUser.birthday}">
                        </div>
                        <p id="p5">6자리 숫자로 입력하세요.</p>

                        <b>휴대폰 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addPhone" name="phone" oninput="checkPhone()" required value="${loginUser.phone}">
                        </div>
                        <p id="p6">-을 제외한 11자리 숫자로 입력하세요.</p>

                        <b>이메일 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addEmail" name="email" oninput="checkEmail()" required value="${loginUser.email}">
                        </div>
                        <p id="p7">예시와 같은 형식으로 입력하세요.</p>
                        
                        <b>동 </b>
                        <div class="modal-input">
                        	<input type="text" id="addAptNo1" name="aptNo1" oninput="checkAptNo1()" required readonly value="${loginUser.aptNo}">
                        </div>
                        <p id="p8-1">주소변경시 관리사무소에 문의해주세요.</p>
                        <b>호수 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addAptNo2" name="aptNo2" oninput="checkAptNo2()" required readonly value="${loginUser.aptNo}">
                        </div>
                        <p id="p8-2">주소변경시 관리사무소에 문의해주세요.</p>
                    </div>
                    
                    <!-- Footer -->
                    <div class="modal-footer">
                       <p style="font-size:12px">잘못된 정보 입력시 회원가입에 불이익이 발생할 수 있습니다.</p>
                        <button type="submit" id="insertMember"class="btn submit" disabled>가입신청</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<script>
		/* 비밀번호 유효성 검사 */
		function checkPwd() {
			let p2 = $('#p2');
			let addPwd = $('#addPwd').val();
			let regExpPwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{6,10}$/;
			if(!regExpPwd.test(addPwd)){
				 p2.attr('style','color:red;');
				 p2.text('6~10자 영문 대 소문자, 숫자, 특수문자(!,@,#,$)를 사용하세요.')
				 $('#insertMember').attr('disabled',true);
			}
			else {
				p2.attr('style','color:#32CD32;');
				p2.text('사용가능한 비밀번호 입니다.')
				$('#insertMember').attr('disabled',false);
			}
		}
		
	 	/* 비밀번호 중복 체크 */
		function ReconfirmPwd1() {
			let addPwd = $('#addPwd').val(); 
			let rePwd1 = $('#rePwd1').val();
			let p3 = $('#p3');
			if(addPwd != rePwd1){
				p3.attr('style','color:red;');
				p3.text('비밀번호를 일치하게 입력해주세요.')
				$('#insertMember').attr('disabled',true);
			}
			else {
				p3.attr('style','color:#32CD32;');
				p3.text('비밀번호가 일치합니다.')
				$('#insertMember').attr('disabled',false);
			} 
		}
		/* 휴대폰 체크 형식 */
	 	function checkPhone() {
	 		let addPhone = $('#addPhone').val();
	 		let p6 = $('#p6');
	 		let regExpPhone = /^[\d]{11}$/;
	 		if(!regExpPhone.test(addPhone)){
	 			p6.attr('style','color:red;');
				p6.text('-을 제외한 11자리 숫자로 입력하세요.')
				$('#insertMember').attr('disabled',true);
			} 
	 		else {
				p6.attr('style','color:#32CD32;');
				p6.text('올바른  형식 입니다.');	
				$('#insertMember').attr('disabled',false);
			}
		}
	 	
	 	/* 이메일 체크 형식  */
	 	function checkEmail() {
	 		let addEmail = $('#addEmail').val();
	 		let p7 = $('#p7');
	 		let regExpEmail =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 		
	 		if(!regExpEmail.test(addEmail)){
	 			p7.attr('style','color:red;');
				p7.text('올바른 형식의 이메일이 아닙니다.')
				$('#insertMember').attr('disabled',true);
			} 
	 		else {
				p7.attr('style','color:#32CD32;');
				p7.text('올바른  형식 입니다.');	
				$('#insertMember').attr('disabled',false);
			}
		}
	</script>
</body>
</html>