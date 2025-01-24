<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Art Of Reservation</title>

    <!-- Custom CSS -->
    <style>
        /* 공통 스타일 */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f4f7fc;
        }
	    /* 헤더 스타일 */
	    header {
	        background-color: white;
	        border-bottom: 1px solid #e7e7e7;
	    }
	
	    /* 컨테이너 설정: 중앙 정렬 및 양쪽 여백 */
	    .head-container {
	        max-width: 1200px; /* 중앙 정렬의 최대 너비 설정 */
	        margin: 0 auto;    /* 화면 중앙에 정렬 */
	        padding: 10px 10px; /* 내부 여백 설정 (좌우 여백을 10px로 줄임) */
	        display: flex;     /* 플렉스 레이아웃 적용 */
	        justify-content: space-between; /* 로고와 메뉴 간 공간 균등 분배 */
	        align-items: center; /* 세로 중앙 정렬 */
	    }
        /* 로고 스타일 */
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #4e7300;
            text-decoration: none;
        }

        /* 네비게이션 메뉴 */
        nav {
            display: flex;
        }

        nav ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            position: relative;
            margin-right: 20px;
            font-size: 16px;
        }

        nav ul li a {
            text-decoration: none;
            color: #ccc;
            padding: 5px 10px;
        }

        nav ul li a:hover {
            color: #4e7300;
        }

        /* 드롭다운 메뉴 */
        .dropdown-menu {
            display: none;
            position: absolute;
            top: 25px;
            left: 0;
            background-color: #f2f2f2;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: hidden;
            z-index: 1000;
            width: auto;
            padding: 5px 10px;
        }

        .dropdown-menu li {
            padding: 3px 0;
        }

        .dropdown-menu li a {
            font-size: 12px;
            color: gray;
            text-decoration: none;
            white-space: nowrap;
            padding: 3px 10px;
        }

        .dropdown-menu li a:hover {
            background-color: #e0e0e0;
        }

        /* 드롭다운 활성화 */
        nav ul li:hover .dropdown-menu {
            display: block;
        }

        /* 버튼 스타일 */
        .buttons {
            display: flex;
            gap: 10px;
        }

        .buttons .btn {
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 13px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }

        .btn-green {
            background-color: #4e7300;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7); /* 텍스트 가독성을 위한 그림자 */
        }

        .btn-green:hover {
            background-color: #3b5a00;
        }

        .btn-black {
            background-color: black;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7); /* 텍스트 가독성을 위한 그림자 */
        }

        .btn-black:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <!-- 헤더 -->
    <header>
        <!-- 컨테이너: 중앙 정렬 및 양쪽 여백 -->
        <div class="head-container">
            <!-- 로고 -->
            <a href="/" class="logo">Art Of Reservation</a>

            <!-- 네비게이션 메뉴 -->
            <nav>
                <ul>
                    <li>
                        <a href="#"><b>Hot spot</b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">SNS 맛집</a></li>
                            <li><a href="#">포토 스팟</a></li>
                            <li><a href="#">리뷰 스팟</a></li>
                            <li><a href="#">실시간 Ai추천</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><b>Thema</b></a>
                        <ul class="dropdown-menu">
                            <li><a href="/board/familyreservation">가족/단체예약</a></li>
                            <li><a href="#">프라이빗데이트</a></li>
                            <li><a href="#">키즈/노키즈</a></li>
                            <li><a href="#">파티룸</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><b>Favorite</b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">육식파</a></li>
                            <li><a href="#">한식파</a></li>
                            <li><a href="#">채식파</a></li>
                            <li><a href="#">세계 요리</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><b>My profile</b></a>
                        <ul class="dropdown-menu">
                            <li><a href="/board/favfood">즐겨찾는 맛집</a></li>
                            <li><a href="#">예약 맛집</a></li>
                            <li><a href="#">예약 수정</a></li>
                            <li><a href="#">리뷰 관리</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>

            <!-- 버튼 -->
    <div class="buttons">
        <a href="/member/login" class="btn btn-green">Sign in</a>
        <a href="/member/signup" class="btn btn-black">Sign Up</a>
    </div>
        </div>
    </header>
</body>
</html>
