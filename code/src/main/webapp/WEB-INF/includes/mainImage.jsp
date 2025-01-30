<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>홈 페이지</title>

<!-- Custom CSS -->
<style>
/* 공통 스타일 */
body {
	font-family: 'Roboto', sans-serif;
	background-color: #f4f7fc;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* 컨테이너 설정 */
.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

/* 상단 사진 3개 레이아웃 */
.top-row {
	display: flex;
	justify-content: space-between;
	gap: 20px;
	margin: 20px 0;
}

.photo-frame {
	position: relative;
	border-radius: 15px;
	overflow: hidden;
}

.photo-frame {
	width: 300px;
	position: relative;
	border-radius: 15px;
	overflow: hidden;
}
/* 양쪽 사진은 동일한 크기로 */
.photo-frame.small {
	flex: 2;
}

/* 가운데 사진은 더 넓게 */
.photo-frame.large {
	flex: 2; /* 두 배로 크기를 설정 */
}

.photo-frame img {
	width: 100%;
	height: 300px;
	display: flex;
	justify-content: space-between;
}

.bottom-row {
	width: 1200px;
	height: auto;
	margin: 30px auto;
	text-align: center;
}

.bottom-row img {
	width: 100%;
	height: 100%;
	object-fit: cover; /* 이미지가 컨테이너를 꽉 채우도록 설정 */
	object-position: center; /* 이미지의 중심을 기준으로 자르기 */
	border-radius: 15px;
}

/* 텍스트와 버튼 오버레이 스타일 */
.overlay {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	text-align: center;
	z-index: 1;
}

.overlay h1 {
	font-size: 2rem;
	font-weight: bold;
	margin-bottom: 10px;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
}

.overlay p {
	font-size: 1rem;
	margin-bottom: 20px;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);
}

.overlay a {
	padding: 10px 20px;
	font-size: 1rem;
	color: #fff;
	background-color: #ff7a00;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-shadow: none;
	text-decoration: none; /* 링크 텍스트 장식 제거 */
}

.overlay a:hover {
	background-color: #e66800;
}
</style>
</head>
<body>

<!-- Tiles 헤더 삽입 -->
    <tiles:insertAttribute name="header" />

    <!-- 메인 이미지 섹션 -->
    <section id="main-image">
        <tiles:insertAttribute name="mainImage" ignore="true" />
    </section>


	<div class="container">
		<!-- 상단 사진 3개 -->
		<div class="top-row">
			<!-- 왼쪽 사진 -->
			<div class="photo-frame small">
				<img src="/resources/image/레스토랑1.png" alt="Image 1">
			</div>

			<!-- 가운데 사진 (가로로 더 길게) -->
			<div class="photo-frame small">
				<img src="/resources/image/송아지스테이크.png" alt="Image 2">
				<!-- 오버레이 콘텐츠 -->
				<div class="overlay">
					<h1>Art Of Reservation</h1>
					<p>여행의 미학</p>
					<!-- 버튼을 링크로 변경 -->
					<a href="/board/list">지금 바로 예약하기</a>
				</div>
			</div>

			<!-- 오른쪽 사진 -->
			<div class="photo-frame small">
				<img src="/resources/image/연어레스토랑.png" alt="Image 3">
			</div>
		</div>

		<!-- 하단 큰 사진 -->
		<div class="bottom-row">
			<img src="/resources/image/과일스푼.png" alt="Image 4">
		</div>
	</div>
	
	    <!-- Tiles 푸터 삽입 -->
    <tiles:insertAttribute name="footer" />

</body>
</html>
