<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표결과</title>
<style>
    .wrap{
        width:1200px; margin:auto; 
    }

    #voteItemList tr{
        border: 1px solid gray;
        font-size: 20px;
    }

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
    <br>
    <br>
    <div class="wrap">
        <input type="hidden" name="userNo" id="userNo" value="${loginUser.userNo}">
        <input type="hidden" name="voteNo" id="voteNo" value="${v.voteNo}">
        
            <div style="margin-left:300px;">
                <h3>Q. ${v.voteTitle}</h3> 
            </div>
            <div style="margin-left:300px">
                <c:if test="${v.status == 'Y'}">
                    [투표진행중]<br>
                </c:if>
                <c:if test="${v.status == 'N'}">
                    [투표완료]<br>
                </c:if>
                투표기한 : ${v.voteStart} ~ ${v.voteEnd} <br>
                총 투표자 : 0 명
                
                <table id="voteItemList">			
                    <c:forEach var="vi" items="${vi}">
                        <tr>
                            <td width="200px;" height="75px">
                            &nbsp;${vi.itemName}
                            </td>
                            <td width="75px;">
                                <c:if test="${vi.changeName != 'null'}">
                                    <img src="${vi.changeName}" height="70px;" alt="">
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <br>
                <div style="margin-left:200px;">
                    <button type="submit" onclick="reVote();">다시 투표하기</button>
                </div>
         </div>
          
        

    </div>
    <script>
        function reVote(){
            
        }
   

    </script>

</body>
</html>