<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
<tiles:insertAttribute name="header"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약</title>

    <style>
        /* 버튼 컨테이너 스타일 */
        .button-container {
            display: flex;
            justify-content: space-between; /* 버튼 사이 공간 분배 */
            flex-wrap: wrap; /* 화면 크기에 따라 줄바꿈 */
            gap: 20px; /* 버튼 간 간격 */
            padding: 20px; /* 내부 여백 */
            background-color: #e0e0e0; /* 배경색 */
        }

        /* 버튼 스타일 */
        .button-item {
            flex: 1; /* 동일한 비율로 버튼 크기 조정 */
            max-width: 150px; /* 버튼 최대 너비 */
            text-align: center; /* 텍스트 중앙 정렬 */
            background-color: white; /* 버튼 배경색 */
            border-radius: 50%; /* 원형 버튼 */
            padding: 20px; /* 내부 여백 */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            margin: 0 auto; /* 가운데 정렬 */
        }

        /* 아이콘 스타일 */
        .button-item img {
            width: 50px; /* 아이콘 크기 */
            height: 50px;
            margin-bottom: 10px;
        }

        /* 텍스트 스타일 */
        .button-item p {
            font-size: 14px;
            color: black;
            margin: 0;
        }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/board/filter.jsp" />

    <div class="button-container">
        <div class="button-item">
            <img src="checklist-icon.png" alt="Check List">
            <p>Check List</p>
        </div>
        <div class="button-item">
            <img src="today-icon.png" alt="Today's 추천">
            <p>Today's 추천</p>
        </div>
        <div class="button-item">
            <img src="sns-icon.png" alt="SNS Top 10">
            <p>SNS Top 10</p>
        </div>
        <div class="button-item">
            <img src="local-icon.png" alt="Local_hidden place">
            <p>Local_hidden place</p>
        </div>
        <div class="button-item">
            <img src="photo-icon.png" alt="Photo Spot">
            <p>Photo Spot</p>
        </div>
        <div class="button-item">
            <img src="review-icon.png" alt="Best Review">
            <p>Best Review</p>
        </div>
    </div>
</body>
<tiles:insertAttribute name="footer"/>
