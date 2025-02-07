<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<html>
<head>
<title>일식</title>
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
		<h1>일식 맛집</h1>

		<div class="card">
			<a href="https://map.naver.com/p/entry/place/34550318?lng=127.0368945&lat=37.521843&placePath=%2Fhome&entry=plt&searchType=place&c=15.00,0,0,0,dh" target="_blank"> <img
				src="https://mblogthumb-phinf.pstatic.net/MjAyMjA2MjNfMTQw/MDAxNjU1OTk0MzYyMjk1.btPG_nPZ8PGYwQ-HJ_6Rjzh2Hrtog0lcAwyHZdy7OsAg.uP2FI-HR_T5llyyozShV7I3c-LK_-xM9wtXyGbLBTS8g.JPEG.gurenext/KakaoTalk_20220623_221107523.jpg?type=w800" alt="Steakhouse">
			</a>
			<div class="card-body">
				<div class="card-title">스시코우지</div>
				<div class="card-text">일본인 코우지 쉐프님의 오마카세!</div>
			</div>
		</div>

		<div class="card">
			<a href="http://www.qooqoo.co.kr/" target="_blank"> <img
				src="https://img.siksinhot.com/place/1494104465651744.jpg" alt="BBQ Heaven">
			</a>
			<div class="card-body">
				<div class="card-title">쿠우쿠우</div>
				<div class="card-text">다양한 초밥을 가성비 있게 즐기는 뷔페!</div>
			</div>
		</div>

		<div class="card">
			<a href="https://map.naver.com/p/search/%ED%95%B4%EB%AA%A9/place/1926429712?placePath=?entry=pll&from=nx&fromNxList=true&searchType=place&c=15.00,0,0,0,dh" target="_blank"> <img
				src="https://dw82ptradz9jo.cloudfront.net/daylog/63e1d03c266305c0ce020a15/6a749dd8-5d0a-422b-9380-e52a57f7756e" alt="Burger Joint">
			</a>
			<div class="card-body">
				<div class="card-title">해목</div>
				<div class="card-text">미슐랭에도 등장한 일식 맛집!</div>
			</div>
		</div>

	</div>
</body>
</html>


