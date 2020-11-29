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
  <title>매거진 구매</title>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	
	if (userID == null) { // 로그인이 되어있지 않으면
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
	}
	
	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	if (emailChecked == false) { // 이메일이 체크되어있지 않으면
		PrintWriter script = response.getWriter();			
		script.println("<script>");			
		script.println("location.href = 'emailSendConfirm.jsp'");			
		script.println("</script>");			
		script.close();			
		return;			
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
	
	<div style="background-color:white !important" class="jumbotron">
  		<h3 class="display-5">입금 기간</h3>
  		<hr class="my-2">
  		<h3>2020.12.01 00시 00분 ~ 2020.01.01 23시 59분</h3>
  		<br><br>
  		<h3 class="display-5">입금 계좌 정보</h3>
  		<p class="lead">입금 후 폼을 작성해주세요.</p>
  		<hr class="my-2">
  		<h3>KB국민 812701-04-199513 이예서</h3>
  		<br><br>
  		<h3 class="display-5">최종 금액</h3>
  		<hr class="my-2">
  		<div class = "float-right">
  		<br>
  		상품 가격  <h2 id = "price" style = "display:inline">15,000</h2>원<br><br>
  		배송비  <h2 style = "display:inline">2,500</h2>원<br><br>
  		총 금액  <h2 id = "totalPrice" style = "display:inline">17,500</h2>원
  		</div>
  		<br><br><br><br><br><br>
  		<br><br>
  		</div>
  	<div style="background-color:gray !important" class="jumbotron">
  		<form class="needs-validation" novalidate>
  		<div class="form-row">
      		<label for="validationCustom01">입금자 이름</label>
      		<input type="text" class="form-control" id="validationCustom01" placeholder="구매자 이름" required>
        	<div class="invalid-feedback">
        		구매자 이름을 입력해 주세요.
        	</div>
        <br>
      <label for="validationCustom02">입금액 (숫자만 입력해주세요)</label>
      <input type="text" class="form-control" id="validationCustom02" placeholder="17500" required>
        <div class="invalid-feedback">
        입금액을 입력해 주세요.
        </div>
        <br>
<label for="validationCustom03">입금일 (MM-DD)</label>
      <input type="text" class="form-control" id="validationCustom03" placeholder="12-01" required>
        <div class="invalid-feedback">
        입금일을 입력해 주세요.
        </div>
        <br>
  </div>
  <div class="form-row">
      <label for="validationCustom03">City</label>
      <input type="text" class="form-control" id="validationCustom03" placeholder="City" required>
      <div class="invalid-feedback">
        Please provide a valid city.
      </div>
 <div class="form-row">
      <label for="validationCustom04">State</label>
      <input type="text" class="form-control" id="validationCustom04" placeholder="State" required>
      <div class="invalid-feedback">
        Please provide a valid state.
      </div>
    </div>
 <div class="form-row">
      <label for="validationCustom05">Zip</label>
      <input type="text" class="form-control" id="validationCustom05" placeholder="Zip" required>
      <div class="invalid-feedback">
        Please provide a valid zip.
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
      <label class="form-check-label" for="invalidCheck">
        Agree to terms and conditions
      </label>
      <div class="invalid-feedback">
        You must agree before submitting.
      </div>
    </div>
  </div>
  <button class="btn btn-primary" type="submit">Submit form</button>
</form>
</div>

	
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">

		Copyright ⓒ 2020 띠 All Rights Reserved. </footer>
  	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- Popper 자바스크립트 추가하기 -->
	<script src="./js/popper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	
	<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
</body>
</html>