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
			<c:forEach var="c" items="${chatList}">
				<div>${c.chatWriter}</div>
				<div>${c.chatContent}</div>
				<div>${c.chatSendTime}</div>
			</c:forEach>
		</c:if>
		
		</div>
		
		<div class="onlineCheck">
		<p>온라인</p>
		</div>
		<div>
			<input type="text" id="chatInput" name="chatContent">
			<button class="btn btn-primary" id="chatBtn" onclick="send();">전송</button>
		</div>


	</div>	
	
	<script>
		// 채팅페이지로 오자마자 주민단체채팅방전용 웹소켓 접속 시키기
		$(function(){
			connectGroup();
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
 				
 				
 				var div = $('<div style="width:100px;"></div>');
 				div.text(e.data);
 				$('.chat-area').append(div);
 				// 스크롤바 하단
	 			$('.chat-area').scrollTop($('.chat-area')[0].scrollHeight);
 				
 			}
		}
	
		// 메시지 전송함수 : 입력한 글자를 불러와서 서버에 전송
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
						// 입력한 글자 전송
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