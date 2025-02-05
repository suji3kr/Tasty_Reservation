<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>맛집 갤러리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* 스타일 정의 */
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/includes/header.jsp" />

<h1>맛집 갤러리</h1>

<div class="form-container text-center my-4">
    <!-- 업로드 폼 -->
    <form action="<c:url value='/upload'/>" method="post" enctype="multipart/form-data" class="mb-4">
        <input type="file" name="file" class="form-control mb-2">
        <button type="submit" class="btn btn-success w-100">이미지 업로드</button>
    </form>

    <!-- 별점 폼 -->
    <form action="<c:url value='/rate'/>" method="post" class="mb-4">
        <label for="rating" class="form-label">별점 남기기:</label>
        <select name="rating" id="rating" class="form-select mb-2">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>
        <button type="submit" class="btn btn-warning w-100">별점 제출</button>
    </form>

    <!-- 댓글 폼 -->
    <form action="<c:url value='/comment'/>" method="post">
        <textarea name="comment" class="form-control mb-2" rows="3" placeholder="댓글을 남겨주세요"></textarea>
        <button type="submit" class="btn btn-primary w-100">댓글 제출</button>
    </form>
</div>

<div class="gallery">
    <div class="photo-item">
        <img src="<c:url value='/resources/image/일본.png'/>" alt="맛있는 음식1">
        <div class="overlay">서울 최고 맛집</div>
    </div>
    <div class="photo-item">
        <img src="<c:url value='/resources/image/미소야알밥.png'/>" alt="맛있는 음식2">
        <div class="overlay">이태원 인기 맛집</div>
    </div>
    <div class="photo-item">
        <img src="<c:url value='/resources/image/중국딤섬.png'/>" alt="맛있는 음식3">
        <div class="overlay">강남 최고의 레스토랑</div>
    </div>
</div>

<div class="gallery">
    <c:forEach var="photo" items="${photos}">
        <div class="photo-item">
            <a href="<c:url value='/photo/view?id=${photo.id}'/>">
                <img src="<c:url value='${photo.url}'/>" alt="${photo.description}">
                <div class="overlay">${photo.description}</div>
            </a>
        </div>
    </c:forEach>
</div>

<div>
    <a href="<c:url value='/'/>" class="back-btn">메인으로 돌아가기</a>
</div>

</body>
</html>