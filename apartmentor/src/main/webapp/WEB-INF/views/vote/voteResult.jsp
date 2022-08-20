<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        font-size: 18px;
    }

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
    <br>
    <br>
    <div class="wrap">
            <div style="margin-left:300px;">
                <h3>Q. ${v.voteTitle}</h3> 
            </div>
            <div style="margin-left:55%;">
                <button type="button" id="backBtn" onclick="location.href='list.vote'">목록</button>
            </div>
            <div style="margin-left:300px">
                <c:if test="${v.status == 'Y'}">
                    [투표진행중]<br>
                </c:if>
                <c:if test="${v.status == 'N'}">
                    [투표완료]<br>
                </c:if>
                <c:if test="${v.status == 'W'}">
                    [투표예정]<br>
                </c:if>
                투표기한 : ${v.voteStart} ~ ${v.voteEnd} <br>
                총 투표자 : ${totalCount}명
                
                    <table id="voteItemList" width="400">
                        <c:forEach var="vi" items="${vi}">
                            <c:set var="totalCount" value="${totalCount}"/>
                            <c:set var="itemCount" value="${vi.itemCount}"/>
                            <fmt:parseNumber var="ratio" value="${itemCount/totalCount*100}" integerOnly="true" />
                            <tr>
                                <td td width="75px;" align="center">
                                    <c:if test="${vi.changeName != 'null'}">
                                        <img src="${vi.changeName}" width="70px;" height="70px;" alt="">
                                    </c:if>
                                </td>
                                <td width="130">

                                        ${vi.itemName}
                                </td>
                                    <td>
                                    <table width="${ratio}">
                                        <tr>
                                            <td bgcolor="#00589b" height="15" style="color:white; font-size:12px;">${ratio}%</td>
                                        </tr>
                                    </table>
                                    </td>
                                <td width="40" align="center">${vi.itemCount}표</td>
                            </tr>	
                        </c:forEach>
                    </table>
                <br>
                <div style="margin-left:150px;">
                    <button type="submit" id="reVote">다시 투표하기</button><br>
                    
                </div>
         </div>
        

    </div>
    <script>

            $('#reVote').click(function(){
                location.href = 're.vote?voteNo=${v.voteNo}&userNo=${loginUser.userNo}'
            });
        
       

        $(function(){
            if("${v.status}" != 'Y'){
                $('#reVote').attr('disabled', true);
            }
        })
   

    </script>

</body>
</html>