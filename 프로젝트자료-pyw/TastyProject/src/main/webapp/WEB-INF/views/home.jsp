<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>홈 페이지</title>

    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7fc;
        }
        .hero-section {
            background-color: #4e73df;
            color: white;
            padding: 100px 0;
            text-align: center;
            position: relative;
        }
        .hero-section h1 {
            font-size: 3rem;
            font-weight: 700;
        }
        .card-deck .card {
            transition: transform 0.3s ease-in-out;
        }
        .card-deck .card:hover {
            transform: scale(1.05);
        }
        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 20px 0;
        }
        .auth-buttons {
            position: absolute;
            top: 20px;
            right: 20px;
        }
    </style>
</head>
<body>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="auth-buttons">
            <a href="/login" class="btn btn-primary btn-lg">로그인</a>
            <a href="/signup" class="btn btn-success btn-lg ms-3">회원가입</a>
        </div>
        <div class="container">
            <h1>환영합니다!</h1>
            <p>맛집에 대한 모든것.</p>
            <a href="#features" class="btn btn-light btn-lg mt-4">지금 바로 먹으러가기</a>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card shadow-sm">
                        <img src="/resources/image/레스토랑1.png" class="card-img-top" alt="본프레레">
                        <div class="card-body">
                            <h5 class="card-title">맛집 랭킹 1위</h5>
                            <p class="card-text">현재 가장 뜨거운 맛집 픽!.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card shadow-sm">
                        <img src="/resources/image/송아지스테이크.png" class="card-img-top" alt="스테이크하우스">
                        <div class="card-body">
                            <h5 class="card-title">맛집 랭킹 2위</h5>
                            <p class="card-text">평소에 자주 시켜먹는 맛집 픽!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card shadow-sm">
                        <img src="/resources/image/연어레스토랑.png" class="card-img-top" alt="연어상회">
                        <div class="card-body">
                            <h5 class="card-title">맛집 랭킹 3위</h5>
                            <p class="card-text">야식이 땡길땐? 여기로!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 YourCompany. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
