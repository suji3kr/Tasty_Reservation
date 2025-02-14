<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>맛집 갤러리</title>

<style>
/* 페이지 기본 스타일 */
body {
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	margin: 0 auto;
	padding: 0;
	color: #333;
}

h1 {
	text-align: center;
	margin-top: 30px;
	color: #ff6347;
	font-size: 36px;
	font-weight: bold;
}

/* 갤러리 스타일 */
.gallery {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin: 50px;
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
	max-width: 1000px;
}

.back-btn:hover {
	background-color: #ff6347;
	color: white;
}

/* 폼을 중앙에 정렬 */
.form-wrap {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 10px;
	margin-bottom: 100px;
}

/* 업로드 폼 스타일 */
.upload-form {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
	max-width: 900px;
	background-color: #e7c3567d;
	padding: 20px;
	padding-bottom: 35px;
	border-radius: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* 파일 업로드 버튼 */
.upload-form input[type="file"] {
	margin-bottom: 10px;
	width: 100%;
	background-color: white;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* 업로드 버튼 스타일 */
.upload-form button {
	padding: 10px 20px;
	background-color: #eb7229;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 100%;
/* 	max-width: 200px; */
	text-align: center;
}

.upload-form button:hover {
	background-color: #45a049;
}

/* 반응형 디자인 */
@media ( max-width : 768px) {
	.upload-form {
		width: 95%;
		padding: 15px;
	}
	.upload-form button {
		width: 100%;
	}
}

@media ( max-width : 480px) {
	h1 {
		font-size: 28px;
	}
	.upload-form {
		width: 100%;
	}
	.upload-form button {
		width: 100%;
	}
}
</style>
</head>
<body>

	<h1>맛집 갤러리</h1>

	<!-- 갤러리 이미지 리스트 -->
	<div class="gallery">
		<c:forEach var="photo" items="${photos}">
			<div class="photo-item">
				<img src="<c:url value='/resources/image/${photo}'/>" alt="맛있는 음식">
				<div class="overlay">${photo}</div>
			</div>
		</c:forEach>
	</div>

	<!-- 사진 업로드 폼 -->
	<div class="form-wrap">
		<div class="upload-form">
			<h2>내가 생각하는 맛집은 어떤 곳인가요? 🍜</h2>
			<form action="/upload" method="post" enctype="multipart/form-data">
				<input type="file" name="file" accept="image/*" required><button type="submit">업로드</button>
			</form>
		</div>

	</div>
<%-- 	<div class="form-wrap">
		<!-- 뒤로 가는 버튼 -->
		<div>
			<a href="<c:url value='/'/>" class="back-btn">메인으로 돌아가기</a>
		</div>
	</div> --%>


</body>
</html>
