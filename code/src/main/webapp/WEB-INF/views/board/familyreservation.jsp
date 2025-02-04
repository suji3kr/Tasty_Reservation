<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>가족 단체예약</title>
<style>
body {
	font-family: 'Roboto', sans-serif;
	background-color: #f4f7fc;
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

.filter-section {
	width: 100%;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	background-color: white;
	padding: 15px;
	border-radius: 10px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.filter-group {
	/* 	display: flex; */
	flex-direction: column;
	align-items: center;
	padding: 5px 0;
}

.filter-group label {
	font-weight: bold;
	margin-bottom: 5px;
}

.filter-group select, .filter-group input, .filter-group button {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.time-buttons {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 10px;
	margin-top: 10px;
}

.time-buttons button {
	padding: 10px;
	background-color: #4e7300;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.time-buttons button:hover {
	background-color: #3b5a00;
}

.photo-section {
	width: 100%;
	display: flex;
	justify-content: center;
	/* 	flex-wrap: wrap; */
	gap: 20px;
}

.photo-frame {
	width: 400px;
	position: relative;
}

.photo-frame img {
	width: 100%;
	height: 300px;
	border-radius: 15px;
	object-fit: cover;
}
</style>
</head>
<body>

	<div class="container">
		<div class="filter-section">
			<div class="filter-group">
				<label for="location">지역 선택</label> <select id="location">
					<option value="seoul">서울</option>
					<option value="gyeonggi">경기</option>
					<option value="other">그 외 지역</option>
				</select><select id="sub-location-select">
					<option value='gangnam'>강남</option>
					<option value='hongdae'>홍대</option>
					<option value='itaewon'>이태원</option>
				</select>
			</div>
			<div class="filter-group">
				<label for="date">날짜</label> <input type="date" id="date"
					name="date">
			</div>
			<div class="filter-group">
				<label for="guests">인원</label> <select id="guests" name="guests">
					<c:forEach var="num" begin="6" end="12">
						<option value="${num}">${num}명</option>
					</c:forEach>
					<option value="more">기타</option>
				</select> <input type="text" id="custom-guests" name="custom-guests"
					placeholder="추가 인원 입력" style="display: none;">
			</div>
			<div class="filter-group">
				<label>별점 허용</label> <input type="radio" name="rating" value="5">
				5점 <input type="radio" name="rating" value="4"> 4점대 <input
					type="radio" name="rating" value="3"> 3점대
			</div>
			<div class="filter-group">
				<label>메뉴 선택</label> <input type="checkbox" name="food-type"
					value="western"> 양식 <input type="checkbox" name="food-type"
					value="korean"> 한식 <input type="checkbox" name="food-type"
					value="dessert"> 일식 <input type="checkbox" name="food-type"
					value="dessert"> 중식 <input type="checkbox" name="food-type"
					value="dessert"> 디저트/카페
			</div>
			<div class="filter-group">
				<label for="time">시간</label> <select id="time" name="time">
					<c:forEach var="hour" begin="10" end="23">
						<option value="${hour}:00">${hour}:00</option>
						<option value="${hour}:30">${hour}:30</option>
					</c:forEach>
				</select>
			</div>
			<div class="filter-group">
				<div class="inline-select">
					<label for="kids">아이 손님</label> <select id="kids" name="kids">
						<c:forEach var="num" begin="1" end="5">
							<option value="${num}">${num}명</option>
						</c:forEach>
						<option value="more">기타</option>
					</select> <input type="text" id="custom-kids" name="custom-kids"
						placeholder="추가 인원 입력" style="display: none;">
				</div>
			</div>
			<div class="filter-group">
				<button type="button">바로 찾아줄게 ✔</button>
			</div>
		</div>



		<div class="photo-section">
			<div class="photo-frame">
				<img src="/resources/image/뷔페.jpg" alt="뷔페">
			</div>
			<div class="photo-frame">
				<img src="/resources/image/국물요리.jpg" alt="국물요리">
			</div>
			<div class="photo-frame">
				<img src="/resources/image/관자요리.jpg" alt="관자요리">
			</div>
		</div>
		<div class="time-buttons">
			<button>6:30</button>
			<button>7:30</button>
			<button>8:30</button>
			<button>9:30</button>
		</div>
	</div>

</body>


<script>
	window.addEventListener('load', function() {
		var locationSelect = document.getElementById('location');
		var subLocationSelect = document.getElementById('sub-location-select');

		// 페이지가 로드될 때 locationSelect의 값을 'seoul'로 설정
		locationSelect.value = 'seoul';
	});

	//지역 부가선택
	document
			.getElementById('location')
			.addEventListener(
					'change',
					function() {
						var subLocationSelect = document
								.getElementById('sub-location-select');
						subLocationSelect.innerHTML = "";
						if (this.value === 'seoul') {
							subLocationSelect.innerHTML = "<option value='gangnam'>강남</option><option value='hongdae'>홍대</option><option value='itaewon'>이태원</option>";
						} else if (this.value === 'gyeonggi') {
							subLocationSelect.innerHTML = "<option value='suwon'>수원</option><option value='bundang'>분당</option><option value='ilsan'>일산</option>";
						} else {
							subLocationSelect.innerHTML = "<option value='chungcheong'>충청도</option><option value='gangwon'>강원도</option><option value='jeolla'>전라도</option><option value='gyeongsang'>경상도</option><option value='jeju'>제주도</option>";
						}
					});

	// 인원 입력 스크립트
	document
			.getElementById('guests')
			.addEventListener(
					'change',
					function() {
						// '기타'가 선택되면 'custom-guests' 입력 필드를 표시
						document.getElementById('custom-guests').style.display = (this.value === 'more') ? 'inline-block'
								: 'none';
					});

	// 'custom-guests' 입력 필드에 숫자만 입력할 수 있도록 하고, 입력 시 "명"을 자동으로 붙임
	document.getElementById('custom-guests').addEventListener('input',
			function(e) {
				// 입력 값에서 "명"이 이미 붙어 있는지를 확인하고 제거
				let value = e.target.value;
				if (value.endsWith('명')) {
					value = value.slice(0, -1);
				}
				// 입력 값 중 숫자가 아닌 모든 문자를 제거
				value = value.replace(/\D/g, '');
				// 숫자가 있을 경우에만 "명"을 붙여 입력 필드에 설정
				if (value) {
					e.target.value = value + '명';
				} else {
					e.target.value = '';
				}
			});

	// 아이 인원 입력 스크립트
	document
			.getElementById('kids')
			.addEventListener(
					'change',
					function() {
						// '기타'가 선택되면 'custom-kids' 입력 필드를 표시
						document.getElementById('custom-kids').style.display = (this.value === 'more') ? 'inline-block'
								: 'none';
					});

	// 'custom-kids' 입력 필드에 숫자만 입력할 수 있도록 하고, 입력 시 "명"을 자동으로 붙임
	document.getElementById('custom-kids').addEventListener('input',
			function(e) {
				// 입력 값에서 "명"이 이미 붙어 있는지를 확인하고 제거
				let value = e.target.value;
				if (value.endsWith('명')) {
					value = value.slice(0, -1);
				}
				// 입력 값 중 숫자가 아닌 모든 문자를 제거
				value = value.replace(/\D/g, '');
				// 숫자가 있을 경우에만 "명"을 붙여 입력 필드에 설정
				if (value) {
					e.target.value = value + '명';
				} else {
					e.target.value = '';
				}
			});
</script>
</html>
