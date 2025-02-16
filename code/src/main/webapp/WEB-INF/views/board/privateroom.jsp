<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>프리베잇 룸</title>

<style>
body {
	font-family: 'Roboto', sans-serif;
	background-color: #e5ebbc;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	background-color: #f7f9e9;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

/* 필터 섹션 */
.filter-section {
	width: 1002px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	background-color: white;
	padding: 15px;
	padding-left: 84px;
	padding-right: 84px;
	border-radius: 10px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	animation: slideUp 0.8s ease-in-out; /* 슬라이드 업 애니메이션 */
}

/* 필터 그룹 */
.filter-group {
	flex-direction: column;
	align-items: center;
	padding: 3px 0;
	justify-content: center;
	padding-top: 13px;
}

.filter-stargroup {
	/* 	display: flex; */
	flex-direction: column;
	align-items: center;
	padding-top: 6px; /* 위쪽 패딩 값 추가 */
	padding-bottom: 5px; /* 아래쪽 패딩은 기존처럼 유지 */
}

.filter-checkgroup {
	/* 	display: flex; */
	flex-direction: column;
	align-items: center;
	padding-top: 13px; /* 위쪽 패딩 값 추가 */
	padding-bottom: 5px; /* 아래쪽 패딩은 기존처럼 유지 */
}

.filter-checkgroup select:hover {
	border-color: #999;
}

/* 레이블 스타일 강화 */
.filter-checkgroup label {
	font-weight: bold;
	color: #333;
	margin-bottom: 8px;
}

.filter-checkgroup label {
	font-weight: bold;
	margin-bottom: 5px;
}

.filter-pricegroup {
	flex-direction: column;
	align-items: center;
	padding-top: 10px; /* 위쪽 패딩 값 추가 */
	padding-bottom: 5px; /* 아래쪽 패딩은 기존처럼 유지 */
}

/* price-range select 스타일 추가 */
.filter-pricegroup select {
	padding: 5px 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: white;
	margin-top: 5px;
}

/* price-range select 호버 효과 */
.filter-pricegroup select:hover {
	border-color: #999;
}

/* 레이블 스타일 강화 */
.filter-pricegroup label {
	font-weight: bold;
	color: #333;
	margin-bottom: 8px;
}

.filter-group label {
	font-weight: bold;
	margin-bottom: 5px;
}

.filter-group select, .filter-group input, .filter-group button {
	padding: 3px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

/* 버튼 스타일 */
.time-buttons {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 10px;
	margin-top: 10px;
}

.time-buttons button {
	padding: 10px 15px;
	background-color: #4e7300;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
}

/* 버튼 호버 효과 */
.time-buttons button:hover {
	background-color: #3b5a00;
	transform: scale(1.1); /* 살짝 커지는 효과 */
}

/* 버튼 클릭 효과 */
.time-buttons button:active {
	transform: scale(0.95); /* 살짝 눌리는 효과 */
	box-shadow: none;
}

/* 사진 섹션 */
.photo-section {
	width: 100%;
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 20px;
}

.photo-frame {
	width: 380px;
	overflow: hidden;
	position: relative;
	display: inline-block;
	animation: fadeIn 1.5s ease-in-out; /* 사진도 페이드 인 */
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	

}

.photo-frame img {
	width: 100%;
	height: 300px;
	border-radius: 15px;
	object-fit: cover;
	transition: transform 0.3s ease-in-out;
}

/* 예약 가능한 시간 버튼 컨테이너 */
.time-buttons-container {
	position: absolute;
	bottom: 10px;
	left: 50%;
	transform: translateX(-50%);
	background: rgb(223 212 182/ 85%); /* 반투명 배경 */
	padding: 8px 10px;
	border-radius: 15px;
	display: none;
	text-align: center;
	z-index: 10;
	width: 90%;
	display: flex;
	justify-content: center;
	gap: 8px;
	flex-wrap: wrap;
}

.time-title {
	font-size: 16px;
	font-weight: bold;
	color: #444;
	margin-bottom: 5px;
}

/* 시간 버튼 스타일 */
.time-button {
	font-size: 14px;
	border: none;
	background-color: rgb(46 89 43/ 76%); /* 연한 오렌지색 */
	color: black;
	cursor: pointer;
	border-radius: 8px;
	padding: 6px 10px;
	transition: all 0.3s ease-in-out;
}

.time-button:hover {
	background-color: #ff9900;
	transform: scale(1.1);
}


.photo-frame:hover {
	transform: scale(1.05);
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
}

/* 애니메이션 */
@keyframes fadeIn {
	from { opacity: 0; }
	to { opacity: 1; }
}

@keyframes slideUp {
	from { transform: translateY(20px); opacity: 0; }
	to
</style>


</head>
<body>

	<div class="container">
		<div class="filter-section">
			<div class="filter-group">
				<label for="location">지 역</label> <select id="location">
					<option value="seoul">서울</option>
					<option value="gyeonggi">경기</option>
					<option value="other">그 외 지역</option>
				</select> <select id="sub-location-select">
					<option value='gangnam'>강남</option>
					<option value='hongdae'>홍대</option>
					<option value='itaewon'>이태원</option>
					<option value='gangbuk'>강북</option>
					<option value='yeouido'>여의도</option>
					<option value='jamsil'>잠실</option>
					<option value='dongdaemun'>동대문</option>
					<option value='myeongdong'>명동</option>
					<option value='sinchon'>신촌</option>
					<option value='yeoksam'>역삼</option>
					<option value='seocho'>서초</option>
					<option value='apgujeong'>압구정</option>
					<option value='samseong'>삼성</option>
					<option value='guro'>구로</option>
					<option value='yeongdeungpo'>영등포</option>
					<option value='konkuk'>건대입구</option>
					<option value='jongno'>종로</option>
					<option value='sadang'>사당</option>
					<option value='gangnam_station'>강남역</option>
					<option value='samsung_station'>삼성중앙역</option>
				</select>
			</div>

			<div class="filter-group">
				<label for="date">예약 날짜</label> <input type="date" id="date"
					name="date">
			</div>

			<div class="filter-group">
				<label for="time">시 간</label> <select id="time" name="time">
					<c:forEach var="hour" begin="10" end="23">
						<option value="${hour}:00">${hour}:00</option>
						<option value="${hour}:30">${hour}:30</option>
					</c:forEach>
				</select> <select id="duration" name="duration">
					<option value="2">2시간</option>
					<option value="3">3시간</option>
					<option value="4">4시간</option>
				</select>
			</div>

			<div class="filter-group">
				<label for="guests">인원 수</label> <select id="guests" name="guests">
					<c:forEach var="num" begin="2" end="10">
						<option value="${num}">${num}명</option>
					</c:forEach>
					<option value="more">기타</option>
				</select> <input type="text" id="custom-guests" name="custom-guests"
					placeholder="인원 입력" style="display: none;">
			</div>

			<div class="filter-checkgroup">
				<label><b>룸 타입</b></label> <input type="checkbox" name="room-type"
					value="vip"> VIP룸 <input type="checkbox" name="room-type"
					value="business"> 비즈니스룸 <input type="checkbox"
					name="room-type" value="family"> 패밀리룸
			</div>

			<div class="filter-group">
				<form action="/privateroom/search" method="get">
					<input type="text" class="form-control me-2" name="searchKeyword"
						placeholder="프라이빗 룸 검색">
					<button type="submit" class="btn btn-primary">찾아줄게 ✔</button>
				</form>
			</div>
			<div class="filter-pricegroup">
				<label><b>예약 가격</b></label> <select id="price-range"
					name="price-range">
					<option value="all">전체</option>
					<option value="0-30000">3만원 이하</option>
					<option value="30000-50000">3만원-5만원</option>
					<option value="50000-100000">5만원-10만원</option>
					<option value="100000">10만원 이상</option>
				</select>
			</div>
		</div>
	</div>

	<div class="photo-section">
		<div class="photo-frame">
			<a href="http://localhost:8092/store/detail?id=11"><img
				src="/resources/image/nulmokssambab.jpg" alt="늘목쌈밥"></a>
		</div>
		<div class="photo-frame">
			<a href="http://localhost:8092/store/detail?id=2"><img
				src="/resources/image/베트남요리.png" alt="베트남요리"></a>
		</div>
		<div class="photo-frame">
			<a href="http://localhost:8092/store/detail?id=3"><img
				src="/resources/image/관자요리.jpg" alt="관자요리"></a>
		</div>
	</div>
	<div class="time-buttons">
		<button>6:00</button>
		<button>6:30</button>
		<button>7:00</button>
		<button>7:30</button>
		<button>8:00</button>
		<button>8:30</button>
		<button>9:30</button>
	</div>
	<!-- 스토어 리스트 -->
	<div class="body">
		<h2 class="text-center"></h2>
		<div class="photo-section">
			<c:forEach var="store" items="${storeList}">
				<div class="photo-frame" data-store-id="${store.id}">
					<a href="/store/detail?id=${store.id}"> <c:choose>
							<c:when test="${not empty store.storeImage}">
								<%-- <img src="${store.storeImage}" alt="가게 이미지"
										onerror="this.onerror=null; this.src='/resources/images/default.jpg'"> --%>
								<img src="${store.storeImage}" alt="가게 이미지">
							</c:when>
							<c:otherwise>
								<img src="/resources/images/default.jpg" alt="default">
							</c:otherwise>
						</c:choose>
					</a>
					<div class="time-buttons-container"></div>
				</div>
			</c:forEach>
		</div>
	</div>

</body>


<script>
	// 날짜 선택 시 오늘 이전 날짜 선택 제한
	const dateInput = document.getElementById('date');
	const today = new Date().toISOString().split('T')[0];
	dateInput.setAttribute('min', today);

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
					        subLocationSelect.innerHTML = `
					            <option value='gangnam'>강남</option>
					            <option value='hongdae'>홍대</option>
					            <option value='itaewon'>이태원</option>
					            <option value='gangbuk'>강북</option>
					            <option value='yeouido'>여의도</option>
					            <option value='jamsil'>잠실</option>
					            <option value='dongdaemun'>동대문</option>
					            <option value='myeongdong'>명동</option>
					            <option value='sinchon'>신촌</option>
					            <option value='yeoksam'>역삼</option>
					            <option value='seocho'>서초</option>
					            <option value='apgujeong'>압구정</option>
					            <option value='samseong'>삼성</option>
					            <option value='guro'>구로</option>
					            <option value='yeongdeungpo'>영등포</option>
					            <option value='konkuk'>건대입구</option>
					            <option value='jongno'>종로</option>
					            <option value='sadang'>사당</option>
					            <option value='gangnam_station'>강남역</option>
					            <option value='samsung_station'>삼성중앙역</option>
					        `;
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

<!-- 페이징처리 -->
<div class="pagination">

	<c:set var="amount"
		value="${not empty param.amount ? param.amount : 10}"></c:set>
	<c:set var="pageNum"
		value="${not empty param.pageNum ? param.pageNum : 1}"></c:set>

	<c:if test="${pageMaker.prev}">
		<a
			href="/board/familyreservation?pageNum=${pageMaker.startPage - 1}&amount=${amount}">이전</a>
	</c:if>

	<c:forEach var="i" begin="${pageMaker.startPage}"
		end="${pageMaker.endPage}">
		<c:choose>
			<c:when test="${i == pageNum}">
				<span class="current-page">${i}</span>
			</c:when>
			<c:otherwise>
				<a href="/board/familyreservation?pageNum=${i}&amount=${amount}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:if test="${pageMaker.next}">
		<a
			href="/board/familyreservation?pageNum=${pageMaker.endPage + 1}&amount=${amount}">다음</a>
	</c:if>
</div>
</html>
