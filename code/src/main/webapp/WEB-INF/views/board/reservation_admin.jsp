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
	<div class="container">
		<h3 class="text-center">예약 손님 리스트</h3>

		<!-- 예약 검색 폼 -->
		<form action="/reservation/list" method="get" class="mb-3">
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

		<!-- 예약 리스트 -->
		<table class="table table-bordered table-hover">
			<thead class="table-dark">
				<tr>
					<th>예약 시간</th>
					<th>가게 이름</th>
					<th>고객 이름</th>
					<th>인원 수</th>
					<th>연락처</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty reservationList}">
						<c:forEach var="reservation" items="${reservationList}">
							<tr>
								<td><fmt:formatDate value="${reservation.reservationTime}"
										pattern="HH:mm" /></td>
								<td>${reservation.storeName}</td>
								<td>${reservation.userName}</td>
								<td>${reservation.peopleCount}명</td>
								<td><c:choose>
										<c:when test="${fn:length(reservation.phone) == 11}">
											${fn:substring(reservation.phone, 0, 3)}-${fn:substring(reservation.phone, 3, 7)}-${fn:substring(reservation.phone, 7, 11)}
										</c:when>
										<c:otherwise>
											${reservation.phone}
										</c:otherwise>
									</c:choose></td>
								<td>
								<span class="badge bg-success">확정</span>
								<%-- <c:choose>
									<c:when test="${reservation.status == 'CONFIRMED'}">
										<span class="badge bg-success">확정</span>
									</c:when>
									<c:when test="${reservation.status == 'PENDING'}">
										<span class="badge bg-warning">대기</span>
									</c:when>
									<c:when test="${reservation.status == 'CANCELLED'}">
										<span class="badge bg-danger">취소</span>
									</c:when>
									<c:otherwise>
										<span class="badge bg-secondary">미정</span>
									</c:otherwise>
								</c:choose> --%>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6" class="text-center">해당 날짜의 예약이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<!-- 추가 액션 버튼 -->
		<div class="button-container d-flex justify-content-between">
			<a href="/reservation/create" class="btn custom-btn-success">
				예약손님등록🍀</a>
			<div>
				<span class="me-2">총 예약 건수: ${fn:length(reservationList)}건</span>
			</div>
		</div>


		<!-- Bootstrap JS -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>