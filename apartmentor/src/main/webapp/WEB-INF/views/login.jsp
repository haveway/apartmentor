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
	
    <div  class="loginWrap">
        <h2 id="logo">APARTMENTOR</h2>
        <br>
        <div class="formWrap border" align="center">
            <form action="login.me" method="post">
                <input type="text" id="loginid" name="userId" placeholder="아이디">
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
                
                <!-- Body -->
                <form action="insert.me" method="post">
                    <div class="modal-body">
                        <b>아이디 : </b>
                        <div class="modal-input">
                            <input type="text" id="addId" name="userId" placeholder="ex)user111" oninput="checkId();" required>
                        </div>
                        <p id="p1">영문 대 소문자, 숫자 조합 4글자 이상 8글자 이하로 사용하세요.</p>

                        <b>비밀번호 : </b>
                        <div class="modal-input">
                            <input type="password" id="addPwd" name="userPwd" placeholder="ex)asd123!@#" oninput="checkPwd();" required >
                        </div>
                        <p id="p2">6~10자 영문 대 소문자, 숫자, 특수문자(!,@,#,$)를 사용하세요.</p>
                        
                        <b>비밀번호 확인 : </b>
                        <div class="modal-input">
                            <input type="password" id="rePwd1" placeholder="ex)asd123!@#" oninput="ReconfirmPwd1()" required>
                        </div>
                        <p id="p3">비밀번호를 일치하게 입력해주세요.</p>
                        
                        <b>이름 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addName" name="userName" placeholder="ex)홍길동" oninput="checkName()" required>
                        </div>
                        <p id="p4">한글이름으로 입력하세요.</p>

                        <b>생년월일 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addBirthday" name="birthday" placeholder="ex)901201" oninput="checkBirth()" required>
                        </div>
                        <p id="p5">6자리 숫자로 입력하세요.</p>

                        <b>휴대폰 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addPhone" name="phone" placeholder="ex)01012345678" oninput="checkPhone()" required>
                        </div>
                        <p id="p6">-을 제외한 11자리 숫자로 입력하세요.</p>

                        <b>이메일 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addEmail" name="email" placeholder="ex)apartmento@naver.com" oninput="checkEmail()" required>
                        </div>
                        <p id="p7">예시와 같은 형식으로 입력하세요.</p>
                        
                        <b>동 </b>
                        <div class="modal-input">
                        	<input type="text" id="addAptNo1" name="aptNo1" placeholder="ex)101" oninput="checkAptNo1()" required>
                        </div>
                        <p id="p8-1">숫자만 입력해 주세요.</p>
                        <b>호수 : </b>
                        <div class="modal-input">
                        	<input type="text" id="addAptNo2" name="aptNo2" placeholder="ex)1001" oninput="checkAptNo2()" required>
                        </div>
                        <p id="p8-2">숫자만 입력해 주세요.</p>
                    </div>
                    
                    <!-- Footer -->
                    <div class="modal-footer">
                       <p style="font-size:12px">잘못된 정보 입력시 회원가입에 불이익이 발생할 수 있습니다.</p>
                        <button type="submit" id="insertMember"class="btn submit" disabled="disabled">가입신청</button>
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
	                	<input type="text" id="nameId" placeholder="ex)홍길동" required>
	                </div>
	                <p>한글이름으로 입력하세요.</p>
	
	                <b>생년월일 : </b>
	                <div class="modal-input">
	                	<input type="text" id="birthdayId" placeholder="ex)901201" required>
	                </div>
	                <p>6자리 숫자로 입력하세요.</p>
	
                   <b>동 </b>
                   <div class="modal-input">
                 		<input type="text" id="idAptNo1" name="aptNo1" placeholder="ex)101" required>
                   </div>
                   <p id="p8-1">숫자만 입력해 주세요.</p>
                   <b>호수 : </b>
                   <div class="modal-input">
                   		<input type="text" id="idAptNo2" name="aptNo2" placeholder="ex)1001" required>
                   </div>
                   <p id="p8-2">숫자만 입력해 주세요.</p>
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
					    	<input type="text" id="namePwd" placeholder="ex)홍길동" required>
					    </div>
					    <p>한글이름으로 입력하세요.</p>
					
					    <b>생년월일 : </b>
					    <div class="modal-input">
					    	<input type="text" id="birthdayPwd"placeholder="ex)901201" required>
					    </div>
					    <p>6자리 숫자로 입력하세요.</p>
					
					    <b>동 </b>
                        <div class="modal-input">
                        	<input type="text" id="pwdAptNo1" placeholder="ex)101"  required>
                        </div>
                        <p id="p8-1">숫자만 입력해 주세요.</p>
                        <b>호수 : </b>
                        <div class="modal-input">
                        	<input type="text" id="pwdAptNo2" placeholder="ex)1001" required>
                        </div>
                        <p id="p8-2">숫자만 입력해 주세요.</p>
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
    		url : 'findId.me',
    		data : {
    			name : $('#nameId').val(),
    			birthday : $('#birthdayId').val(),
    			aptNo1 : $('#idAptNo1').val(),
    			aptNo2 : $('#idAptNo2').val()
    		},
    		success : function(result){
    			if(result == null){
    				swal('오류', '일치하는 정보가 없습니다', 'warning');    	
    			} 
    			else { 
    				swal('성공!', '회원님의 아이디는 ' + result.userId + ' 입니다.', 'success');    	
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
    		url : 'findPwd.me',
    		data : {
    			id : $('#idPwd').val(),
    			name : $('#namePwd').val(),
    			birthday : $('#birthdayPwd').val(),
    			aptNo1 : $('#pwdAptNo1').val(),
    			aptNo2 : $('#pwdAptNo2').val()
    		},
    		success : function(result){
    			if(result == null){
    				swal('오류', '일치하는 정보가 없습니다', 'warning');    				
    			} 
    			else { 
    				$('#updatePwd *').remove();
    				let yPwd = '<form action="update.pw" method="post">'
    						  + '<input type="hidden" name="pwdId"  id="asdasd">' /* pwdId */
    						  + '<div class="modal-body" id="pwdBody">'
    						  + '<b>' + '비밀번호' +'</b>'
    						  + '<div class="modal-input">' 
    						  + '<input type="text" id="updatePwd1" name="newPwd" placeholder="ex)asd123!@#" oninput="checkPwd2()" required>'
    						  + '</div>'
    						  + '<p id="p9">' + '6~10자 영문 대 소문자, 숫자, 특수문자(!,@,#,$)를 사용하세요.' + '</p>'
    						  + '<b>' + '비밀번호 확인' +'</b>'
    						  + '<div class="modal-input">' 
    						  + '<input type="text" id="reUpdatePwd" name="checkPwd" placeholder="ex)asd123!@#" oninput="rePwd2()" required>'
    						  + '</div>'
    						  + '<p id="p10">' + '비밀번호를 일치하게 입력해주세요.' + '</p>'
    						  + '</div>'
    						  + '<div class="modal-footer" id="pwdFooter">'
    						  + '<button type="submit" class="btn submit" id="btn1">' + '변경' + '</button>'
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
	var checkIdBtn
	function checkId() {
		let p1 = $('#p1');
		let addId = $('#addId').val();
		$.ajax({
			url : 'checkId.me',
			data : {
				userId : addId
			},
			success : function(result) {
				if(result == 0){
					p1.attr('style','color:red;');
					p1.text('중복되는 아이디입니다');
				}
				else {
					 let regExpId = /^\w{4,8}$/;
					 if(!regExpId.test(addId)){ // 조건에 안맞음
						 p1.attr('style','color:red;');
						 p1.text('영문 대 소문자, 숫자 조합 4글자 이상 8글자 이하로 사용하세요.');
					 } 
					 else { //조건맞음
						p1.attr('style','color:#32CD32;');
						p1.text('멋진 아이디네요!');	 
						checkId11Btn = 'Y';
					 }
				}
			},
			error : function(result){
				console.log('실패')
			}
		})
	}
	
	/* 비밀번호 유효성 검사 */
	var checkPwd1Btn
	function checkPwd() {
		let p2 = $('#p2');
		let addPwd = $('#addPwd').val();
		let regExpPwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{6,10}$/;
		if(!regExpPwd.test(addPwd)){
			 p2.attr('style','color:red;');
			 p2.text('6~10자 영문 대 소문자, 숫자, 특수문자(!,@,#,$)를 사용하세요.')
		}
		else {
			p2.attr('style','color:#32CD32;');
			p2.text('사용가능한 비밀번호 입니다.')
			checkPwdBtn = 'Y'
		}
	}
 	/* 비밀번호 중복 체크 */
 	var ReconfirmPwd1Btn
	function ReconfirmPwd1() {
		let addPwd = $('#addPwd').val(); 
		let rePwd1 = $('#rePwd1').val();
		let p3 = $('#p3');
		if(addPwd != rePwd1){
			p3.attr('style','color:red;');
			p3.text('비밀번호를 일치하게 입력해주세요.')
		}
		else {
			p3.attr('style','color:#32CD32;');
			p3.text('비밀번호가 일치합니다.')
			ReconfirmPwd1Btn = 'Y'
		} 
	}
 	/* 이름 체크 형식 */
 	var checkNameBtn
 	function checkName() {
		let addName = $('#addName').val(); 
		let p4 = $('#p4');
		let regExpName = /^[가-힣]{2,}$/;
		if(!regExpName.test(addName)){
			p4.attr('style','color:red;');
			p4.text('올바른 형식의 이름을 입력하세요.(한글만 입력 가능)')
		}
		else {
			p4.attr('style','color:#32CD32;');
			p4.text('멋진 이름이네요!');	 
			checkNameBtn = 'Y';
		}
	}
 	/* 생년월일 체크 형식*/
 	var checkBirthBtn
 	function checkBirth() {
 		let addBirthday = $('#addBirthday').val();
 		let p5 = $('#p5');
 		let regExpBirth = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
 		if (!regExpBirth.test(addBirthday)) {
 			p5.attr('style','color:red;');
			p5.text('6자리 숫자로 입력하세요.')
		} else {
			p5.attr('style','color:#32CD32;');
			p5.text('올바른  형식 입니다.');	
			checkBirthBtn = 'Y';
		}
	}
 	/* 휴대폰 체크 형식 */
 	var checkPhoneBtn
 	function checkPhone() {
 		let addPhone = $('#addPhone').val();
 		let p6 = $('#p6');
 		let regExpPhone = /^[\d]{11}$/;
 		if(!regExpPhone.test(addPhone)){
 			p6.attr('style','color:red;');
			p6.text('-을 제외한 11자리 숫자로 입력하세요.')
		} 
 		else {
			p6.attr('style','color:#32CD32;');
			p6.text('올바른  형식 입니다.');	
			checkPhoneBtn = 'Y';
		}
	}
 	/* 이메일 체크 형식  */
 	var checkEmailBtn
 	function checkEmail() {
 		let addEmail = $('#addEmail').val();
 		let p7 = $('#p7');
 		let regExpEmail =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
 		
 		if(!regExpEmail.test(addEmail)){
 			p7.attr('style','color:red;');
			p7.text('올바른 형식의 이메일이 아닙니다.')
		} 
 		else {
			p7.attr('style','color:#32CD32;');
			p7.text('올바른  형식 입니다.');	
			checkEmailBtn = 'Y';
		}
	}
 	/* 동,호수 체크 형식  */
 	var checkAptNo1Btn
 	function checkAptNo1() {
 		let addAptNo1 = $('#addAptNo1').val();
 		let p8 = $('#p8-1');
 		let regExpAptNo =  /^\d{3,4}$/;
 		if(!regExpAptNo.test(addAptNo1)){
 			p8.attr('style','color:red;');
			p8.text('예시를 참고하여 입력해주세요.(공백 금지)')
		} 
 		else {
			p8.attr('style','color:#32CD32;');
			p8.text('올바른  형식 입니다.');	
			checkAptNo1Btn = 'Y';
		}
	}
 	var checkAptNo2Btn 
 	function checkAptNo2() {
 		let addAptNo2 = $('#addAptNo2').val();
 		let p8 = $('#p8-2');
 		let regExpAptNo =  /^\d{3,4}$/;
 		if(!regExpAptNo.test(addAptNo2)){
 			p8.attr('style','color:red;');
			p8.text('예시를 참고하여 입력해주세요.(공백 금지)')
		} 
 		else {
			p8.attr('style','color:#32CD32;');
			p8.text('올바른  형식 입니다.');	
			checkAptNo2Btn = 'Y';
		}
	}

 	
	 
	 console.log(checkIdBtn);
	 console.log(checkPwd1Btn);
	 console.log(ReconfirmPwd1Btn);
	 console.log(checkNameBtn);
	 console.log(checkBirthBtn);
	 console.log(checkPhoneBtn);
	 console.log(checkEmailBtn);
	 console.log(checkAptNo1Btn);
	 console.log(checkAptNo2Btn);
 	
	
 	
 	var updatePwd111
	/* 비밀번호변경 유효성 검사 */
	function checkPwd2() {
		let p9 = $('#p9');
		let updatePwd = $('#updatePwd1').val();
		let regExpPwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{6,10}$/;
		if(!regExpPwd.test(updatePwd)){
			 p9.attr('style','color:red;');
			 p9.text('6~10자 영문 대 소문자, 숫자, 특수문자(!,@,#,$)를 사용하세요.')
		}
		else {
			p9.attr('style','color:#32CD32;');
			p9.text('사용가능한 비밀번호 입니다.')
			 updatePwd111 = "Y"
		}
	}
	var reUpdatePwd111
 	/* 비밀번호변경 중복 체크 */
	function rePwd2() {
		let updatePwd = $('#updatePwd1').val(); 
		let reUpdatePwd = $('#reUpdatePwd').val();
		let p10 = $('#p10');
		if(updatePwd != reUpdatePwd){
			p10.attr('style','color:red;');
			p10.text('비밀번호를 일치하게 입력해주세요.')
		}
		else {
			p10.attr('style','color:#32CD32;');
			p10.text('비밀번호가 일치합니다.')
			reUpdatePwd111 = "Y"
		} 
	}
 	console.log(reUpdatePwd111);
 	  /* if(updatePwd111 = Y && reUpdatePwd111 = Y){
 		$('#btn1').removeAttr("disabled")
 	}   */
 	if(updatePwd111 = "Y"){
 		$('#btn1').removeAttr("disabled")
 	}

</script>

</body>
</html>