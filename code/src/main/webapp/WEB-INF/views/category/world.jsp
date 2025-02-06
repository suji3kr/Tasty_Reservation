<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <title>세계 요리 추천</title>
    <style>
        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            text-align: center;
        }
        .card {
            display: inline-block;
            width: 300px;
            margin: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card img {
            width: 100%;
            height: 200px;
        }
        .card-body {
            padding: 15px;
        }
        .card-title {
            font-size: 20px;
            font-weight: bold;
            margin: 10px 0;
        }
        .card-text {
            font-size: 14px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>세계 요리를 위한 추천 맛집</h1>
        
        <div class="card">
            <img src="${contextPath}/resources/image/이탈리안레스토랑.png" alt="Italian Restaurant">
            <div class="card-body">
                <div class="card-title">이탈리안 레스토랑</div>
                <div class="card-text">정통 이탈리안 요리를 경험할 수 있는 최고의 장소.</div>
            </div>
        </div>
        
        <div class="card">
            <img src="${contextPath}/resources/image/일본스시.png" alt="Japanese Sushi">
            <div class="card-body">
                <div class="card-title">일본 스시</div>
                <div class="card-text">신선한 재료로 만든 정통 스시 요리를 제공합니다.</div>
            </div>
        </div>
        
        <div class="card">
            <img src="${contextPath}/resources/image/멕시칸타코.png" alt="Mexican Taco">
            <div class="card-body">
                <div class="card-title">멕시칸 타코</div>
                <div class="card-text">다양한 타코와 멕시칸 요리를 즐겨보세요!</div>
            </div>
        </div>
        
    </div>
</body>
</html>
