<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
    <title>랜덤 음식 추천</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #333;
        }
        .restaurant-list {
            margin-top: 20px;
        }
        .restaurant-card {
            background: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
            text-align: left;
        }
        .restaurant-card h3 {
            margin: 0;
            font-size: 18px;
        }
        .restaurant-card p {
            margin: 5px 0;
            color: #555;
        }
        .restaurant-card a {
            display: inline-block;
            margin-top: 5px;
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .restaurant-card a:hover {
            background-color: #0056b3;
        }
        button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>AI 랜덤 음식 추천</h1>
        <h2>"${food}" 관련 가게 추천 리스트</h2>

        <div class="restaurant-list">
            <c:forEach var="restaurant" items="${restaurants}">
                <div class="restaurant-card">
                    <h3>${restaurant.name}</h3>
                    <p>${restaurant.address}</p>
                    <a href="${restaurant.link}" target="_blank">네이버에서 검색 결과 보기</a>
                </div>
            </c:forEach>
        </div>

        <!-- 새로운 랜덤 추천 버튼 -->
        <form action="recommend" method="get">
            <button type="submit">다른 음식 추천 받기</button>
        </form>
    </div>
</body>
</html>
