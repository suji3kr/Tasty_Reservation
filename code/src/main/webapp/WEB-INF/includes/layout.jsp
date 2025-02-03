<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/layout.css">
</head>
<body>
    	<div id="header">
            <tiles:insertAttribute name="header" />
        </div>
	<!-- 지도 및 예약 기능 -->
	<div id="info-section">
		<div id="map" style="width: 500px; height: 350px;"></div>
		<div id="reservation-form">
			<h3>예약하기 🍽️</h3>
			<label for="location">지역선택</label> <select id="location">
				<option value="seoul">서울</option>
				<option value="gyeonggi">경기</option>
				<option value="other">그 외 지역</option>
			</select>
			<div id="sub-location" style="display: none;">
				<label for="sub-location-select">세부지역</label> <select
					id="sub-location-select"></select>
			</div>

			<label for="date">날짜</label> <input type="date" id="date" name="date">

			<label for="time">시간</label> <select id="time" name="time">
				<c:forEach var="hour" begin="0" end="23">
					<option value="${hour}:00">${hour}:00</option>
				</c:forEach>
			</select> <label for="guests">인원</label> <select id="guests" name="guests">
				<c:forEach var="num" begin="1" end="12">
					<option value="${num}">${num}명</option>
				</c:forEach>
				<option value="more">기타 (직접 입력)</option>
			</select> <input type="text" id="custom-guests" name="custom-guests"
				placeholder="추가 인원 입력" style="display: none;">

			<h3>별점 몇개 까지 허용하시겠습니까 ?</h3>
			<label><input type="radio" name="rating" value="5">
				별점 5점🚀</label> <label><input type="radio" name="rating" value="4">
				별점 4점대🚀</label> <label><input type="radio" name="rating" value="3">
				별점 3점대🚀</label>

			<h3>오늘의 메뉴는 ?</h3>
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

	<div id="footer">
		<tiles:insertAttribute name="footer" />
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
    <script
	src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places"></script>

</body>
</html>