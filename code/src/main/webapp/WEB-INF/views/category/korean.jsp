<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <title>한식파 추천</title>
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
        <h1>한식파를 위한 추천 맛집</h1>
        
        <div class="card">
            <a href="https://kimbab1009.com/" target="_blank">
                <img src="https://vidfolio.kr/wp-content/uploads/2019/03/230131_%EA%B9%80%EB%B0%A5%EC%B2%9C%EA%B5%AD.jpg" alt="Korean BBQ">
            </a>
            <div class="card-body">
                <div class="card-title">김밥천국</div>
                <div class="card-text">가성비 있게 찾는다면 여기로</div>
            </div>
        </div>
        
        <div class="card">
            <a href="https://example.com/kimchi-house" target="_blank">
                <img src="${contextPath}/resources/image/해물덮밥.png" alt="Kimchi House">
            </a>
            <div class="card-body">
                <div class="card-title">김치 하우스</div>
                <div class="card-text">다양한 김치 요리를 맛볼 수 있는 곳.</div>
            </div>
        </div>
        
        <div class="card">
            <a href="https://example.com/bibimbap-spot" target="_blank">
                <img src="${contextPath}/resources/image/미소야알밥.png" alt="Bibimbap Spot">
            </a>
            <div class="card-body">
                <div class="card-title">비빔밥 스팟</div>
                <div class="card-text">신선한 재료로 만든 비빔밥의 진수!</div>
            </div>
        </div>
        
    </div>
</body>
</html>