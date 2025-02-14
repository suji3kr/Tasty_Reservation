<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>오늘의 예약 손님 관리</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: 'Roboto', sans-serif;
	background-color: #f4f7fc;
}

.container {
	margin-top: 50px;
	background: white;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.button-container {
	margin-top: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

/* 예약 등록 버튼 */
.custom-btn-success {
	padding-top: 8px; /* 위쪽 패딩 값 추가 */
	width: 120px;
	border: 8px;
	background: #cbddad; /* 부트스트랩의 success 컬러 */
	color: #fff;
	font-weight: bold;
	text-align: center;
	transition: background 0.3s ease-in-out;
	width: 180px;
}

.custom-btn-success:hover {
	background: #54925b;
}
/* 검색 버튼 스타일 */
.custom-btn-search {
	padding-top: 8px; /* 위쪽 패딩 값 추가 */
	width: 120px;
	height: 38px;
	border-radius: 8px;
	border: none;
	background: #cbddad;; /* 부트스트랩의 primary 색상 */
	color: #fff;
	font-weight: bold;
	text-align: center;
	transition: background 0.3s ease-in-out;
	width: 130px; /* 버튼 너비 */
}

.custom-btn-search:hover {
	background: #54925b; /* 호버 시 색상 변경 */
}

/* 버튼 컨테이너 */
.button-container {
	margin-top: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<h3 class="text-center">예약 수정</h3>
		<form action="/reservation/update" method="post">
			<input type="hidden" name="id" value="${reservation.id}">

			<div class="mb-3">
				<label class="form-label">예약 날짜</label> <input type="date"
					class="form-control" name="reservationDate"
					value="${reservation.reservationDate}" required>
			</div>

			<div class="mb-3">
					    <label for="reservationTime" class="form-label">예약 시간</label> 
					    <select class="form-control" id="reservationTime" name="reservationTime" required>
					        <script>
					            document.addEventListener("DOMContentLoaded", function() {
					                let select = document.getElementById("reservationTime");
					                for (let hour = 9; hour < 22; hour++) {
					                    for (let minute of [0, 30]) { // 30분 단위
					                        let time = hour.toString().padStart(2, '0') + ":" + minute.toString().padStart(2, '0');
					                        let option = document.createElement("option");
					                        option.value = time;
					                        option.textContent = time;
					                        select.appendChild(option);
					                    }
					                }
					            });
					        </script>
					    </select>
					</div>

			<div class="mb-3">
				<label class="form-label">인원 수</label> <input type="number"
					class="form-control" name="peopleCount"
					value="${reservation.peopleCount}" required>
			</div>

			<div class="mb-3">
				<label class="form-label">연락처</label> <input type="text"
					class="form-control" name="phone" value="${reservation.phone}"
					required>
			</div>


			<button type="submit" class="btn btn-primary">수정 완료</button>
			<a href="/reservation/admin" class="btn btn-secondary">취소</a>
		</form>
	</div>

	<!-- Bootstrap JS -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
