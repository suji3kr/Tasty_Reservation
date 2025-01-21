<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Art Of Reservation</title>

    <!-- Custom CSS -->
    <style>
        /* 헤더 스타일 */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: white;
            border-bottom: 1px solid #e7e7e7;
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
            align-items: center;
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
            color: black;
            padding: 5px 10px;
        }

        nav ul li a:hover {
            color: #4e7300;
        }
		
		        /* 드롭다운 메뉴 */
		.dropdown-menu {
		    display: none;
		    position: absolute;
		    top: 30px;
		    left: 0;
		    background-color: #f2f2f2;
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		    border-radius: 5px;
		    overflow: hidden;
		    z-index: 1000;
		    width: auto; /* 텍스트 내용에 맞게 자동으로 너비 조정 */
		    padding: 5px 10px; /* 여백 최소화 */
		}
		
		.dropdown-menu li {
		    padding: 3px 0; /* 아이템 간격 최소화 */
		}
		
		.dropdown-menu li a {
		    font-size: 12px; /* 텍스트 크기를 작게 조정 */
		    color: black;
		    text-decoration: none;
		    white-space: nowrap; /* 줄 바꿈 방지 */
		    padding: 3px 10px; /* 텍스트와 좌우 여백 최소화 */
		}
		
		.dropdown-menu li a:hover {
		    background-color: #e0e0e0; /* 마우스 오버 시 배경색 */
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
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }

        .btn-green {
            background-color: #4e7300;
            color: white;
        }

        .btn-green:hover {
            background-color: #3b5a00;
        }

        .btn-black {
            background-color: black;
            color: white;
        }

        .btn-black:hover {
            background-color: #333;
        }

        /* 드롭다운 활성화 */
        nav ul li:hover .dropdown-menu {
            display: block;
        }
    </style>
</head>
<body>
<header>
    <!-- 로고 -->
    <a href="/" class="logo">Art Of Reservation</a>

    <!-- 네비게이션 메뉴 -->
    <nav>
        <ul>
            <li>
                <a href="#">Hot spot</a>
                <!-- 드롭다운 메뉴 -->
                <ul class="dropdown-menu">
                    <li><a href="#">SNS 맛집</a></li>
                    <li><a href="#">포토 스팟</a></li>
                    <li><a href="#">리뷰 스팟</a></li>
                    <li><a href="#">실시간 Ai추천</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Thema</a>
                <!-- 드롭다운 메뉴 -->
                <ul class="dropdown-menu">
                    <li><a href="#">가족/단체예약</a></li>
                    <li><a href="#">프라이빗데이트</a></li>
                    <li><a href="#">키즈/노키즈</a></li>
                    <li><a href="#">파티룸</a></li>
                </ul>
            </li>
            <li><a href="#">Favorite</a>
            <!-- 드롭다운 메뉴 -->
                <ul class="dropdown-menu">
                    <li><a href="#">육식파</a></li>
					<li><a href="#">한식파</a></li>
					<li><a href="#">채식파</a></li>
					<li><a href="#">세계 요리</a></li>
                </ul>
            </li>
            <li><a href="#">My profile</a>
            <!-- 드롭다운 메뉴 -->
                <ul class="dropdown-menu">
                    <li><a href="#">즐겨찾는 맛집</a></li>
                    <li><a href="#">예약 맛집</a></li>
                    <li><a href="#">예약 수정</a></li>
                    <li><a href="#">리뷰 관리</a></li>
                </ul>
            </li>
        </ul>
    </nav>

    <!-- 버튼 -->
    <div class="buttons">
        <a href="/login" class="btn btn-green">Sign in</a>
        <a href="/signup" class="btn btn-black">Sign Up</a>
    </div>
</header>
</body>
</html>
