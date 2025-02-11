<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 상세 정보</title>
</head>
<body>
    <h2>예약 상세 정보</h2>
    <p><strong>이름:</strong> ${reservation.customerName}</p>
    <p><strong>전화번호:</strong> ${reservation.phoneNumber}</p>
    <p><strong>예약 날짜:</strong> ${reservation.reservationDate}</p>
    <p><strong>예약 시간:</strong> ${reservation.reservationTime}</p>
    <p><strong>인원수:</strong> ${reservation.peopleCount}</p>
</body>
</html>
