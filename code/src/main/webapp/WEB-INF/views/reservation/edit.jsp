<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>예약 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h3 class="text-center">예약 수정</h3>

        <!-- 예약 수정 폼 -->
        <form action="/reservation/update" method="post">
            <input type="hidden" name="reservationId" value="${reservation.id}" />
            <div class="mb-3">
                <label for="reservationTime" class="form-label">예약 시간</label>
                <input type="time" class="form-control" id="reservationTime" name="reservationTime" value="<fmt:formatDate value='${reservation.reservationTime}' pattern='HH:mm'/>" required>
            </div>
            <div class="mb-3">
                <label for="peopleCount" class="form-label">인원 수</label>
                <input type="number" class="form-control" id="peopleCount" name="peopleCount" value="${reservation.peopleCount}" required>
            </div>
            <div class="mb-3">
                <label for="phoneNumber" class="form-label">연락처</label>
                <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" value="${reservation.phoneNumber}" required>
            </div>
            <button type="submit" class="btn btn-primary">수정하기</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
