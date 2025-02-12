<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 목록</title>
</head>
<body>
    <h2>예약 목록</h2>
    <table border="1">
        <tr>
            <th>이름</th>
            <th>전화번호</th>
            <th>예약 날짜</th>
            <th>예약 시간</th>
            <th>인원수</th>
            <th>상세 보기</th>
        </tr>
        <c:forEach var="reservation" items="${reservations}">
            <tr>
                <td>${reservation.customerName}</td>
                <td>${reservation.phoneNumber}</td>
                <td>${reservation.reservationDate}</td>
                <td>${reservation.reservationTime}</td>
                <td>${reservation.peopleCount}</td>
                <td>
                    <a href="/reservation/detail?reservationId=${reservation.id}">보기</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
