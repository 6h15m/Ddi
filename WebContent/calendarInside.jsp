<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src="../static/vendor/jquery/jquery.min.js"></script>
<script src="../static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<link href='./css/calendar.css' rel='stylesheet' />
<script src='./js/calendar.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialDate: '2020-12-02',
      editable: true,
      selectable: true,
      businessHours: true,
      dayMaxEvents: true,
      events: [
        {
          title: '비혼 여성의 삶에 관한 연구 인터뷰',
          start: '2020-12-01',
          color: '#E2E2E2',
          textColor: '#000000'
        },
        {
          title: '북토크 데이',
          start: '2020-12-04',
          color: '#E2E2E2',
          textColor: '#000000'
        },
        {
          title: '비혼 컨퍼런스',
          start: '2020-12-21',
          color: '#E2E2E2',
          textColor: '#000000'
        }
      ]
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 0px 0px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>
  <div id='calendar'></div>
</body>
</html>
