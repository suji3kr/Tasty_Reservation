<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>양식</title>
<style>
.container {
	max-width: 1200px;
	margin: 50px auto;
	padding: 20px;
	text-align: center;
}

.card {
	display: inline-block;
	width: 300px;
	margin: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
}

.card:hover {
	transform: scale(1.05);
}

.card img {
	width: 100%;
	height: 200px;
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
		<h1>양식 맛집</h1>

		<div class="card">
			<a href="https://www.outback.co.kr/" target="_blank"> <img
				src="https://yt3.googleusercontent.com/ytc/AIdro_mdq6uNipbCy7a6ANj7mwfNHMDTo3i9QDnrveyNg7eAeEc=s900-c-k-c0x00ffffff-no-rj"
				alt="Italian Restaurant">
			</a>
			<div class="card-body">
				<div class="card-title">아웃백 스테이크하우스</div>
				<div class="card-text">정통 스테이크와 서비스를 경험 할 수 있는곳!</div>
			</div>
		</div>

		<div class="card">
			<a href="https://www.ivips.co.kr/intro/250203/intro.asp" target="_blank"> <img
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC2ETqtXDAoC3Ol9Qln5c3WbEr6_f4zcWrzQ&s" alt="Japanese Sushi">
			</a>
			<div class="card-body">
				<div class="card-title">빕스</div>
				<div class="card-text">국내에 훈제연어를 퍼트린 대표적인 스테이크집!</div>
			</div>
		</div>

		<div class="card">
			<a href="https://map.naver.com/p/search/%EB%85%B8%EB%A6%AC%ED%83%80/place/36980764?placePath=?entry=pll&from=nx&fromNxList=true&searchType=place&c=15.00,0,0,0,dh" target="_blank"> <img
				src="https://mblogthumb-phinf.pstatic.net/MjAyMDA2MjJfMTYz/MDAxNTkyNzg2NDg5MjAz.gKMefagf95cPbDrMokskKHk_XbjK0bFnLg8kLX3WqBYg.HANirMEfUpu2auaFuW_G1Ol365ggMiR11Ao9d2osYi8g.JPEG.zest2121/P20200618_131407114_70F618C5-3963-4E0E-BB3A-91C19D3499AF.jpg?type=w800" alt="Mexican Taco">
			</a>
			<div class="card-body">
				<div class="card-title">노리타</div>
				<div class="card-text">파스타 화덕피자 등등 맛있는 이탈리안 레스토랑!</div>
			</div>
		</div>

	</div>
</body>
</html>
