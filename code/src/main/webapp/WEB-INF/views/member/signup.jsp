<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="ko">
<head>
<title>회원가입</title>
<!-- Bootstrap CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->

<style>
body {
	font-family: 'Roboto', sans-serif;
	background-color: #f4f7fc;
}

.signup-container {
	max-width: 600px;
	margin: 50px auto;
	background: white;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

#checkUsernameBtn {
	width: 130px;
	height: 38px;
	margin-bottom: 5px;
	border-radius: 15px;
	border: none;
	background: #f0c43cc9;
	color: #fff;
	font-weight: bold;
}

.signup-btn {
	width: 100%;
	height: 38px;
	margin-bottom: 5px;
	border-radius: 15px;
	border: none;
	background: #cbddad;
	color: #fff;
	font-weight: bold;
}
</style>
</head>
<body>

	<div class="signup-container">
		<h3 class="text-center">회원 가입</h3>
		<form action="/member/signup" method="post" accept-charset="UTF-8">
			<div class="mb-3">
				<div class="mb-3">
					<label for="email" class="form-label">이메일</label> <input
						type="email" class="form-control" id="email" name="email" required>
				</div>

				<button type="button" class="btn signup" id="checkUsernameBtn"
					onclick="emailCheck()">중복확인🍕🍕</button>

				<div id="check-result"></div>

			</div>
			<div class="mb-3">
				<input type="checkbox" id="isAdmin" name="isAdmin"> <label
					for="isAdmin">맛집 관리 사장님으로 가입 시 체크해주세요 🤗</label>
			</div>
			<div class="mb-3">
				<label for="username" class="form-label">이름</label> <input
					type="text" class="form-control" id="username" name="username"
					required>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">비밀번호</label> <input
					type="password" class="form-control" id="password" name="password"
					required>
			</div>
			<div class="mb-3">
				<label for="confirm-password" class="form-label">비밀번호 확인</label> <input
					type="password" class="form-control" id="confirm-password"
					name="confirm-password" required>
			</div>
			<script>
				// 비밀번호 확인 로직
				document.getElementById('confirm-password').addEventListener(
						'input',
						function() {
							const password = document
									.getElementById('password').value;
							const confirmPassword = this.value;

							if (password !== confirmPassword) {
								this.setCustomValidity('비밀번호가 일치하지 않습니다.');
							} else {
								this.setCustomValidity(''); // 유효성 검사 통과
							}
						});
			</script>

			<div class="mb-3">
				<label for="birthdate" class="form-label">생년월일</label> <input
					type="date" class="form-control" id="birthdate" name="birthdate"
					required>
			</div>
			<div class="mb-3">
				<label for="age" class="form-label">나이</label> <input type="text"
					class="form-control" id="age" name="age" readonly>
			</div>

			<script>
					document.addEventListener('DOMContentLoaded', function() {
					    const birthdateInput = document.getElementById('birthdate');
					    const ageInput = document.getElementById('age');
					
					    // 생년월일을 입력하면 나이를 자동 계산
					    birthdateInput.addEventListener('change', function() {
					        const birthdateValue = this.value;
					
					        if (birthdateValue) {
					            const birthdate = new Date(birthdateValue);
					            const today = new Date();
					            let age = today.getFullYear() - birthdate.getFullYear();
					            const monthDiff = today.getMonth() - birthdate.getMonth();
					
					            // 생년월일이 아직 안 지난 경우 나이를 조정
					            if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthdate.getDate())) {
					                age--;
					            }
					
					            // 나이 범위 검증
					            if (age < 0 || age > 200) {
					                alert("올바른 생년월일을 입력해주세요. 나이는 0 이상 200 이하로 입력해야 합니다.");
					                birthdateInput.value = '';
					                ageInput.value = '';
					            } else {
					                ageInput.value = age;
					            }
					        } else {
					            ageInput.value = '';
					        }
					    });
					
					    // 나이를 직접 입력하면 생년월일 자동 계산
					    ageInput.addEventListener('input', function() {
					        const ageValue = parseInt(this.value, 10);
					
					        if (!isNaN(ageValue) && ageValue >= 0 && ageValue <= 200) {
					            const today = new Date();
					            const birthYear = today.getFullYear() - ageValue;
					            let birthMonth = today.getMonth() + 1;
					            let birthDay = today.getDate();
					
					            // 날짜 형식 맞추기 (YYYY-MM-DD)
					            if (birthMonth < 10) birthMonth = "0" + birthMonth;
					            if (birthDay < 10) birthDay = "0" + birthDay;
					
					            birthdateInput.value = `${birthYear}-${birthMonth}-${birthDay}`;
					        } else if (this.value !== "") {
					            alert("올바른 나이를 입력해주세요. (0~200)");
					            this.value = '';
					        }
					    });
					});
					</script>



			<div class="mb-3">
				<label for="phone" class="form-label">핸드폰번호</label> <input
					type="tel" class="form-control" id="phone" name="phone" required
					placeholder="-없이 숫자만 입력">
			</div>
			<div class="mb-3">
				<label class="form-label">성별</label>
				<div>
					<input type="radio" id="male" name="gender" value="M" required>
					<label for="male">남성</label> <input type="radio" id="female"
						name="gender" value="F" required> <label for="female">여성</label>
				</div>
			</div>
			<button type="submit" class="signup-btn">가입하기</button>
		</form>
	</div>
	<!-- jQuery CDN 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
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
                alert("사용 가능한 이메일입니다.");
            } else {
                console.log("이미 사용중인 이메일");
                checkResult.style.color = "red";
                checkResult.innerHTML = "이미 사용중인 이메일";
                alert("이미 사용 중인 이메일입니다.");
            }
        },
        error: function(err) {
            console.log("에러발생", err);
        }
    });
}
</script>
</html>