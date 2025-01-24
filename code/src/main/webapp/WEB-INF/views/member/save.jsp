<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous">
</script>
</head>
<body>
	<form action="/member/save" method="post" accept-charset="UTF-8">
        <p>이 메 일 : <input type="text" name="email" placeholder="이메일" id="email" onblur="emailCheck()"></p>
        <p id="check-result"></p>
        <p>비밀번호 : <input type="password" name="password" placeholder="비밀번호" required></p>
        <p>이   름 : <input type="text" name="username" placeholder="이름" required></p>
        <p>나   이 : <input type="text" name="age" placeholder="나이" required></p>
        <p>전화번호 : <input type="text" name="phone" placeholder="전화번호" required></p>
        <p>성별:
            <input type="radio" name="gender" value="M" required> 남성
            <input type="radio" name="gender" value="F"> 여성
        </p>
        <input type="submit" value="회원가입">
    </form>
</body>
<script>
// 이메일 입력값을 가져오고,
// 입력값을 서버로 전송하고 똑같은 이메일이 있는지 체크한 후
// 사용 가능 여부를 이메일 입력창 아래에 표시
    const emailCheck = () => {
        const email = document.getElementById("email").value;
        const checkResult = document.getElementById("check-result");
        console.log("입력한 이메일", email);
        $.ajax({
            // 요청방식: post, url: "email-check", 데이터: 이메일
            type: "post",
            url: "/member/email-check",
            data: {
                "email": email
            },
            success: function(res) {
                console.log("요청성공", res);
                if (res == "ok") {
                    console.log("사용가능한 이메일");
                    checkResult.style.color = "green";
                    checkResult.innerHTML = "사용가능한 이메일";
                } else {
                    console.log("이미 사용중인 이메일");
                    checkResult.style.color = "red";
                    checkResult.innerHTML = "이미 사용중인 이메일";
                }
            },
            error: function(err) {
                console.log("에러발생", err);
            }
        });
    }
</script>
</html>