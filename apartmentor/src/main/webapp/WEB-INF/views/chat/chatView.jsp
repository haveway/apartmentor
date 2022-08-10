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
	}
	.onlineCheck{
		width: 200px;
		float:left;
		height:600px; 
		margin:auto;
	}
	#chatInput{
		width: 500px;
		margin-left:230px;
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
		    <button type="button" class="btn">주민채팅방</button>
		    <button type="button" class="btn">경비실 채팅방</button>
		    <button type="button" class="btn">관리소 채팅방</button>
		  </div>
		<br><br>
		<div class="chat-area">
		
		
		</div>
		
		<div class="onlineCheck">
		<p>온라인</p>
		</div>
		<div>
			<input type="text" id="chatInput" name="chatContent">
			<button class="btn btn-primary" id="chatBtn">전송</button>
		</div>














	</div>	

	<jsp:include page="../common/footer.jsp"/>


</body>
</html>