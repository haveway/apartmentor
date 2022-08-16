<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<style>
	.content-area{
		width:1200px;
		height:1000px;
		margin: auto;
	}
	#chatTitleBtn{
		margin-left:220px;
	}
	.chat-area{
		width: 600px;
		height:600px; 
		margin-left:230px;
		float:left;
		overflow:auto;
		border:1px solid black;
		padding:5px;
	}
	
	.userchat-area {
		position: relative;
		width: 200px;
		padding: 7px;
		background: #FFFFFF;
		-webkit-border-radius: 21px;
		-moz-border-radius: 21px;
		border-radius: 21px;
		border: #6DB6C8 solid 4px;
		font-size:14px;
		margin-bottom: 10px;
		margin-left: 20px; 
	}
	
	.userchat-area:after {
		content: '';
		position: absolute;
		border-style: solid;
		border-width: 12px 23px 12px 0;
		border-color: transparent #FFFFFF;
		display: block;
		width: 0;
		z-index: 1;
		left: -23px;
		top: 21px;
	}
	
	.userchat-area:before {
		content: '';
		position: absolute;
		border-style: solid;
		border-width: 15px 26px 15px 0;
		border-color: transparent #6DB6C8;
		display: block;
		width: 0;
		z-index: 0;
		left: -30px;
		top: 18px;
	}
	
	.mychat-area {
		position: relative;
		width: 200px;
		padding: 7px;
		background: #FFFFFF;
		border: #6DB6C8 solid 4px;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 21px;
		font-size:14px;
		margin-bottom: 10px;
		margin-left: 350px; 
	}

	.mychat-area:after {
		content: '';
		position: absolute;
		border-style: solid;
		border-width: 12px 0 12px 22px;
		border-color: transparent #6DB6C8;
		display: block;
		width: 0;
		z-index: 1;
		right: -23px;
		top: 21px;
	}
	
	.onlineCheck{
		width: 200px;
		float:left;
		height:600px; 
		margin-left:10px;
	}
	
	#chatInput{
		width: 500px;
		margin-left:230px;
		margin-top:10px;
		height:50px; 
	}
	
	#chatBtn{
		width: 90px;
		height:40px;
	}
	
	.circle{
        border-radius: 50%;
        width: 10px;
        height: 10px;
        background-color : grey;
        float:left;
        margin-top : 5px;
        margin-right : 7px;
        margin-left : 10px;
	}
	
	.chatSendDate{
		font-size:17px;
		margin-top : 7px;
		margin-bottom : 7px;
	}
	
</style>	
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

	<br>
	<br>
	
	<div class="content-area">
	
		<div align="center" style="margin-right:600px;">
			<h1>채팅</h1> 
		</div>
		<br><br><br>
		
		<div class="btn-group btn-group-lg" id="chatTitleBtn">
		    <button type="button" class="btn btn-primary" disabled>주민채팅방</button>
		    <button type="button" class="btn">경비실 채팅방</button>
		    <button type="button" class="btn">관리소 채팅방</button>
		  </div>
		<br><br>
		
		<div class="chat-area">
			<c:if test="${not empty chatList }">
				<!-- DB에 중복값없이 조회한 날짜 반복문 돌리기 -->
				<c:forEach var="ct" items="${sendDateList}">
					<div class="chatSendDate" align="center">${ct.chatSendDate}</div>
						<!-- 채팅내역 반복문 -->
						<c:forEach var="c" items="${chatList}">
							<c:if test="${ct.chatSendDate eq c.chatSendDate }">
								<c:if test="${loginUser.userName eq c.chatWriter}">
									<div class="mychat-area">
										<div>${c.chatWriter}</div>
										<div>${c.chatContent}</div>
										<div>${c.chatSendTime}</div>
									</div>	
								</c:if>
								<c:if test="${loginUser.userName ne c.chatWriter}">
									<div class="userchat-area">
										<div>${c.chatWriter}</div>
										<div>${c.chatContent}</div>
										<div>${c.chatSendTime}</div>
									</div>
								</c:if>
							</c:if>
						</c:forEach>
				</c:forEach>
			</c:if>
		</div>
		
		<div class="onlineCheck">
		<p>온라인</p>
		<c:forEach var='m' items="${MemberList}">
		<div class="online-area">
			<div class="circle"></div>
			<div id="${m.userName}">${m.userName}</div>
		</div>
		</c:forEach>
		
		</div>
		<div>
			<input type="text" id="chatInput" name="chatContent">
			<button class="btn btn-primary" id="chatBtn" onclick="send();">전송</button>
		</div>


	</div>	
	
	<script>
		// 채팅페이지로 오자마자 주민단체채팅방전용 웹소켓 접속 시키기
		$(function(){
			// 윕소켓 접속
			connectGroup();
			
			// 스크롤바 아래로 내리기
			$('.chat-area').scrollTop($('.chat-area')[0].scrollHeight);
			
		})
	
		// 전역변수
		var socket;
		
		// 주민단체채팅방전용 웹소켓 접속 함수
		function connectGroup(){
			
			var uri = "ws://localhost:8015/apartmentor/gp";
			socket = new WebSocket(uri);
			
			// 연결이 성공했는지 아닌지 확인할 수 있도록 예약작업(콜백)을 설정
 			socket.onopen = function(){
 				console.log("서버와 연결되었습니다.");
 				
			}
			
 			socket.onclose = function(){
 				console.log("서버와 연결이 종료되었습니다.");
 			}
 			
 			socket.onerror = function(e){
 				console.log("오타 ㄴㄴ");
 			}
 			
 			socket.onmessage = function(e){
 				console.log("메세지가 도착하였습니다.");
 				var msg = e.data;
 				// 받은 메세지 ',' 구분자로 잘라서 배열에 담기
 				var arr = msg.split(",");
 				
 				// arr[0] : 유저 이름 , arr[1] : 유저가 보낸 메세지
 				let nameDiv = $('<div>').append(arr[0]);
 				let msgDiv = $('<div>').append(arr[1]);
 				
 				// 날짜 를 오전/오후 시간:분 형태로 바꾸기
 				let date = new Date();
 				let time = (date.getHours() < 12 ? "오전 " : "오후 ") 
 							+ date.getHours() 
 								+ ":" 
 							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes());
				
 				let timeDiv = $('<div>').append(time);
 				
 				// 말풍선으로 감싸기
 				var chatDiv = $('<div class="userchat-area">');
 				var myChatDiv = $('<div class="mychat-area">');
 				
 				// 자신이 쓴 채팅일 경우 오른쪽에 출력시키기
 				if('${loginUser.userName}' == arr[0]) {
 					myChatDiv.append(nameDiv);
 					myChatDiv.append(msgDiv);
 					myChatDiv.append(timeDiv);
 	 				
 	 				$('.chat-area').append(myChatDiv);
 				}else{
 					
	 				// 이름 , 메세지 , 날짜 순으로 append
	 				chatDiv.append(nameDiv);
	 				chatDiv.append(msgDiv);
	 				chatDiv.append(timeDiv);
	 				
	 				$('.chat-area').append(chatDiv);
 				}

 				// 스크롤바 하단
	 			$('.chat-area').scrollTop($('.chat-area')[0].scrollHeight);
 				
 			}
		}
	
		// 메세지 전송함수 : 전송 버튼 클릭 시 입력한 메세지를 DB에 저장하고 입력한 메세지를 전송  
 		function send(){
 			var text = $('#chatInput').val();
 			if(!text){
 				return;
 			}
 		// DB에 채팅내역을 저장 후 메세지 전송하기 위한 ajax실행
			$.ajax({
				url : 'insertChat.ch',
				data : {
						userNo : ${loginUser.userNo},
						chatWriter : "${loginUser.userName}",
						chatCode : 1,
						chatContent : text
						},
				success : function(result){
					if(result == 'success'){
						// 입력한 메세지 전송
						socket.send(text);
			 			$('#chatInput').val('');
			 			
					}else{
						swal('오잉?',"다시 작성해주세요!", 'warning');
					}
				}, error : function(){
					swal('에러!', "채팅내역 insert 비동기 요청 실패!", 'warning');
				}
			});
 			
 		}
	
	
	</script>

	<jsp:include page="../common/footer.jsp"/>


</body>
</html>