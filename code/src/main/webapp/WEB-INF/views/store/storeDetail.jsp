<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${store.storeName} - 상세정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
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
        img {
            border-radius: 5px;
            border: 1px solid #ddd;
            width: 200px;
            height: 200px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">${store.storeName} 상세 정보</h2>

        <div class="row">
            <div class="col-md-6">
                <c:choose>
                    <c:when test="${not empty store.storeImage}">
                        <img src="${store.storeImage}" alt="가게 이미지" onerror="this.onerror=null; this.src='/resources/images/default.jpg'">
                    </c:when>
                    <c:otherwise>
                        <img src="/resources/images/default.jpg" alt="기본 이미지">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-md-6">
                <ul class="list-group">
                    <li class="list-group-item"><strong>이름:</strong> ${store.storeName}</li>
                    <li class="list-group-item"><strong>위치:</strong> ${store.storeLocation}</li>
                    <li class="list-group-item"><strong>설명:</strong> ${store.storeDescription}</li>
                    <li class="list-group-item"><strong>종류:</strong> ${store.storeCategory}</li>
                    <li class="list-group-item"><strong>전화번호:</strong> 
                        <c:choose>
                            <c:when test="${fn:length(store.phoneNumber) == 11}">
                                ${fn:substring(store.phoneNumber, 0, 3)}-${fn:substring(store.phoneNumber, 3, 7)}-${fn:substring(store.phoneNumber, 7, 11)}
                            </c:when>
                            <c:otherwise>
                                ${store.phoneNumber}
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
            </div>
        </div>
        
        <button type="button" class="btn btn-primary mt-3" data-bs-toggle="modal" data-bs-target="#reservationModal">예약하기</button>
        <a href="/board/familyreservation" class="btn btn-secondary mt-3">목록</a>
    </div>

    <!-- 예약 모달 -->
    <div class="modal fade" id="reservationModal" tabindex="-1" aria-labelledby="reservationModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="reservationModalLabel">예약하기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="reservationForm">
                        <input type="hidden" name="storeId" value="${store.id}">
                        <div class="mb-3">
                            <label for="customerName" class="form-label">이름</label>
                            <input type="text" class="form-control" id="customerName" name="customerName" required>
                        </div>
                        <div class="mb-3">
                            <label for="phoneNumber" class="form-label">전화번호</label>
                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
                        </div>
                        <div class="mb-3">
                            <label for="reservationDate" class="form-label">예약 날짜</label>
                            <input type="date" class="form-control" id="reservationDate" name="reservationDate" required>
                        </div>
                        <div class="mb-3">
                            <label for="reservationTime" class="form-label">예약 시간</label>
                            <input type="time" class="form-control" id="reservationTime" name="reservationTime" required>
                        </div>
                        <div class="mb-3">
                            <label for="peopleCount" class="form-label">인원수</label>
                            <input type="number" class="form-control" id="peopleCount" name="peopleCount" min="1" required>
                        </div>
                        <button type="button" class="btn btn-primary" id="submitReservation">예약하기</button>
                    </form>
                </div>
                <div class="modal-footer" id="reservationResult" style="display: none;">
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $('#submitReservation').click(function() {
                var formData = $('#reservationForm').serialize();
                $.ajax({
                    type: 'POST',
                    url: '/reservation',
                    data: formData,
                    success: function(response) {
                        $('#reservationResult').html('<p class="text-success">예약이 완료되었습니다!</p>').show();
                        $('#reservationForm')[0].reset();
                    },
                    error: function() {
                        $('#reservationResult').html('<p class="text-danger">예약에 실패했습니다. 다시 시도해주세요.</p>').show();
                    }
                });
            });
        });
    </script>
</body>
</html>
