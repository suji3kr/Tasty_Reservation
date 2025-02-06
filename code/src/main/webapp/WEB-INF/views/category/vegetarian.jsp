<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <title>채식파 추천</title>
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
        <h1>채식파를 위한 추천 맛집</h1>
        
        <div class="card">
            <img src="${contextPath}/resources/image/비건레스토랑.png" alt="Vegan Restaurant">
            <div class="card-body">
                <div class="card-title">비건 레스토랑</div>
                <div class="card-text">신선한 채소로 만든 다양한 비건 요리를 제공합니다.</div>
            </div>
        </div>
        
        <div class="card">
            <img src="${contextPath}/resources/image/샐러드바.png" alt="Salad Bar">
            <div class="card-body">
                <div class="card-title">샐러드 바</div>
                <div class="card-text">다양한 샐러드를 즐길 수 있는 건강한 선택!</div>
            </div>
        </div>
        
        <div class="card">
            <img src="${contextPath}/resources/image/그린스무디.png" alt="Green Smoothie Place">
            <div class="card-body">
                <div class="card-title">그린 스무디</div>
                <div class="card-text">신선한 스무디로 건강을 챙기세요!</div>
            </div>
        </div>
        
    </div>
</body>
</html>
