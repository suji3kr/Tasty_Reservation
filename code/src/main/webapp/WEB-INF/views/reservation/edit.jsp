<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오늘의 예약 손님 관리 - 예약 수정 및 삭제</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7fc;
        }
        .container {
            margin-top: 50px;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        .button-container {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }
        /* 수정 버튼 (primary) */
        .btn-primary {
            padding: 8px 20px;
            font-weight: bold;
        }
        /* 취소 버튼 (secondary) */
        .btn-secondary {
            padding: 8px 20px;
            font-weight: bold;
        }
        /* 삭제 버튼 (danger) */
        .btn-danger {
            padding: 8px 20px;
            background-color: #dc3545;
            border: none;
            font-weight: bold;
            border-radius: 8px;
            transition: background 0.3s ease-in-out;
        }
        .btn-danger:hover {
            background-color: #a71d2a;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3 class="text-center">예약 수정</h3>
        <!-- 예약 수정 폼 -->
        <form action="/reservation/update" method="post">
            <input type="hidden" name="id" value="${reservation.id}">
            <div class="mb-3">
                <label class="form-label">예약 날짜</label>
                <input type="date" class="form-control" name="reservationDate" value="${reservation.reservationDate}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">예약 시간</label>
                <select class="form-control" id="reservationTime" name="reservationTime" required>
                    <script>
                        document.addEventListener("DOMContentLoaded", function() {
                            let select = document.getElementById("reservationTime");
                            // 09:00 ~ 21:30 (30분 단위)
                            for (let hour = 9; hour < 22; hour++) {
                                for (let minute of [0, 30]) {
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
                <label class="form-label">인원 수</label>
                <input type="number" class="form-control" name="peopleCount" value="${reservation.peopleCount}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">연락처</label>
                <input type="text" class="form-control" name="phone" value="${reservation.phone}" required>
            </div>
            <div class="button-container">
                <button type="submit" class="btn btn-primary">수정 완료</button>
                <a href="/reservation/admin" class="btn btn-secondary">취소</a>
            </div>
        </form>
        <!-- 삭제 버튼 (AJAX 처리) -->
        <div class="button-container mt-3">
            <button type="button" id="deleteBtn" class="btn btn-danger">삭제</button>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // 삭제 버튼 클릭 시 AJAX로 삭제 요청 처리
        document.getElementById("deleteBtn").addEventListener("click", function() {
            if (confirm("예약을 삭제하시겠습니까?")) {
                // FormData에 예약 id 추가
                const formData = new FormData();
                formData.append("id", "${reservation.id}");
                
                fetch("/reservation/delete", {
                    method: "POST",
                    body: formData
                    // 만약 CSRF 토큰이 필요하다면, headers에 추가해 주세요.
                    // headers: { "X-CSRF-TOKEN": token }
                })
                .then(response => {
                    if (response.ok) {
                        alert("예약이 삭제되었습니다.");
                        // 삭제 후 예약 관리 페이지로 이동 또는 페이지 리로드
                        window.location.href = "/reservation/admin";
                    } else {
                        return response.text().then(text => { throw new Error(text); });
                    }
                })
                .catch(error => {
                    console.error("삭제 오류:", error);
                    alert("삭제 처리 중 오류가 발생하였습니다.");
                });
            }
        });
    </script>
</body>
</html>
