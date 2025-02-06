<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<html>
<head>
    <title>육식파 추천</title>
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
        <h1>육식파를 위한 추천 맛집</h1>
        
        <div class="card">
            <img src="${contextPath}/resources/image/송아지스테이크.png" alt="Steakhouse">
            <div class="card-body">
                <div class="card-title">스테이크 하우스</div>
                <div class="card-text">최고급 스테이크와 함께하는 럭셔리한 식사 경험을 제공합니다.</div>
            </div>
        </div>
        
        <div class="card">
            <img src="${contextPath}/resources/image/레스토랑1.png" alt="BBQ Heaven">
            <div class="card-body">
                <div class="card-title">BBQ 천국</div>
                <div class="card-text">다양한 바비큐 요리와 함께 즐기는 맛있는 시간!</div>
            </div>
        </div>
        
        <div class="card">
            <img src="${contextPath}/resources/image/뷔페.jpg" alt="Burger Joint">
            <div class="card-body">
                <div class="card-title">버거 조인트</div>
                <div class="card-text">신선한 재료로 만든 수제 버거의 진수!</div>
            </div>
        </div>
        
    </div>
</body>
</html>


