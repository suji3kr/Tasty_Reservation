<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>가족 단체예약</title>

<!-- Swiper.js CDN 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<style>
body {
	font-family: 'Roboto', sans-serif;
	background-color: #f7f9e9;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

/* ✅ Swiper 스타일 (큰 메인 배너) */
.swiper-container {
    width: 100%;
    max-width: 1200px;
    margin-bottom: 20px;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.swiper-slide {
    display: flex;
    justify-content: center;
    align-items: center;
}

.swiper-slide img {
    width: 100%;
    height: 400px; /* ✅ 메인 배너 크기 */
    object-fit: cover;
    border-radius: 15px;
}

/* ✅ 페이지네이션 위치 조정 */
.swiper-pagination {
    position: relative !important;  
    margin-top: 10px;
    text-align: center;
}

/* ✅ 페이지네이션 점 스타일 */
.swiper-pagination-bullet {
    width: 10px;
    height: 10px;
    background-color: rgba(0, 0, 0, 0.3);
    opacity: 0.6;
    transition: all 0.3s ease-in-out;
}

.swiper-pagination-bullet-active {
    background-color: #4e7300;
    opacity: 1;
    transform: scale(1.2);
}

.swiper-button-next, .swiper-button-prev {
    color: #4e7300;
}

/* ✅ 하단 사진 스타일 (썸네일 목록) */
.photo-section {
    width: 100%;
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 15px;
    margin-top: 20px;
}

.photo-frame {
    width: 250px;  /* ✅ 썸네일 크기 */
    height: 180px; /* ✅ 썸네일 크기 */
    overflow: hidden;
    position: relative;
    display: inline-block;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
}

.photo-frame img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 10px;
}

.photo-frame:hover {
    transform: scale(1.05);
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
}

</style>
</head>

<body>

    <div class="container">
        <!-- ✅ Swiper 슬라이드 (메인 배너) -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="/resources/image/일식 밥.png" alt="일식밥"></div>
                <div class="swiper-slide"><img src="/resources/image/장어덮밥.png" alt="장어덮밥"></div>
                <div class="swiper-slide"><img src="/resources/image/탕수육.png" alt="탕수육"></div>
                <div class="swiper-slide"><img src="/resources/image/jan.png" alt="닭꼬치"></div>
                <div class="swiper-slide"><img src="/resources/image/베트남요리.png" alt="베트남요리"></div>
            </div>
            <!-- 네비게이션 버튼 -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>

        <!-- ✅ 페이지네이션 (슬라이드 하단에 배치) -->
        <div class="swiper-pagination"></div>

        <!-- ✅ 하단 사진 리스트 (썸네일 목록) -->
        <div class="photo-section">
            <div class="photo-frame">
                <a href="https://www.koong.co.kr/2020/index.php"><img src="/resources/image/mandu.png" alt="만두"></a>
            </div>
            <div class="photo-frame">
                <a href="https://www.outback.co.kr/"><img src="/resources/image/stake.png" alt="스테이크"></a>
            </div>
            <div class="photo-frame">
                <a href="https://map.naver.com/p/entry/place/1718170443?placePath=%252Fhome%253Fentry%253Dplt&searchType=place&lng=127.0014545&lat=37.5372131&c=15.00,0,0,0,dh"><img src="/resources/image/디저트.png" alt="디저트"></a>
            </div>
            <div class="photo-frame">
                <a href="https://www.nonamepasta.com/"><img src="/resources/image/파스타.png" alt="파스타"></a>
            </div>
         </div>
    </div>

    <!-- Swiper.js 초기화 -->
    <script>
        var swiper = new Swiper('.swiper-container', {
            loop: true, // 무한 루프
            autoplay: {
                delay: 3000, // 3초마다 자동 슬라이드
                disableOnInteraction: false // 유저가 조작 후에도 자동 슬라이드 유지
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev'
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true
            },
            effect: 'fade' // 부드러운 전환 효과
        });
    </script>

</body>
</html>


