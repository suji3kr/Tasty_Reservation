<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>SNS 맛집 추천</title>

<!-- Font Awesome for SNS icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
body {
	font-family: 'Roboto', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #ffffff;
}

.photo-gallery {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 20px;
	padding: 40px 20px;
}

.photo-frame {
	width: 320px;
	text-align: center;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 10px;
}

.photo-frame img {
	width: 100%;
	height: 200px;
	border-radius: 10px;
	object-fit: cover;
	transition: transform 0.3s ease-in-out;
}

.photo-frame img:hover {
	transform: scale(1.05);
}

/* 별점 스타일 */
.star-rating {
	color: #ffd700;
	font-size: 1.2rem;
	margin-top: 5px;
}

.description {
	text-align: center;
	font-size: 1.5rem;
	font-weight: bold;
	margin-top: 20px;
	color: #333;
}

.sns-icons {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 20px;
}

.sns-icons a {
	color: #333;
	font-size: 24px;
	transition: color 0.3s;
}

.sns-icons a:hover {
	color: #ff6347;
}
</style>
</head>
<body>

	<h1 style="text-align: center; color: #ff6347;">SNS 맛집 추천</h1>
	<!-- 사진 갤러리 -->
	<div class="photo-gallery">
		<c:forEach var="store" items="${storeList}">
			<div class="photo-frame">
				<img src="${store.storeImage}" alt="${store.name}">
				<h3>${store.name}</h3>
				
				<!-- 별점 표시 (평균 점수 기반) -->
				<div class="star-rating">
					<c:forEach begin="1" end="${store.rating}">
						<i class="fas fa-star"></i>
					</c:forEach>
					<c:forEach begin="${store.rating + 1}" end="5">
						<i class="far fa-star"></i>
					</c:forEach>
				</div>

				<!-- 순위 표시 -->
				<p style="color: #777; font-size: 14px;">순위: ${store.rank}위</p>
			</div>
		</c:forEach>
	</div>

	<!-- 설명 -->
	<div class="description">SNS 맛집 추천🐱‍🏍</div>
 
	<!-- SNS 아이콘 -->
	<div class="sns-icons">
		<a href="https://facebook.com" target="_blank"><i
			class="fab fa-facebook"></i></a> <a href="https://instagram.com"
			target="_blank"><i class="fab fa-instagram"></i></a> <a
			href="https://twitter.com" target="_blank"><i
			class="fab fa-twitter"></i></a>
	</div>
</body>
</html>
