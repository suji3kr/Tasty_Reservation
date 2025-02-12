<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>SNS 추천</title>
<!-- Font Awesome for SNS icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
.container {
	max-width: 1200px;
	margin: 50px auto;
	padding: 20px;
	text-align: center;
	border-radius: 8px;
}

.card {
	display: inline-block;
	width: 300px;
	margin: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
	border-radius: 8px;
}

.card:hover {
	transform: scale(1.05);
}

.card img {
	width: 100%;
	height: 200px;
	border-radius: 8px;
}

.card-body {
	padding: 15px;
}

.card-title {
	font-size: 20px;
	font-weight: bold;
	margin: 10px 0;
}

.card-text {
	font-size: 14px;
	color: #555;
}
</style>
</head>
<body>
	<div class="container">
		<h2>SNS맛집 추천리스트</h2>
	
		<div class="card">
			<a href="https://map.naver.com/p/search/%ED%98%B8%EC%8B%9C+%EC%84%9C%ED%98%84%EC%A0%90/place/20144643?c=15.00,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank"> 
			<img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20151020_282%2F1445306328334m0KQz_JPEG%2F166970508866401_1.jpg"
				alt="susi_bar">
			</a>
			<div class="card-body">
				<div class="card-title">호시 _서현본점</div>
				<div class="card-text">분당에서 제일 유명한 스시맛집!</div>
			</div>
			<!-- SNS 아이콘 -->
			<div class="sns-icons">
				<a href="https://facebook.com" target="_blank"><i
					class="fab fa-facebook"></i></a> <a href="https://instagram.com"
					target="_blank"><i class="fab fa-instagram"></i></a> <a
					href="https://twitter.com" target="_blank"><i
					class="fab fa-twitter"></i></a>
			</div>

		</div>

		<div class="card">
			<a href="https://booking.naver.com/booking/6/bizes/608261" target="_blank">
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA4MjhfMTIy%2FMDAxNzI0ODMzNTcxNDI3._ZaQo9VMkDdpVT7s2GR4Bv9D4j1wCjp-N5t6WEgeNNUg.TXSG143akAx6k6tL3-NBGHC8NPmG5eeku_F7F68K4SAg.PNG%2F8.png"
				alt="Green Smoothie Place">
			</a>
			<div class="card-body">
				<div class="card-title">비니에올리</div>
				<div class="card-text">용인 보정동 레스토랑하면 이곳 !</div>
			</div>
			<!-- SNS 아이콘 -->
			<div class="sns-icons">
				<a href="https://facebook.com" target="_blank"><i
					class="fab fa-facebook"></i></a> <a href="https://instagram.com"
					target="_blank"><i class="fab fa-instagram"></i></a> <a
					href="https://twitter.com" target="_blank"><i
					class="fab fa-twitter"></i></a>
			</div>
		</div>
		<div class="card">
			<a
				href="https://mongtan.co.kr/"
				target="_blank"> <img
				src="https://blog.kakaocdn.net/dn/Hkmaf/btsltUEP234/GFUApfmGK7yb86JkCkDG3k/img.jpg"
				alt="MongTan">
			</a>
			<div class="card-body">
				<div class="card-title">몽탄 _삼각지맛집 </div>
				<div class="card-text">서울에서 가장 유명한 고깃집 !</div>
			</div>
			<!-- SNS 아이콘 -->
			<div class="sns-icons">
				<a href="https://facebook.com" target="_blank"><i
					class="fab fa-facebook"></i></a> <a href="https://instagram.com"
					target="_blank"><i class="fab fa-instagram"></i></a> <a
					href="https://twitter.com" target="_blank"><i
					class="fab fa-twitter"></i></a>
			</div>

		</div>

	</div>
</body>
</html>
