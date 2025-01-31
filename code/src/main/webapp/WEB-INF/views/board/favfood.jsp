<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE html>
<html lang="ko">
<tiles:insertAttribute name="header"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>즐겨찾는 맛집</title>

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
        }

        .photo-gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 40px 20px;
        }

        .photo-gallery img {
            width: 300px;
            height: 200px;
            border-radius: 10px;
            object-fit: cover;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .photo-gallery img:hover {
            transform: scale(1.05);
        }

        .description {
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            margin-top: 20px;
            color: #333;
        }

        .menu-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
        }

        .menu-buttons button {
            padding: 10px 20px;
            font-size: 1rem;
            font-weight: bold;
            color: white;
            background-color: #4e73df;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .menu-buttons button:hover {
            background-color: #3757b0;
        }
    </style>
</head>
<body>

    <!-- 사진 갤러리 -->
    <div class="photo-gallery">
        <img src="/resources/image/포베이쌀국수.png" alt="음식 사진 1">
        <img src="/resources/image/레스토랑1.png" alt="음식 사진 2">
        <img src="/resources/image/레스토랑디저트.png" alt="음식 사진 3">
        <img src="/resources/image/인도음식.png" alt="음식 사진 4">
        <img src="/resources/image/녹차아잉스크림.png" alt="음식 사진 5">
        <img src="/resources/image/송아지스테이크.png" alt="음식 사진 6">
    </div>

    <!-- 설명 -->
    <div class="description">
        최근 방문해주신 맛집 로그🐱‍🏍</div>

    <!-- 메뉴 버튼 -->
    <div class="menu-buttons">
        <button onclick="location.href='/menu1'">최근 방문지</button>
        <button onclick="location.href='/menu2'">나의 페이보릿</button>
        <button onclick="location.href='/menu3'">실시간 예약</button>
    </div>

</body>
<tiles:insertAttribute name="footer"/>
</html>

