<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<!-- Bootstrap CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<style>
a {
	text-decoration: none;
}

li {
	list-style: none;
}

body {
	font-family: 'Roboto', sans-serif;
	background-color: #f4f7fc;
}

.login-container {
	max-width: 400px;
	margin: 50px auto;
	background: white;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.login-button, .sns_join {
	width: 360px;
	height: 38px;
	margin-bottom: 5px;
	border-radius: 15px;
	border: none; 
	background : #0d6efd;
	color: #fff;
	background: #0d6efd;
	font-weight: bold;
}

.sns_join {
	text-align : center;
}

.sns_join a{
	
	line-height:38px;
	color: #fff;
}

#sns {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.6);
	background-size: cover;
	background-position: fixed;
	display: none;
}

#sns h2 {
	font-size: 30px;
	color: #fff;
	padding-top: 20px;
}

#sns ul {
	position: absolute;
	top: 35%;
	left: 50%;
	transform: translate(-50%, -30%);
	width: 500px;
	height: 600px;
	animation-name: show1;
	animation-duration: 1s;
}

@keyframes show1 { 0% {
	opacity: 0;
}

100% {
opacity: 1;
}
}

#sns ul li {
	width: 300px;
	height: 70px;
	font-family: 'S-Core Dream 3';
	line-height: 70px;
	border-radius: 5px;
	text-align: left;
	margin: 20px auto;
	color: #fff;
	cursor: pointer;
	font-weight: bold;
}

#sns ul li img {
	width: 50px;
	padding-left: 20px;
	vertical-align: middle;
}

#sns ul li span {
	padding: 0 20px;
}

#sns ul li:nth-child(1) {
	background: #fff;
	color: #000;
}

#sns ul li:nth-child(2) {
	background: #20c702;
}

#sns ul li:nth-child(3) {
	background: #ffeb02;
	color: #000;
}

#sns ul li:nth-child(4) {
	background: #1977f3;
}

#sns ul li:nth-child(5) {
	background: #000;
}

#sns p.close {
	position: absolute;
	top: -40px;
	right: 0;
	font-size: 40px;
	font-weight: bold;
	color: #fff;
	cursor: pointer;
}

p.message1 {
	text-align: center;
	padding-top: 10px;
	height: 20px;
}

p.message2 {
	width :130px;
	height :20px;
	margin : 0 auto;
	text-align: center;
	font-size: 13px;
}

.error-message {
	color: red;
	font-weight: bold;
	text-align: center;
	margin-bottom: 10px;
}
</style>
</head>
<body>

	<div class="login-container">
		<h2 class="text-center">로그인</h2>

		<!-- 로그인 실패 시 메시지 표시 -->
		<c:if test="${not empty errorMessage}">
			<p class="error-message">${errorMessage}</p>
		</c:if>

		<form action="/member/login" method="post">
			<div class="mb-3">
				<label for="email" class="form-label">이메일</label> 
				<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요." required>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">비밀번호</label> 
				<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요." required>
			</div>
			<button type="submit" class="login-button">로그인</button>
		

			<p class="sns_join">
				<a href="#a" onclick="document.getElementById('sns').style.display='block'">SNS 간편 로그인</a>
			</p>

			<!-- SNS 로그인 팝업 -->
			<div id="sns">
				<ul>
					<li><img src="/resources/image/google_icon.jpg"> <span></span>구글 간편 로그인</li>
					<li><img src="/resources/image/naver_icon.jpg"> <span></span>네이버 간편 로그인</li>
					<li><img src="/resources/image/kakao_icon.jpg"> <span></span>카카오톡 간편 로그인</li>
					<li><img src="/resources/image/facebook_icon.jpg"> <span></span>페이스북 간편 로그인</li>
					<li><img src="/resources/image/apple_icon.jpg"> <span></span>Apple 간편 로그인</li>
					<p class="close" onclick="document.getElementById('sns').style.display='none'">x</p>
				</ul>
			</div>
				
			<p class="message1">📢회원이 아니신가요? 지금 바로 가입하세요!📢</p>
			<p class="message2"><a href="/member/signup">회원가입하러가기</a></p>
		</form>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
