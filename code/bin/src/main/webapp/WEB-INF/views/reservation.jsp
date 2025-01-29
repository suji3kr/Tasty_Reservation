<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./includes/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약하기</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7fc;
        }

        .reservation-container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <div class="reservation-container">
        <h2 class="text-center">예약하기</h2>
        <form action="/reservation/submit" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">전화번호</label>
                <input type="tel" class="form-control" id="phone" name="phone" required placeholder="-없이 숫자만 입력">
            </div>
            <div class="mb-3">
                <label for="reservationDate" class="form-label">예약 날짜</label>
                <input type="date" class="form-control" id="reservationDate" name="reservationDate" required>
            </div>
            <div class="mb-3">
                <label for="time" class="form-label">예약 시간</label>
                <input type="time" class="form-control" id="time" name="time" required>
            </div>
            <div class="mb-3">
                <label for="numberOfPeople" class="form-label">인원 수</label>
                <input type="number" class="form-control" id="numberOfPeople" name="numberOfPeople" required min="1">
            </div>
            <button type="submit" class="btn btn-primary w-100">예약하기</button>
        </form>
    </div>

    <footer>
        <p>&copy; 2025 YourCompany. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>