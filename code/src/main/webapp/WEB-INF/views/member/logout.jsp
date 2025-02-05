<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            background-color: #f5f5f5;
            font-family: 'Arial', sans-serif;
        }
        .logout-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
        }
        .logout-message {
            text-align: center;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .logout-message h1 {
            color: #ff6347;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<%
    // 세션 무효화
    HttpSession session2 = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }
%>

    <div class="logout-container">
        <div class="logout-message">
            <h1>로그아웃되었습니다.</h1>
            <button class="btn btn-primary" onClick="goToMain()">메인화면</button>
        </div>
    </div>

    <script>
        function goToMain() {
            window.location.href = '/'; // 메인 페이지 URL로 변경
        }
    </script>
</body>
</html>
