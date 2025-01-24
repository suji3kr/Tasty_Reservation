<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
    const update = () => {
        location.href = "/member/update";
    }
    
    const logout = () => {
        location.href = "/member/logout";
    }
</script>
<title>main</title>
</head>
<body>
    <h2>${sessionScope.loginEmail} 님 환영합니다.</h2> <!-- 수정된 부분 -->
    <button onclick="update()">내정보 수정하기</button>
    <button onclick="logout()">로그아웃</button>
</body>
</html>