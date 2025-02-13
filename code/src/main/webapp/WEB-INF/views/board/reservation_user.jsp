<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="ko">

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

<body>
	<div class="container">
		<h3 class="text-center">내 예약 리스트</h3>

		<!-- 예약 검색 폼 -->
		<form action="/board/reservation_user" method="get" class="mb-3">
			<div class="row g-3 align-items-center">
				<div class="col-auto">
					<label for="reservationDate" class="col-form-label">예약 날짜:</label>
				</div>
				<div class="col-auto">
					<input type="date" class="form-control" id="reservationDate"
						name="searchDate"
						value="<fmt:formatDate value='${currentDate}' pattern='yyyy-MM-dd'/>"
						required>
				</div>
				<div class="col-auto">
					<button type="submit" class="btn custom-btn-search">검색</button>
				</div>
			</div>
		</form>

		<table class="table table-bordered table-hover">
			<thead class="table-dark">
				<tr>
					<th>예약 시간</th>
					<th>가게 이름</th>
					<th>내 이름</th>
					<th>인원 수</th>
					<th>연락처</th>
					








				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty reservationList}">
						<c:forEach var="reservation" items="${reservationList}">
							<tr style="background-color: #e0f7fa; font-weight: bold;">
								<td><fmt:formatDate value="${reservation.reservationTime}" pattern="HH:mm" /></td>
								<td>${reservation.storeName}</td>
								<td>${reservation.userName} (내 예약)</td>
								<td>${reservation.peopleCount}명</td>
								<td>${reservation.phone}</td>
								<td>
									<span class="badge bg-success">확정</span>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6" class="text-center">
								<strong>📅 현재 예약된 내역이 없습니다.</strong>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<!-- Bootstrap JS -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
