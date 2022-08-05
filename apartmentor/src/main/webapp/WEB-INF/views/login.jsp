<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
        .loginWrap{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 500px;
            height: 410px;
            margin: auto;
            margin-top: 100px;
        }
        .formWrap{
            margin: 5px;
            padding: 20px;
            width: 300px;
            height: 230px;
        }
        #loginid,#loginpwd{
            height: 30px;
            width: 250px;
            font-size: 7px;
            margin-bottom: 10px;
        }
        #logo{
            color: rgb(0,88,155);
            font-size: 50px
        }
        #loginbtn{
            border: none;
            width: 250px;
            height: 30px;
            background-color: rgb(0,88,155);
            color: white;
            font-weight: bold;
            font-size: 20px;
            cursor: pointer;
        }
        #loginbtn:hover{
            opacity:0.8;
        }
        #modalbtn, #modalbtn button{
            font-size: 5px;
            background: none;
            border: none;
            cursor: pointer;
            color: gray;
        }
        #modalbtn button:hover{
            color: black;
        }
        #hr1{
            margin-top: 20px;
            margin-bottom: 20px;
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
        #p1red{
        font-size: 5px;
        color: red;
        }
        #p2red{

    </style>
</head>
<body>
<%-- 	<c:if test="${not empty alertMsg}">
		<script>
			alertify.alert("${alertMsg}").set('basic', true); 
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>	 --%>
	<c:if test="${not empty alertMsg1}">
		<script>
			swal('오류', "${alertMsg1}", 'warning');
		</script>
	</c:if>	
	<c:if test="${not empty alertMsg2}">
		<script>
			swal('성공!', "${alertMsg2}", 'success');
		</script>
	</c:if>	
	
    <div  class="loginWrap">
        <h2 id="logo">APARTMENTOR</h2>
        <br>
        <div class="formWrap border" align="center">
            <form action="login.me">
                <input type="text" id="loginid" name="userId" placeholder="아이디" oninput="checkId1()">
                <br>
                <input type="password" id="loginpwd" name="userPwd"placeholder="비밀번호">
                <br>
                <c:if test="${not empty noLogin}">
               		<p id="p1red">아이디, 비밀번호를 확인해주세요.</p>
                </c:if>
                <button id="loginbtn">LOGIN</button>
                <br><br><br>
            </form>    
            <div id="modalbtn">
                <button data-toggle="modal" data-target="#myModal1" class="modal1">
                   	 회원가입
                </button> 
                / 
                <button data-toggle="modal" data-target="#myModal2">
                   	아이디 찾기
                </button> 
                / 
                <button  data-toggle="modal" data-target="#myModal3">
                   	 비밀번호 찾기
                </button>
           	</div>
        </div>
    </div>  
      
    <!-- 회원가입 모달 -->
    <div class="modal" id="myModal1">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Head -->
                <div class="modal-header">
                    <h2>회원가입</h2>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <br>
                
                <!-- Body -->
                <form action="insert.me" method="post">
                    <div class="modal-body">
                        <b>아이디 : </b>
                        <div class="modal-input">
                            <input type="text" id="addId" name="userId" placeholder="ex)user111" required>
                        </div>
                        <p>영문(소문자) 숫자 조합 4글자 이상 8글자 이하로 사용하세요.</p>

                        <b>비밀번호 : </b>
                        <div class="modal-input">
                            <input type="text" id="addPwd" name="userPwd" placeholder="ex)asd123!@#" required>
                        </div>
                        <p>4~10자 영문 대 소문자, 숫자, 특수문자(!,@,#,$)를 사용하세요.</p>
                        
                        <b>이름 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addName" name="userName" placeholder="ex)홍길동" required>
                        </div>
                        <p>한글이름으로 입력하세요</p>

                        <b>생년월일 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addBirthday" name="birthday" placeholder="ex)901201" required>
                        </div>
                        <p>6자리 숫자로 입력하세요.</p>

                        <b>휴대폰 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addPhone" name="phone" placeholder="ex)01012345678" required>
                        </div>
                        <p>-을 제외한 11자리 숫자로 입력하세요.</p>

                        <b>이메일 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addEmail" name="email" placeholder="ex)apartmento@naver.com" required>
                        </div>
                        <p>예시와 같은 형식으로 입력하세요.</p>

                        <b>동,호수 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addAptNo" name="aptNo" placeholder="ex)101동1001호" required>
                        </div>
                        <p>예시와 같은 형식으로 입력하세요.</p>
                    </div>
                    
                    <!-- Footer -->
                    <div class="modal-footer">
                       <p style="font-size:12px">잘못된 정보 입력시 회원가입에 불이익이 발생할 수 있습니다.</p>
                        <button type="submit" class="btn submit">가입신청</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 아이디 찾기 모달 -->
    <div class="modal" id="myModal2">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Head -->
                <div class="modal-header">
                    <h2>아이디 찾기</h2>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Body -->
	            <div class="modal-body">
	                <b>이름 : </b>
	                <div class="modal-input">
	                	<input type="text" id="nameId"placeholder="ex)홍길동" required>
	                </div>
	                <p>한글이름으로 입력하세요</p>
	
	                <b>생년월일 : </b>
	                <div class="modal-input">
	                	<input type="text" id="birthdayId" placeholder="ex)901201" required>
	                </div>
	                <p>6자리 숫자로 입력하세요.</p>
	
	                <b>동,호수 : </b>
	                <div class="modal-input">
	                	<input type="text" id="aptNoId" placeholder="ex)101동1001호" required>
	                </div>
	                <p>예시와 같은 형식으로 입력하세요.</p>
	                <br>
	                <p id="findId"style="font-size: 25px; color: black;"></p>
	                <br>
	            </div>
	            
	            <!-- Footer -->
	            <div class="modal-footer">
	                <button class="btn submit" onclick="findId()">찾기</button>
	            </div>
            </div>
        </div>
    </div>
    


    <!-- 비밀번호 찾기 모달 -->
    <div class="modal" id="myModal3">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Head -->
                <div class="modal-header">
                    <h2>비밀번호 찾기</h2>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
				<div id="updatePwd">
	                <!-- Body -->
					<div class="modal-body" id="pwdBody">
						<b>아이디 : </b>
						<div class="modal-input">
							<input type="text" id="idPwd" placeholder="ex)user01" required>
						</div>
						<p>아이디를 입력하세요</p>
					    <b>이름 : </b>
					    <div class="modal-input">
					    	<input type="text" id="namePwd" name="userName" placeholder="ex)홍길동" required>
					    </div>
					    <p>한글이름으로 입력하세요</p>
					
					    <b>생년월일 : </b>
					    <div class="modal-input">
					    	<input type="text" id="birthdayPwd" name="birthday" placeholder="ex)901201" required>
					    </div>
					    <p>6자리 숫자로 입력하세요.</p>
					
					    <b>동,호수 : </b>
					    <div class="modal-input">
					    	<input type="text" id="aptNoPwd" name="aptNo" placeholder="ex)101동1001호" required>
					    </div>
					    <p>예시와 같은 형식으로 입력하세요.</p>
					</div>
	
					<!-- Footer -->
					<div class="modal-footer" id="pwdFooter">
					    <button  class="btn submit"  onclick="findPwd()">찾기</button>
					</div>
				</div>
        	</div>
    	</div>
	</div>
    
    <script>
	/* 아이디 찾기 */
    function findId() {
    	$.ajax({
    		url : "findId.me",
    		data : {
    			name : $('#nameId').val(),
    			birthday : $('#birthdayId').val(),
    			aptNo : $('#aptNoId').val()
    		},
    		success : function(result){
    			if(result == null){
					let nId = '일치하는 정보가 없습니다';
    				$('#findId').html(nId);
    			} 
    			else { 
    			
    				let yId = '회원님의 아이디는 : ' + '<br>' + result.userId + ' 입니다.';
    				$('#findId').html(yId);
    			}	
    		},
			error:function(){
				console.log('실패')
			}	
    	})
	}
	/* 비밀번호 찾기 */
    function findPwd() {
    	$.ajax({
    		url : "findPwd.me",
    		data : {
    			id : $('#idPwd').val(),
    			name : $('#namePwd').val(),
    			birthday : $('#birthdayPwd').val(),
    			aptNo : $('#aptNoPwd').val()
    		},
    		success : function(result){
    			if(result == null){
    				swal('오류', "일치하는 정보가 없습니다", 'warning');    				
    			} 
    			else { 
    				console.log(result)
    				console.log(result.userId)
    				console.log(result.userPwd)
    				$('#updatePwd *').remove();
    				let yPwd = '<form action="update.pw" method="post">'
    						  + '<input type="hidden" name="pwdId"  id="asdasd">' /* pwdId */
    						  + '<div class="modal-body" id="pwdBody">'
    						  + '<b>' + '비밀번호' +'</b>'
    						  + '<div class="modal-input">' 
    						  + '<input type="password" class="pwd" name="newPwd" placeholder="ex)asd123!@#" required>'
    						  + '</div>'
    						  + '<p>' + '4~10자 영문 대 소문자, 숫자, 특수문자(!,@,#,$)를 사용하세요.' + '</p>'
    						  + '<b>' + '비밀번호 확인' +'</b>'
    						  + '<div class="modal-input">' 
    						  + '<input type="password" class="pwd" name="checkPwd" placeholder="ex)asd123!@#" required>'
    						  + '</div>'
    						  + '<p>' + '' + '</p>'
    						  + '</div>'
    						  + '<div class="modal-footer" id="pwdFooter">'
    						  + '<button type="submit" class="btn submit" >' + '변경' + '</button>'
    					      + '</div>'
    					      + '</form>'
    				$('#updatePwd').html(yPwd);
    				$('#asdasd').val(result.userId)	      
    			}	
    		},
			error:function(){
				console.log('실패')
				swal('오류', "일치하는 정보가 없습니다", 'warning');
			}	
    	})
	}
   
	/* 중복체크,유효성검사  */
	function checkId1() {
		$.ajax({
			url : "checkId1.me",
			data : {
	        	var userId = $("#addId").val();
	        	var idCheckRegExp = /^[a-zA-Z]+[a-zA-Z0-9]{4,8}$/;
			},
			success : function(result) {
				if(result == null){
					
				}
			},
			error : function(){
				
			}
		})
	}

</script>
</body>
</html>