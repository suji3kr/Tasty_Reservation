<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

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


	<!-- 메인 이미지 섹션 -->
<section id="home">
    <div id="container">

		<!-- 지도 및 검색 섹션 (최상단) -->
		<div id="info-section">
			<div class="left-section">
				<div id="map" style="width: 100%; height: 400px;"></div>
			</div>
			<div class="right-section">
				<div class="vertical-divider">
					<div class="section-divider">
						<div class="inline-select">
							<label for="location">지역 선택</label> <select id="location">
								<option value="seoul">서울</option>
								<option value="gyeonggi">경기</option>
								<option value="other">그 외 지역</option>
							</select> <select id="sub-location-select" style="display: none;"></select>
						</div>
						<div class="inline-select">
							<label for="date">날짜</label> <input type="date" id="date"
								name="date">
						</div>
						<div class="inline-select">
							<label for="time">시간</label> <select id="time" name="time">
								<c:forEach var="hour" begin="0" end="23">
									<option value="${hour}:00">${hour}:00</option>
								</c:forEach>
							</select>
						</div>
						<div class="inline-select">
							<label for="guests">인원</label> <select id="guests" name="guests">
								<c:forEach var="num" begin="1" end="12">
									<option value="${num}">${num}명</option>
								</c:forEach>
								<option value="more">기타 (직접 입력)</option>
							</select> <input type="text" id="custom-guests" name="custom-guests"
								placeholder="추가 인원 입력" style="display: none;">
						</div>
					</div>
					<div class="section-divider">
						<h3>별점 몇개 까지 허용하시겠습니까? 🚀</h3>
						<label><input type="radio" name="rating" value="5">
							별점 5점🚀</label> <label><input type="radio" name="rating"
							value="4"> 별점 4점대🚀</label> <label><input type="radio"
							name="rating" value="3"> 별점 3점대🚀</label>
					</div>
					<div>
						<h3>오늘의 메뉴는? 🍽️</h3>
						<label><input type="checkbox" name="food-type"
							value="western"> 양식</label> <label><input type="checkbox"
							name="food-type" value="korean"> 한식</label> <label><input
							type="checkbox" name="food-type" value="chinese"> 중식</label> <label><input
							type="checkbox" name="food-type" value="japanese"> 일식</label> <label><input
							type="checkbox" name="food-type" value="brunch"> 브런치</label> <label><input
							type="checkbox" name="food-type" value="dessert"> 디저트/카페</label>
						<button type="button" id="search-restaurants">바로 찾아줄게 ✔</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 메인 이미지 섹션 -->
		<section id="home">
			<div class="container">
				<div class="top-row">
					<div class="photo-frame">
						<img src="/resources/image/레스토랑1.png" alt="Image 1">
					</div>
					<div class="photo-frame">
						<img src="/resources/image/송아지스테이크.png" alt="Image 2">
						<div class="overlay">
							<h1>Art Of Reservation</h1>
							<p>예약의 미학</p>
							<a href="/board/list"> 예약하러가기 📑</a>
						</div>
					</div>
					<div class="photo-frame">
						<img src="/resources/image/연어레스토랑.png" alt="Image 3">
					</div>
				</div>
				<div class="bottom-row">
					<img src="/resources/image/과일스푼.png" alt="Image 4">
				</div>
			</div>
		</section>

	</div>
	<script>
        document.getElementById('guests').addEventListener('change', function() {
            document.getElementById('custom-guests').style.display = (this.value === 'more') ? 'inline-block' : 'none';
        });
        
        document.getElementById('location').addEventListener('change', function() {
            var subLocationSelect = document.getElementById('sub-location-select');
            subLocationSelect.style.display = (this.value !== 'other') ? 'inline-block' : 'none';
            subLocationSelect.innerHTML = "";
            if (this.value === 'seoul') {
                subLocationSelect.innerHTML = "<option value='gangnam'>강남</option><option value='hongdae'>홍대</option><option value='itaewon'>이태원</option>";
            } else if (this.value === 'gyeonggi') {
                subLocationSelect.innerHTML = "<option value='suwon'>수원</option><option value='bundang'>분당</option><option value='ilsan'>일산</option>";
            } else {
                subLocationSelect.innerHTML = "<option value='chungcheong'>충청도</option><option value='gangwon'>강원도</option><option value='jeolla'>전라도</option><option value='gyeongsang'>경상도</option><option value='jeju'>제주도</option>";
            }
        });

        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 37.5665, lng: 126.9780 },
                zoom: 14
            });
        }
        window.onload = initMap;

        // 슬라이드 쇼 기능
        let currentSlide = 0;
        function showSlides() {
            let slides = document.querySelectorAll('.slide');
            slides.forEach(slide => slide.style.display = 'none');
            currentSlide = (currentSlide + 1) % slides.length;
            slides[currentSlide].style.display = 'block';
        }
        setInterval(showSlides, 3000);
    </script>
	<!-- 수정완료 후 메인으로 넘어갈 때 경고창으로 표시 -->
	<c:if test="${not empty sessionScope.updateSuccess}">
		<script>
			alert("수정이 완료되었습니다.");
		</script>
	</c:if>
</section>
</body>
</html>

