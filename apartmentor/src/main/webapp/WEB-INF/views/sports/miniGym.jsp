<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미니GYM 예약</title>
    <link href='<%=request.getContextPath()%>/resources/fullcalendar/main.css' rel='stylesheet' />
    <script src='<%=request.getContextPath()%>/resources/fullcalendar/main.js'></script>
<style>
    .content{
        background-color: rgb(240, 238, 233);
      color: black;
      width: 1200px;
      margin: auto;
      margin-top: 30px;
    }
    
      .btn-div a{
      margin: 0 90px;
   }

    .modal {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        background-color: rgba(0, 0, 0, 0.4);
      }
    
</style>
</head>
<body>

   <jsp:include page="../common/header.jsp" />

   <div class="content">
   
      <div>사진 1, 사진2</div>
   
      <br>
      
      <div class="btn-div">
			<a href="golf.sp" class="btn btn-lg btn-outline-secondary">실내 골프 연습장</a>
			<a href="miniGym.sp" class="query btn btn-lg btn-secondary">미니 GYM</a>
			<a href="" class="btn btn-lg btn-outline-secondary">이용내역</a>
      </div>
                
       <br><br>
       
       <div id='calendar'>
       </div>
       





      
   <script>

     document.addEventListener('DOMContentLoaded', function() {
       var calendarEl = document.getElementById('calendar');
   
       var calendar = new FullCalendar.Calendar(calendarEl, {
         headerToolbar: {
           left: 'prev',
           center: 'title',
           right: 'today next',
         },
         locale : "ko",
         editable: true,
         businessHours: true, 
         selectable: true,
         selectMirror: true,
         select: function(arg) {
          var title = prompt('Event Title:');
           if (title) {
             calendar.addEvent({
               title: title,
               start: arg.start,
               end: arg.end
             })
           }
           console.log();
           calendar.unselect()
         }
       });
   
       calendar.render();
     });
   
   </script>
      
      
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   </div>
<br><br><br>

<jsp:include page="../common/footer.jsp" />
</body>
</html>