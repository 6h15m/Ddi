<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 부트스트랩 CSS -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="./css/custom.css">
	<style>
  p {font-size: 16px;}
  .margin {margin-bottom: 45px;}
  .bg-1 { 
    background-color: #E2DCE2;
    color: #2f2f2f;
  }
  .bg-2 { 
    background-color: #474e5d; /* Dark Blue */
    color: #ffffff;
  }
  .bg-3 { 
    background-color: #ffffff; /* White */
    color: #555555;
  }
  .container-fluid {
    padding-top: 70px;
    padding-bottom: 70px;
  }
  </style>
  <title>Info</title>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
	style = "background:transparent url('img/bar_bg.png') no-repeat center center /cover">
		<a class="navbar-brand" href="index.jsp"><img src="img/title.png" width = "150px" height = "80px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="true" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarColor03" style="">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="info.jsp">Info</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="magazine.jsp">Magazine</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="calendar.jsp">Calendar</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown"> My Page </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<%
							if (userID == null) { // 로그인이 되어있지 않으면
						%>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
						<a class="dropdown-item" href="userRegister.jsp">회원가입</a>
						<%
							} else {
						%>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
						<%
							}
						%>
					</div>
				</li>
			</ul>

			<form action="./index.jsp" method="get"
				class="form-inline my-2 my-lg-0">

				<input type="text" name="search" class="form-control mr-sm-2"
					placeholder="내용을 입력하세요.">

				<button class="btn btn-outline-light my-2 my-sm-0" type="submit">검색</button>

			</form>

		</div>
	</nav>
	
	<!-- First Container -->
<div class="container-fluid bg-1 text-center">
  <img src="./img/icon3d.png" class="img-responsive margin" style="display:inline" width="350" height="350">
  <br><br><br><h3 class="margin">비혼 여성의 더 나은 내일을 위해, '띠'</h3>
</div>

<!-- Second Container -->
<div class="container-fluid bg-2 text-center">
  <h3 class="margin">For Unmarried Women</h3>
  <p>대한민국에서 비혼 여성으로 산다는 것은 꽤나 어려운 일입니다. <br><br>아직 한국 사회에서 여성의 사회, 경제적 지위는 남성에 비해 열악한 편이기 때문입니다. <br><br>그러면 현재를 살아가고 있는 비혼 여성들은 어떤 방식으로 이 문제를 타개해 나갈까요?<br><br>'띠'는 이러한 궁금증에서부터 시작되었습니다. </p>
</div>

<!-- Third Container (Grid) -->
<div class="container-fluid bg-3 text-center">    
  <h3 class="margin">Directing Point</h3><br>
  <div class="row">
    <div class="col-sm-4">
      <p>비혼 여성들이 보다 편리하게 정보 공유를 하며 서로 연대감을 형성할 수 있도록 돕습니다.</p>
      <br><br><img src="./img/icon1.png" class="img-responsive margin" style="width:50%" alt="Image">
    </div>
    <div class="col-sm-4"> 
      <p>분야, 지역, 성향별 구분을 하지 않고 순수한 정보 공유에 초점을 두고자 댓글 기능을 삭제했습니다.</p>
      <br><br><img src="./img/icon2.png" class="img-responsive margin" style="width:50%" alt="Image">
    </div>
    <div class="col-sm-4"> 
      <p>비혼 여성들의 홀로서기를 응원하며, 띠와 행복한 비혼 라이프를 즐길 수 있도록 노력하겠습니다!</p>
      <br><br><img src="./img/icon3.png" class="img-responsive margin" style="width:50%" alt="Image">
    </div>
  </div>
</div>
	
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">

		Copyright ⓒ 2020 띠 All Rights Reserved. </footer>
  	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- Popper 자바스크립트 추가하기 -->
	<script src="./js/popper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>