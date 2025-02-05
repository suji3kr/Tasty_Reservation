<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${store.storeName} - 상세 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Roboto', sans-serif; background-color: #f4f7fc; }
        .container { margin-top: 50px; background: white; padding: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 8px; }
        img { border-radius: 5px; border: 1px solid #ddd; width: 200px; height: 200px; }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">${store.storeName} 상세 정보</h2>

    <div class="row">
        <div class="col-md-6">
            <c:choose>
                <c:when test="${not empty store.storeImage}">
                    <img src="${store.storeImage}" alt="가게 이미지"
                         onerror="this.onerror=null; this.src='/resources/images/default.jpg'">
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
                <!-- 전화번호를 010-XXXX-XXXX 형식으로 변환 -->
                <li class="list-group-item"><strong>전화번호:</strong> 
                    <c:choose>
                        <c:when test="${fn:length(store.phoneNumber) == 11}">
                            ${fn:substring(store.phoneNumber, 0, 3)}-${fn:substring(store.phoneNumber, 3, 7)}-${fn:substring(store.phoneNumber, 7, 11)}
                        </c:when>
                        <c:otherwise>
                            ${store.phoneNumber} <!-- 11자리가 아닌 경우 그대로 출력 -->
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>
    </div>

    <a href="/board/familyreservation" class="btn btn-secondary mt-3">목록으로 돌아가기</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
