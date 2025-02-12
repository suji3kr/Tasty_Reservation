<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 회사 소개 -->
<h1 class="text-center mb-4">Art of Reservation 소개</h1>

<!-- 대표 이미지 -->
<div class="text-center">
    <img src="${pageContext.request.contextPath}/resources/image/restaurant.jpg"
         alt="매력적인 레스토랑" class="img-fluid">
</div>

<!-- 서비스 개요 -->
<div class="mt-4">
    <p>Art of Reservation은 사용자들이 손쉽게 맛집을 예약할 수 있도록 도와주는 서비스입니다. 우리의
        목표는 고객님들이 더 나은 식사 경험을 할 수 있도록 지원하는 것입니다.</p>
</div>

<!-- 주요 기능 -->
<div class="mt-4">
    <h3>주요 기능</h3>
    <ul>
        <li>간편한 예약 프로세스</li>
        <li>실시간 예약 확인 및 관리</li>
        <li>고객 지원 서비스</li>
        <li>사용자 리뷰 및 평점 시스템</li>
    </ul>
</div>

<!-- 고객 후기 -->
<div class="mt-4">
    <h3>고객 후기</h3>
    <blockquote class="blockquote">
        <p class="mb-0">"Art of Reservation 덕분에 원하는 시간에 맛집 예약이 쉬워졌어요!"</p>
        <footer class="blockquote-footer">김민수</footer>
    </blockquote>
    <blockquote class="blockquote">
        <p class="mb-0">"빠르고 편리한 예약 서비스, 강력 추천합니다."</p>
        <footer class="blockquote-footer">이서연</footer>
    </blockquote>
</div>
