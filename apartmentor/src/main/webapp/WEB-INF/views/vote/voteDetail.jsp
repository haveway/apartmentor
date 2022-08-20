<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주민투표</title>
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
        <input type="hidden" name="userNo" id="userNo" value="${loginUser.userNo}">
        <input type="hidden" name="voteNo" id="voteNo" value="${v.voteNo}">
        
            <div style="margin-left:300px;">
                <h3>Q. ${v.voteTitle}</h3> 
            </div>
            <div style="margin-left:55%;">
                <button type="button" id="backBtn" class="btn btn-outline-info" onclick="location.href='list.vote'">목록</button>
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
                <c:if test="${v.voteType == 1}"> <!-- voteType이 1이면 복수선택 표시-->
                    복수선택<br>
                </c:if>
                투표기한 : ${v.voteStart} ~ ${v.voteEnd}
                
                <table id="voteItemList">			
                    <c:forEach var="vi" items="${vi}">
                        <tr>
                            <td width="75px;" align="center">
                                    <c:if test="${vi.changeName != 'null'}">
                                        <img src="${vi.changeName}" width="70px;" height="70px;" alt="">
                                    </c:if>
                                    </td>

                            <td width="325px;" height="75px">
                            <c:if test="${v.voteType == 1}">    <!-- voteType이 1이면 체크버튼-->
                                &nbsp;<input style="zoom:1.3;" type="checkbox" name="checkItem" value="${vi.itemNo}"> ${vi.itemName} 
                            </c:if>
                            <c:if test="${v.voteType == 0}">    <!-- voteType이 0이면 라디오 버튼-->
                                &nbsp;<input style="zoom:1.3;" type="radio" name="checkItem" value="${vi.itemNo}"> ${vi.itemName}
                            </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <br>
                <div style="margin-left:150px;">
                    <button type="submit" id="submitVote" class="btn submit" onclick="submitVote();">투표하기</button>
                    <c:if test="${loginUser.userId eq 'admin'}">
                        <button type="button" class="btn btn-outline-info" id="deleteVote" onclick="location.href='delete.vote?voteNo=${v.voteNo}'">투표삭제</button>
                    </c:if>
                </div>
         </div>
         
    </div>

    <script>
         $(function(){
            if("${v.status}" != 'Y'){
                $('#submitVote').attr('disabled', true);
            }
        })

        function submitVote(){
            $("input[name='checkItem']:checked").each(function(){	
	          var itemNo = $(this).val();
              var userNo = $('#userNo').val();
              var voteNo = $('#voteNo').val();

              location.href = "submit.vote?itemNo=" + itemNo + "&userNo=" + userNo + "&voteNo=" + voteNo 

            });
        }

    </script>

</body>
</html>