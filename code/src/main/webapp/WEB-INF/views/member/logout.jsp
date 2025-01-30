<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
<%
    // 세션 무효화
    HttpSession usersession = request.getSession();
    usersession.invalidate();
%>
    <h1>로그아웃되었습니다.</h1>
    <!-- 메인 페이지로 리다이렉트하는 버튼 -->
    <button onClick="goToMain()">메인화면</button>

    <script>
        function goToMain() {
            window.location.href = '/'; // 메인 페이지 URL로 변경
        }
    </script>
</body>
</html>
