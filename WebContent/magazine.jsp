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
  <title>Magazine</title>
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
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="./img/magazine1.png">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="./img/magazine2.png">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="./img/magazine3.png">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<div class = "jumbotron">
<h4>매거진 구독 서비스</h4>
<h5>한 달</h5>
<h1>15,000원.</h1>
<p><a class="btn btn-dark btn-lg" href="./buyMagazine.jsp" role="button">Learn more</a>
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