<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세조회</title>
<style>
	.content-area{
		width:1200px;
		height:1200px;
		margin: auto;
	}
	.text-area{
		width: 700px;
		margin: auto;
	}
	.title-area {
		height: 80px;
	}
	.writer-area{
		height: 60px;
	}
	.boardcontent-area{
		height: 200px;
	}
	.upfile-area{
		height: 50px;
		text-align:right;
	}
	.boarea span:first-child {
		font-size: 20px;
		font-weight: bold;
	}
	.boarea span:last-child {
		margin-left:30px;
	}
	.reply-area{
		width: 700px;
		margin: auto;
	}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<div class="content-area">
		<br>
		<br>
		<div align="center" style="margin-right:600px;">
			<h1>자유게시판</h1> 
		</div>
		<hr>
		<br>
		<div class="text-area">
			<div class="title-area boarea">
				<span>제목</span>
				<span>${b.boardTitle}</span>
			</div>
			<hr>
			<div class="writer-area boarea">
				<span>작성자</span>
				<span>${b.boardWriter}</span>
			</div>
			<hr>
			<div class="boardcontent-area">
				<span>${b.boardContent}</span>
			</div>	
			<hr>	
			<div class="upfile-area boarea">
				<span>첨부파일</span>
				<span>
					<c:choose>
						<c:when test="${not empty b.originName}">
		               		<a href="${b.changeName}" download="${b.originName}">${b.originName}</a>
						</c:when>
						<c:otherwise>
							첨부파일이 없습니다.
						</c:otherwise>
					</c:choose>
				</span>
			</div>	
			<hr>
		</div>
		<div align="center" style="margin-right:600px;">
			<h2>댓글</h2> 
		</div>
		<hr>
		<div class="text-area">
			<div id="replyList"></div>
		</div>
		<hr>
		<div class="reply-area">
		<c:choose>
			<c:when test="${ empty loginUser }">
				<textarea class="form-control" readonly cols="55" rows="2" style="resize:none; width:100%;">로그인 후 이용가능합니다.</textarea>
			</c:when>
			<c:otherwise>
				<textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
				<button class="btn btn-primary" onclick="addReply();">댓글작성</button>
			</c:otherwise>
       	</c:choose>
		</div>
	
	</div>
	
	<script>
	
	// 스크립트 영역 도달 시 댓글 조회 기능 호출
	$(function(){
		selectReplyList();
		
	})
	
	// 댓글 조회 기능
	function selectReplyList(){
		
		let loginUserNo = ${loginUser.userNo};
		
		$.ajax({
			url : 'replyList.bo',
			data : {bno : ${b.boardNo} },
			success : function(list){
				let value='';
					for(let i in list){
						value += "<div>"
							   + "<span>" + list[i].replyWriter + "</span>"
							   + "<span>" + list[i].replyContent + "</span>"
							   + "<span>" + list[i].createDate + "</span>"
							   if(loginUserNo == list[i].userNo) { 
							   + "<button class='btn btn-primary'>삭제</button>" 
							   }
							   + "<hr>" 
							   + "</div>"
					}
				$('#replyList').html(value);
				$('#replyList span').attr('style', "margin-right:30px;");
				$('#replyList button').attr('style', "float: right;");
			}, error : function(){
				console.log('비동기요청 실패!');
			}
		})
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>