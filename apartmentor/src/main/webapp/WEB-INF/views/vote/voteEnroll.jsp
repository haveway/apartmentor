<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 등록페이지</title>
<style>
    .wrap{
        width:1200px; margin:auto;
    }
    .btnRemove{
        width: 23px;
    }
    .btnRemove:hover{
        cursor: pointer;
    }
</style>
</head>

<body>
    <jsp:include page="../common/header.jsp" />
    <form action="insert.vote" method="post" enctype="multipart/form-data">
        <div class="wrap">
            투표 제목<br>
            <input type="text" size="60" name="voteTitle" placeholder="투표 제목을 입력하세요." required>
            <div class="addItems">
                <br>
                항목 입력 <br>
                <input type="text" size="50" name="itemName" placeholder="항목을 입력하세요." required>
                <input type="file" name="upfile">
                <br>
                <input type="text" size="50" name="itemName" placeholder="항목을 입력하세요." required>
                <input type="file" name="upfile">
                <br>
            </div>
            <br>
            
            <input type="button" class="btnAdd" value="항목추가"><br>
            <hr>
            투표시작일 <input type="date" name="voteStart" id="" required> <br>
            투표마감일 <input type="date" name="voteEnd" id="" required> <br>

            복수선택 가능여부 <input type="checkbox" id="voteType" name="voteType" value="0" id=""> <br>

            <button type="submit">등록</button> <button type="button">취소</button>

            
        </div>  
    </form> 

    <script>
        $(function() {                
                 $('.btnAdd').click (function () {                                        
                     $('.addItems').append (                        
                         '<input type="text" size="50" name="itemName" placeholder="항목을 입력하세요." required>  <input type="file" name="upfile"> <img src="http://drive.google.com/uc?export=view&id=1Id24FLRDSdMWjhoIkyD9EqNiq15ae42x" class="btnRemove"> <br>'                    
                     ); // end append                            
                     $('.btnRemove').on('click', function () { 
                         $(this).prev().prev().remove(); // remove the textbox
                         $(this).prev().remove(); // remove the textbox
                         $(this).next().remove(); // remove the <br>
                         $(this).remove(); // remove the button
                     });
                 }); // end click 
                 
                }); // end ready       
                
        $('#voteType').click(function(){
            if($(this).is(":checked")){
                $('#voteType').val('1');
            } else {
                $('#voteType').val('0');

            }
            

        });
     </script>

</body>
</html>