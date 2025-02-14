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
<title>당신의 맛집예약을 도와드립니다.</title>

<style>
/* 공통 스타일 */
body {
	font-family: 'Roboto', sans-serif;
	background-color: #ffffff;
	margin: 0;
	padding: 0;
	box-sizing: border-box;

}

/* 컨테이너 설정 */
.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
	display: flex;
	flex-direction: column;
	align-items: center; /* 수평 중앙 정렬 */
	justify-content: center; /* 수직 중앙 정렬 */
	box-sizing: border-box;
}

/* 상단 사진 3개 레이아웃 */
.top-row, .bottom-row {
	width: 100%; /* Use percentages or max-width instead of fixed width */
	display: flex;
	justify-content: center; /* Centers the child elements horizontally */
	align-items: center; /* Centers the child elements vertically */
	margin: 30px 0; /* Adjust as needed for spacing */
}

.photo-frame {
	width: 400px;
	position: relative;
	display: flex;
	margin: 0 30px;
	overflow: hidden;
}

.photo-frame img {
	width: 100%;
	height: 300px;
	display: flex;
	border-radius: 15px;
	justify-content: space-between;
}

.bottom-row img {
	width: 90%;
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

.left-section {
	margin-right: 70px;
	
}

.divide-line {
 	width: 2px;
 	height : 300px;
 	margin : 0 10px;
 	background: #ccc;
}

.right-section {
	text-align: left;
}

#info-section {
	display: flex;
	justify-content: space-around; /* 吏��룄�� �삁�빟 湲곕뒫�쓣 �뼇履쎌쑝濡� �젙�젹 */
	align-items: center;
	padding: 30px 20px;
}

#map {
	width: 400px;
	height: 300px;
	background-color: #ddd;
}

#info-box {
	width: 500px;
}

#reservation-form {
	display: flex;
	flex-direction: column;
	gap: 10px;
	width: 300px;
	background-color: white;
	padding: 15px;
	border-radius: 10px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

#reservation-form label {
	font-weight: bold;
}

#reservation-form select, #reservation-form input, #reservation-form button
	{
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

#reservation-form button {
	background-color: #4e7300;
	color: white;
	font-weight: bold;
	cursor: pointer;
}

#reservation-form button:hover {
	background-color: #3b5a00;
}
</style>
</head>
<body>


	<!-- 메인 이미지 섹션 -->
	<section id="home">
		<div id="container">
			<div class="top-row">
				<div class="photo-frame">
					<img src="/resources/image/res.png" alt="Image 1">
				</div>
				<div class="photo-frame">
					<img src="/resources/image/stake.png" alt="Image 2">
					<div class="overlay">
						<h1>Art Of Reservation</h1>
						<p>예약의 미학</p>
						<a href="/board/familyreservation"> 예약하러가기 📑</a>
					</div>
				</div>
				<div class="photo-frame">
					<img src="/resources/image/salmon.png" alt="Image 3">
				</div>
			</div>
			<div class="bottom-row">
				<img src="/resources/image/spoon.png" alt="Image 4">
			</div>

			<!-- 지도 및 검색 섹션 (최상단) -->
			<div id="info-section">
				<div class="left-section">
					<div id="map" style="width: 500px; height: 400px;"></div>
				</div>
				<div class="divide-line"></div>
				<div class="right-section">
					<div class="vertical-divider">
						<div class="section-divider">
							<div class="inline-select">
								<label for="location">지역 선택</label> <select id="location">
									<option value="seoul">서울</option>
									<option value="gyeonggi">경기</option>
									<option value="other">그 외 지역</option>
								</select> <select id="sub-location-select">
									<option value='gangnam'>강남</option>
									<option value='hongdae'>홍대</option>
									<option value='itaewon'>이태원</option>
								</select>
							</div>
							<div class="inline-select">
								<label for="date">날짜</label> <input type="date" id="date"
									name="date">
							</div>
							<div class="inline-select">
								<label for="time">시간</label> <select id="time" name="time">
									<c:forEach var="hour" begin="10" end="23">
										<option value="${hour}:00">${hour}:00</option>
										<option value="${hour}:30">${hour}:30</option>
									</c:forEach>
								</select>
							</div>
							<div class="inline-select">
								<label for="guests">인원</label> <select id="guests" name="guests">
									<c:forEach var="num" begin="1" end="12">
										<option value="${num}">${num}명</option>
									</c:forEach>
									<option value="more">기타 </option>
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
								value="western"> 양식</label> <label><input
								type="checkbox" name="food-type" value="korean"> 한식</label> <label><input
								type="checkbox" name="food-type" value="chinese"> 중식</label> <label><input
								type="checkbox" name="food-type" value="japanese"> 일식</label> <label><input
								type="checkbox" name="food-type" value="dessert"> 디저트/카페</label>
							<button type="button" id="search-restaurants">바로 찾아줄게 ✔</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

	<script>

	
		window.addEventListener('load', function() {
		    var locationSelect = document.getElementById('location');
		    var subLocationSelect = document.getElementById('sub-location-select');
	
		    // 페이지가 로드될 때 locationSelect의 값을 'seoul'로 설정
		    locationSelect.value = 'seoul';
		});
		
		
        document.getElementById('guests').addEventListener('change', function() {
            document.getElementById('custom-guests').style.display = (this.value === 'more') ? 'inline-block' : 'none';
        });
        
        
        
        document.getElementById('location').addEventListener('change', function() {
            var subLocationSelect = document.getElementById('sub-location-select');
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
        
        <%-- 수정 성공 메시지가 있을 경우 alert 띄우기 --%>
        <% if (request.getAttribute("updateSuccess") != null) { %>
            alert("수정이 완료되었습니다! 🚀");
        <% } %>
    </script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxtdZqbdS6d0jR-vYVhQOtICdiDXq8S_A">
		</script>


</body>
</html>

