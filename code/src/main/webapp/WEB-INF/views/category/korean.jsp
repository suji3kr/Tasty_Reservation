<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <title>한식</title>
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
        <h1>한식 맛집</h1>
        
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
            <a href="http://www.mdkj.co.kr/" target="_blank">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNTmLAs0WWU1KWvBlUDat-U6jHqNRMpf4e3w&s" alt="Kimchi House">
            </a>
            <div class="card-body">
                <div class="card-title">명동 교자</div>
                <div class="card-text">미슐랭에도 나온 맛집</div>
            </div>
        </div>
        
        <div class="card">
            <a href="http://gaoriand.com/" target="_blank">
                <img src="https://cdn.imweb.me/thumbnail/20201103/d3c6b71d82cf7.jpg" alt="Bibimbap Spot">
            </a>
            <div class="card-body">
                <div class="card-title">가오리와 방패연</div>
                <div class="card-text">정갈한 한정식집</div>
            </div>
        </div>
        
    </div>
</body>
</html>