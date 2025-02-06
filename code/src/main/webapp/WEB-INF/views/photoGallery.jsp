<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<head>
<meta charset="UTF-8">
<title>맛집 갤러리</title>
<!-- 스타일 시트 링크 -->
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">

<style>
/* 페이지 기본 스타일 */
body {
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
	color: #333;
}

h1 {
	text-align: center;
	margin-top: 30px;
	color: #ff6347; /* 맛집에 어울리는 톡톡 튀는 색 */
	font-size: 36px;
	font-weight: bold;
}

/* 갤러리 스타일 */
.gallery {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin: 20px;
	gap: 20px;
}

/* 각 이미지 카드 스타일 */
.photo-item {
	position: relative;
	width: 300px;
	height: 300px;
	overflow: hidden;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
}

/* 이미지에 hover 효과 */
.photo-item:hover {
	transform: scale(1.05);
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
}

/* 이미지 스타일 */
.photo-item img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: opacity 0.3s ease;
}

/* 텍스트 오버레이 (이미지에 텍스트 추가) */
.overlay {
	position: absolute;
	bottom: 20px;
	left: 20px;
	right: 20px;
	color: white;
	font-size: 20px;
	font-weight: bold;
	background-color: rgba(0, 0, 0, 0.5);
	padding: 10px;
	border-radius: 5px;
	text-align: center;
	display: none;
}

/* hover 시 텍스트 오버레이 보이기 */
.photo-item:hover .overlay {
	display: block;
}

/* 뒤로 가는 버튼 스타일 */
.back-btn {
	display: block;
	text-align: center;
	margin-top: 50px;
	font-size: 18px;
	color: #ff6347;
	text-decoration: none;
	padding: 10px 20px;
	background-color: #fff;
	border: 2px solid #ff6347;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}

.back-btn:hover {
	background-color: #ff6347;
	color: white;
}
</style>
</head>
<body>

	<h1>맛집 갤러리</h1>

	<!-- 갤러리 이미지 리스트 -->
	<div class="gallery">
		<!-- 각 사진 항목에 대해 작성된 HTML -->
		<div class="photo-item">
			<img src="<c:url value='/resources/image/일본.png'/>" alt="맛있는 음식1">
			<div class="overlay">서울 최고 맛집</div>
		</div>
		<div class="photo-item">
			<img src="<c:url value='/resources/image/미소야알밥.png'/>" alt="맛있는 음식2">
			<div class="overlay">이태원 인기 맛집</div>
		</div>
		<div class="photo-item">
			<img src="<c:url value='/resources/image/중국딤섬.png'/>" alt="맛있는 음식3">
			<div class="overlay">강남 최고의 레스토랑</div>
		</div>
		<!-- 추가적으로 더 많은 사진들 추가 가능 -->
	</div>

	<!-- 뒤로 가는 버튼 -->
	<div>
		<a href="<c:url value='/'/>" class="back-btn">메인으로 돌아가기</a>
	</div>

</body>
</html>