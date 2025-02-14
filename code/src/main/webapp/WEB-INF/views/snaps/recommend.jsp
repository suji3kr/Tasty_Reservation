<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<title>랜덤 음식 추천</title>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}

.container {
	max-width: 800px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	border-radius: 8px;
}

h1 {
	color: #333;
}

.food-image {
	max-width: 400px;
	height: 300px;
	border-radius: 8px;
	margin: 20px 0;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.restaurant-list {
	margin-top: 20px;
}

.restaurant-card {
	background: #fff;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	margin-bottom: 15px;
	text-align: center;
}

.restaurant-card h3 {
	margin: 0;
	font-size: 18px;
}

.restaurant-card p {
	margin: 5px 0;
	color: #555;
}

.restaurant-card a {
	display: inline-block;
	margin-top: 5px;
	padding: 5px 10px;
	background-color: #45a552;
	color: white;
	text-decoration: none;
	border-radius: 4px;
}

.restaurant-card a:hover {
	background-color: #306d39;
}

button {
	margin-top: 20px;
	padding: 10px 20px;
	font-size: 16px;
	color: #fff;
	background-color: #45a552;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #306d39;
}
</style>
</head>

<body>
	<div class="container">
		<h1>AI 랜덤 음식 추천</h1>
		<h2>"나는 지금 ${food} 이(가) 땡긴다."</h2>

		<!-- 네이버 이미지 검색 결과 표시 -->
		<c:set var="defaultImage"
			value="${pageContext.request.contextPath}/resources/image/logo.jpg" />

		<c:choose>
			<c:when test="${not empty imageUrl}">
				<img src="${imageUrl}" alt="${food}" class="food-image"
					onerror="this.onerror=null; this.src='${defaultImage}'">
			</c:when>
			<c:otherwise>
				<img src="${defaultImage}" alt="기본 이미지" class="food-image">
			</c:otherwise>
		</c:choose>


		<div class="restaurant-list">
			<c:forEach var="restaurant" items="${restaurants}">
				<div class="restaurant-card">
					<h3>${restaurant.name}</h3>
					<p>${restaurant.address}</p>
					<a href="${restaurant.link}" target="_blank">네이버에서 검색 결과 보기</a>
				</div>
			</c:forEach>
		</div>

		<!-- 새로운 랜덤 추천 버튼 -->
		<form>
			<button type="submit">다른 음식 추천 받기</button>
		</form>

	</div>
</body>
</html>
