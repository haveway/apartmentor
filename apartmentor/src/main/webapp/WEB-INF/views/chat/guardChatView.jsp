<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경비실 채팅</title>
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
			<h1>경비실채팅</h1> 
		</div>
		<br><br><br>
		
		<div class="btn-group btn-group-lg" id="chatTitleBtn">
		    <button type="button" class="btn" onclick="location.href='chatForm.ch'">주민채팅방</button>
		    <button type="button" class="btn btn-primary" disabled >경비실 채팅방</button>
		    <button type="button" class="btn">관리소 채팅방</button>
		  </div>
		<br><br>
		
		<div class="chat-area">
	
	
		
		
		
		
		
		
		
		
		</div>
		
		
		
		
		
	</div>
	
	<script>
	
	// 채팅 리스트 조회 기능 호출
	$(function(){
		selectSecuChatList();
	});
	
	// 경비실채팅 조회 기능
	function selectSecuChatList(){
		var userNo = ${loginUser.userNo};
		
	}
	
	</script>
	
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>