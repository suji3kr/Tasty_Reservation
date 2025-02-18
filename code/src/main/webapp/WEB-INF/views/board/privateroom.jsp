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
	padding-top: 20px;
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
/* 제목 스타일 */
.title {
	justify-content: center;
	width: 100%;
}

.title h3 {
	max-width: 777px;
	font-family: 'Roboto', sans-serif;
	font-size: 24px;
	font-weight: bold;
	color: #575757;
	background-color: #ffecaf;
	padding: 10px 20px;
	border-radius: 8px;
	text-align: center;
	margin: 0 auto 20px auto; /* 가운데 정렬 */
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

/* 페이지네이션 스타일 */
.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
	gap: 8px;
}

.pagination a, .pagination span {
	display: inline-block;
	padding: 8px 12px;
	font-size: 16px;
	font-weight: bold;
	color: #4e7300;
	background-color: #ffffff;
	border: 1px solid #4e7300;
	border-radius: 5px;
	text-decoration: none;
	transition: all 0.3s ease-in-out;
}

.pagination a:hover {
	background-color: #4e7300;
	color: white;
	transform: scale(1.1);
}

.pagination .active {
	background-color: #4e7300;
	color: white;
	border: none;
}

.pagination .disabled {
	color: #bbb;
	cursor: not-allowed;
	border: 1px solid #ddd;
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
	margin: 10px;
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
	from { opacity: 0.5; }
	to { opacity: 1; }
}

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
	<div class="title custom-title">
		<h3> 스토어별 예약가능한 시간 🍜</h3>
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
document.addEventListener("DOMContentLoaded", function () {
    const photoFrames = document.querySelectorAll(".photo-frame");

    // 가게별 예약 가능한 시간 데이터 (예제)
    const availableTimes = {
    		1: ["6:30", "7:30", "8:30", "9:30"],
    	    2: ["5:00", "6:00", "7:00", "8:00"],
    	    3: ["12:00", "1:00", "2:00", "3:00"],
    	    4: ["12:00", "1:00", "2:00", "3:00"],
    	    5: ["11:30", "12:30", "1:30", "2:30"],
    	    6: ["4:00", "5:00", "6:00", "7:00"],
    	    7: ["10:00", "11:00", "12:00", "1:00"],
    	    8: ["2:30", "3:30", "4:30", "5:30"],
    	    9: ["6:00", "7:00", "8:00", "9:00"],
    	    10: ["5:30", "6:30", "7:30", "8:30"],
    	    11: ["11:00", "12:00", "1:00", "2:00"],
    	    12: ["9:00", "10:00", "11:00", "12:00"]
        // 추가적인 가게 ID와 시간을 여기에 추가
    };

    photoFrames.forEach(frame => {
        const storeId = frame.getAttribute("data-store-id");
        const times = availableTimes[storeId] || [];
        const timeContainer = frame.querySelector(".time-buttons-container");

        // 예약 가능 시간 제목 추가
        const title = document.createElement("div");
        title.innerHTML = "⏰"; // 아이콘 추가
        title.classList.add("time-title");
        timeContainer.appendChild(title);

        // 시간 버튼 생성
        times.forEach(time => {
            const button = document.createElement("button");
            button.textContent = time;
            button.classList.add("time-button");
            button.addEventListener("click", function (event) {
                event.stopPropagation(); // 부모 요소로의 클릭 이벤트 전파 방지
                alert(`예약 시간: ${time} 선택됨!`);
            });
            timeContainer.appendChild(button);
        });

        // 마우스 호버 시 시간 버튼 표시
        frame.addEventListener("mouseenter", function () {
            timeContainer.style.display = "flex";
        });

        // 마우스 아웃 시 시간 버튼 숨기기
        frame.addEventListener("mouseleave", function () {
            timeContainer.style.display = "none";
        });
    });
});

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
		value="${not empty param.amount ? param.amount : 9}"></c:set>
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
				<a href="/board/privateroom?pageNum=${i}&amount=${amount}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:if test="${pageMaker.next}">
		<a href="/board/privateroom?pageNum=${pageMaker.endPage + 1}&amount=${amount}">다음</a>
	</c:if>
</div>
</html>
