<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body, html {
            height: 100%;
            margin: 0;
            background-color: #f4f7fc;
        }
        .update {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            width: 400px; /* 폼의 너비를 늘렸습니다 */
            background: white;
            padding: 40px; /* 패딩을 늘려 더 넉넉하게 */
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2); /* 그림자 강도를 높였습니다 */
        }
    </style>
    
    <script>
        const update = () => {
            const passwordDB = '${member.password}';
            const password = document.getElementById("password").value;
            if (passwordDB == password) {
                document.updateForm.submit();
            } else {
                alert("비밀번호가 일치하지 않습니다!");
            }
        }
    </script>
</head>
<body>
    
    <div class="update">
        <div class="form-container">
            <h2 class="text-center mb-4">회원 정보 수정</h2>
            <form action="/member/update" method="post" name="updateForm">
                <div class="mb-3">
                    <label for="email" class="form-label">이메일</label>
                    <input type="text" class="form-control" name="email" value="${member.email}" readonly>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" name="password" id="password">
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">이름</label>
                    <input type="text" class="form-control" name="username" value="${member.username}" readonly>
                </div>
                <div class="mb-3">
                    <label for="age" class="form-label">나이</label>
                    <input type="text" class="form-control" name="age" value="${member.age}">
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">전화번호</label>
                    <input type="text" class="form-control" name="phone" value="${member.phone}">
                </div>
                <div class="mb-3">
                    <label for="gender" class="form-label">성별</label>
                    <input type="text" class="form-control" name="gender" value="${member.gender}" readonly>
                </div>
                <button type="button" class="btn btn-primary w-100" onclick="update()">수정</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
