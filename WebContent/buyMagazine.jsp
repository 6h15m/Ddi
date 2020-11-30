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
		if (session.getAttribute("userID") != null) {
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
		style="background: transparent url('img/bar_bg.png') no-repeat center center/cover">
		<a class="navbar-brand" href="index.jsp"><img src="img/title.png"
			width="150px" height="80px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor03" aria-controls="navbarColor03"
			aria-expanded="true" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor03" style="">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="info.jsp">Info</a>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="magazine.jsp">Magazine</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="calendar.jsp">Calendar</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="dropdown"
					data-toggle="dropdown"> My Page </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<%
							if (userID == null) { // 로그인이 되어있지 않으면
						%>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a> <a
							class="dropdown-item" href="userRegister.jsp">회원가입</a>
						<%
							} else {
						%>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
						<%
							}
						%>
					</div></li>
			</ul>

			<form action="./index.jsp" method="get"
				class="form-inline my-2 my-lg-0">

				<input type="text" name="search" class="form-control mr-sm-2"
					placeholder="내용을 입력하세요.">

				<button class="btn btn-outline-light my-2 my-sm-0" type="submit">검색</button>

			</form>

		</div>
	</nav>

	<div style="background-color: white !important" class="jumbotron">
		<h3 class="display-5">입금 기간</h3>
		<hr class="my-2">
		<h3>2020.12.01 00시 00분 ~ 2020.01.01 23시 59분</h3>
		<br> <br>
		<h3 class="display-5">입금 계좌 정보</h3>
		<p class="lead">입금 후 폼을 작성해주세요.</p>
		<hr class="my-2">
		<h3>KB국민 812701-04-199513 이예서</h3>
		<br> <br>
		<h3 class="display-5">최종 금액</h3>
		<hr class="my-2">
		<div class="float-right">
			<br> 상품 가격
			<h2 id="price" style="display: inline">15,000</h2>
			원<br> <br> 배송비
			<h2 style="display: inline">2,500</h2>
			원<br> <br> 총 금액
			<h2 id="totalPrice" style="display: inline">17,500</h2>
			원
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</div>
	<div style="background-color: #C0C0C0 !important"
		class="jumbotron jumbotron-fluid">
		<div class="container">
			<form class="needs-validation" method="post" action="./buyEmailSendAction.jsp" novalidate>
				<div class="form-row">
					<label for="validationCustom01">입금자 이름</label> <input type="text"
						class="form-control" id="validationCustom01" placeholder="구매자 이름"
						required name="depositName" maxlength="20">
					<div class="invalid-feedback">구매자 이름을 입력해 주세요.</div>
					<br> <br> <label for="validationCustom02">입금액
						(숫자만 입력해주세요)</label> <input type="text" class="form-control"
						id="validationCustom02" placeholder="17500" 
						required name="depositMoney" maxlength="20">
					<div class="invalid-feedback">입금액을 입력해 주세요.</div>
					<br> <br> <label for="validationCustom03">입금일
						(MM-DD)</label> <input type="text" class="form-control"
						id="validationCustom03" placeholder="12-01" 
						required name="depositDay" maxlength="20">
					<div class="invalid-feedback">입금일을 입력해 주세요.</div>
					<br>
				</div>
				<br> <br> <br>
				<div class="form-row">
					<label for="validationCustom04">수령인 이름</label> <input type="text"
						class="form-control" id="validationCustom04" placeholder="수령인 이름"
						required name="deliverName" maxlength="20">
					<div class="invalid-feedback">수령인 이름을 입력해 주세요.</div>
					<br>
				</div>
				<br>
				<div class="form-row">
					<label for="validationCustom05">전화번호</label> <input type="text"
						class="form-control" id="validationCustom05"
						placeholder="010-0000-0000" 
						name="phoneNumber" maxlength="30" required>
					<div class="invalid-feedback">전화번호를 입력해 주세요.</div>
					<br>
				</div>
				<br>
				<div class="form-row">
					<label for="validationCustom06">주소</label> <input type="text"
						class="form-control" id="validationCustom06"
						placeholder="서울시 관악구 신림동 호암로 546" 
						name="location" maxlength="40" required>
					<div class="invalid-feedback">주소를 입력해 주세요.</div>
					<br>
				</div>
				<div class="form-row">
					<label for="validationCustom05">우편번호</label> <input type="text"
						class="form-control" id="validationCustom07" placeholder="00000"
						required name="zipCode" maxlength="20">
					<div class="invalid-feedback">우편번호를 입력해 주세요.</div>
					<br>
				</div>
				<br>
				<div class="form-group">
					<div class="form-check">
						<br> <input class="form-check-input" type="checkbox" value=""
							id="invalidCheck" required> <label
							class="form-check-label" for="invalidCheck">입금하셨나요?</label>
						<div class="invalid-feedback">입금 후 폼을 제출해주세요.</div>
					</div>
				</div>
				<div class="form-group">
					<div class="form-check">
						<br> <input class="form-check-input" type="checkbox" value=""
							id="invalidCheck" required> <label
							class="form-check-label" for="invalidCheck">폼 내용을 다시 한번
							확인해주세요.</label>
						<div class="invalid-feedback">폼 내용을 다시 확인해주세요</div>
					</div>
				</div>
				<div class="form-group">
					<div class="form-check">
						<br> <input class="form-check-input" type="checkbox" value=""
							id="invalidCheck" required> <label
							class="form-check-label" for="invalidCheck"> 상품 주문 및 배송을
							위해 위에 입력된 개인정보를 수집합니다. 수집한 개인정보는 주문과 배송 이외의 목적으로는 사용하지 않습니다. </label>
						<div class="invalid-feedback">개인 정보의 수집 및 이용에 대한 동의를 해주세요.</div>
					</div>
				</div>
				<button class="btn btn-dark" type="submit">구매하기</button>
			</form>
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

	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict';
			window.addEventListener('load',
					function() {
						// Fetch all the forms we want to apply custom Bootstrap validation styles to
						var forms = document
								.getElementsByClassName('needs-validation');
						// Loop over them and prevent submission
						var validation = Array.prototype.filter.call(forms,
								function(form) {
									form.addEventListener('submit', function(
											event) {
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