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
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            color: #333;
        }
        h1 {
            text-align: center;
            margin-top: 30px;
            color: #ff6347;
            font-size: 36px;
            font-weight: bold;
        }
        .gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 20px;
            gap: 20px;
        }
        .photo-item {
            position: relative;
            width: 300px;
            height: 300px;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .photo-item:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }
        .photo-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: opacity 0.3s ease;
        }
        .overlay {
            position: absolute;
            bottom: 20px;
            left: 20px;
            right: 20px;
            color: white;
            font-size: 20px;
            font-weight: bold;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            display: none;
        }
        .photo-item:hover .overlay {
            display: block;
        }
        .back-btn {
            display: block;
            text-align: center;
            margin-top: 50px;
            font-size: 18px;
            color: #ff6347;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #fff;
            border: 2px solid #ff6347;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        .back-btn:hover {
            background-color: #ff6347;
            color: white;
        }
        .form-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 20px auto;
        }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/includes/header.jsp" />

<h1>맛집 갤러리</h1>

<div class="form-container text-center my-4">
    <form action="/upload" method="post" enctype="multipart/form-data" class="mb-4">
        <input type="file" name="file" class="form-control mb-2">
        <button type="submit" class="btn btn-success w-100">이미지 업로드</button>
    </form>

    <form action="/rate" method="post" class="mb-4">
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

    <form action="/comment" method="post">
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

<jsp:include page="/WEB-INF/includes/footer.jsp" />

</body>
</html>
