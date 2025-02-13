<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
/* 전체 레이아웃 설정 */
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #eef5e1;
	color: #333;
}

/* 제목 스타일 */
.title-header {
	text-align: center;
	margin-bottom: 20px;
	font-size: 2.5em;
	color: #2d6a4f;
}

/* 대표 이미지 스타일 */
.image-container {
	text-align: center;
	margin: 20px 0;
}

.image-container img {
	width: 30%;
	height: auto;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* 서비스 개요 섹션 */
.section-container {
	margin-top: 40px;
	padding: 20px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

.text-content {
	font-size: 1.1em;
	line-height: 1.6;
}

/* 주요 기능 리스트 */
.feature-list {
	list-style-type: none;
	padding: 0;
}

.feature-item {
	background: #52b788;
	color: white;
	padding: 12px;
	margin: 8px 0;
	border-radius: 5px;
	font-size: 1.1em;
	transition: background 0.3s;
	opacity: 0;
	transform: translateY(30px);
	transition: opacity 1s ease-out, transform 0.6s ease-out;
}

.feature-item.show {
	opacity: 1;
	transform: translateY(0);
}

.feature-item:hover {
	background: #40916c;
}

/* 고객 후기 스타일 */
.review-block {
	border-left: 5px solid #52b788;
	padding-left: 15px;
	font-style: italic;
	margin: 20px 0;
	background: #fff;
	padding: 15px;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.review-author {
	font-size: 0.9em;
	color: #777;
	margin-top: 5px;
}
</style>

<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const items = document.querySelectorAll(".feature-item");
	    items.forEach((item, index) => {
	        const observer = new IntersectionObserver(entries => {
	            entries.forEach(entry => {
	                if (entry.isIntersecting) {
	                    setTimeout(() => {
	                        entry.target.classList.add("show");
	                    }, index * 500); // 각 항목이 순차적으로 나타남
	                }
	            });
	        }, { threshold: 0.5 });
	        observer.observe(item);
	    });
	});

</script>

<body>

<!-- 회사 소개 -->
<h1 class="title-header">Art of Reservation 소개</h1>

<!-- 대표 이미지 -->
<div class="image-container">
	<img
		src="${pageContext.request.contextPath}/resources/image/restaurant.jpg"
		alt="매력적인 레스토랑" class="responsive-img">
</div>

<!-- 서비스 개요 -->
<div class="section-container">
	<p class="text-content">Art of Reservation은 사용자가 손쉽게 원하는 맛집을 예약할 수
		있도록 돕는 온라인 플랫폼입니다. 우리는 단순한 예약 시스템을 넘어, 고객이 최적의 외식 경험을 누릴 수 있도록 다양한 기능과
		맞춤형 추천 서비스를 제공합니다. 사용자는 다양한 레스토랑 정보를 한눈에 확인하고, 실시간으로 자리 예약을 진행할 수
		있습니다. 또한, 사용자의 선호도와 과거 이용 기록을 바탕으로 맞춤형 추천을 제공하여 더욱 만족스러운 선택을 돕습니다.</p>
	<p class="text-content">또한, Art of Reservation은 음식점과 고객 간의 원활한
		커뮤니케이션을 지원합니다. 예약 확인 및 변경이 간편하며, 고객 리뷰 시스템을 통해 솔직한 평가를 공유할 수 있습니다. 자사의
		목표는 단순한 예약 시스템을 넘어, 최고의 외식 경험을 제공하는 것입니다.</p>
</div>

<!-- 주요 기능 -->
<div class="section-container">
	<h3>주요 기능</h3>
	<ul class="feature-list">
		<li class="feature-item">간편한 예약 프로세스</li>
		<li class="feature-item">실시간 예약 확인 및 관리</li>
		<li class="feature-item">고객 지원 서비스</li>
		<li class="feature-item">사용자 리뷰 및 평점 시스템</li>
		<li class="feature-item">맞춤형 추천 시스템</li>
	</ul>
</div>

<!-- 고객 후기 -->
<div class="section-container">
	<h3>고객 후기</h3>
	<blockquote class="review-block">
		<p class="text-content">"Art of Reservation 덕분에 원하는 시간에 맛집 예약이
			쉬워졌어요!"</p>
		<footer class="review-author">- 김민수</footer>
	</blockquote>
	<blockquote class="review-block">
		<p class="text-content">"빠르고 편리한 예약 서비스, 강력 추천합니다."</p>
		<footer class="review-author">- 이서연</footer>
	</blockquote>
	<blockquote class="review-block">
		<p class="text-content">"다양한 맛집 정보를 한눈에 확인하고 예약할 수 있어서 너무 편리해요!"</p>
		<footer class="review-author">- 박지훈</footer>
	</blockquote>
	<blockquote class="review-block">
		<p class="text-content">"예약 변경도 친절하고 신속하게 도와주셔서 너무너무 감사합니다!"</p>
		<footer class="review-author">- 최유진</footer>
	</blockquote>
</div>

</body>