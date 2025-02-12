<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>중식</title>
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
		<h2>중식 맛집</h2>

		<div class="card">
			<a
				href="https://map.naver.com/p/entry/place/31442615?lng=127.1114015&lat=37.2748558&placePath=%2Fhome&entry=plt&searchType=place&c=15.00,0,0,0,dh"
				target="_blank"> <img
				src="https://mblogthumb-phinf.pstatic.net/MjAyMzEyMjBfOTEg/MDAxNzAzMDc1NTA2MTY0.ogdoAXzBfKQEXyH6uUSTxl5KFcNi4lxvBJW-PCx372Mg.bt3-BdHGod49dIZe0NNYgLactX7urKIHax1MF1pf_5Ag.JPEG.alexandere20/1.jpg?type=w800"
				alt="Vegan Restaurant">
			</a>
			<div class="card-body">
				<div class="card-title">신상하이 짬뽕</div>
				<div class="card-text">신갈동에 위치한 중식 맛집!</div>
			</div>
		</div>

		<div class="card">
			<a href="http://www.xn--zb0bq16amwh.com/" target="_blank"> <img
				src="https://d12zq4w4guyljn.cloudfront.net/750_750_20240501101823_photo1_8f9a02a7680e.jpg"
				alt="Salad Bar">
			</a>
			<div class="card-body">
				<div class="card-title">짬뽕관</div>
				<div class="card-text">24시간 짬뽕 맛집</div>
			</div>
		</div>

		<div class="card">
			<a href="https://jinjinseoul.modoo.at/?link=a8f4j4xz" target="_blank"> <img
				src="https://mblogthumb-phinf.pstatic.net/MjAyNDA1MjBfMTIz/MDAxNzE2MTM0NDM5Nzcx.sauxCJ-t_EpdKXT6Jm8glr39wEjK8n_6My7Bhf78gZgg.q9sB1tk_O_lkJsuZBAQZjiyjS_4HCwPiVddkKAC0L8kg.JPEG/SE-834f0efe-5a4d-4126-abf5-1dfa0dda1d5c.jpg?type=w800"
				alt="Green Smoothie Place">
			</a>
			<div class="card-body">
				<div class="card-title">진진</div>
				<div class="card-text">미슐랭에도 등재된 중식당!</div>
			</div>
		</div>

	</div>
</body>
</html>
