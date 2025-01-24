<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="./includes/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	max-width: 500px;
	margin: 50px auto;
	background: white;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}
</style>
</head>
<body>

	<div class="signup-container">
		<h2 class="text-center">회원가입</h2>
		<form action="/signup" method="post">
			<div class="mb-3">
				<div class="mb-3">
					<label for="email" class="form-label">이메일</label> <input
						type="email" class="form-control" id="email" name="email" required>
				</div>

				<button type="button" class="btn btn-primary mt-2"
					id="checkUsernameBtn" onclick="checkUsername()">중복 확인</button>
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
				document
						.addEventListener(
								'DOMContentLoaded',
								function() {
									const birthdateInput = document
											.getElementById('birthdate');
									const ageInput = document
											.getElementById('age');
									birthdateInput
											.addEventListener(
													'change',
													function() {
														const birthdateValue = this.value;
														if (birthdateValue) {
															const birthdate = new Date(
																	birthdateValue);
															const today = new Date();
															let age = today
																	.getFullYear()
																	- birthdate
																			.getFullYear();
															const monthDiff = today
																	.getMonth()
																	- birthdate
																			.getMonth();

															// 생년월일이 올해 아직 지나지 않은 경우 나이를 조정
															if (monthDiff < 0
																	|| (monthDiff === 0 && today
																			.getDate() < birthdate
																			.getDate())) {
																age--;
															}
															ageInput.value = age;
														} else {
															ageInput.value = '';
														}
													});
								});
			</script>

			<div class="mb-3">
				<label for="phone" class="form-label">핸드폰번호</label> <input
					type="tel" class="form-control" id="phone" name="phone" required
					placeholder="-없이 숫자만 입력" ]>
			</div>
			<div class="mb-3">
				<label class="form-label">성별</label>
				<div>
					<input type="radio" id="male" name="gender" value="M" required>
					<label for="male">남성</label> <input type="radio" id="female"
						name="gender" value="F" required> <label for="female">여성</label>
				</div>
			</div>
			<button type="submit" class="btn btn-primary w-100">가입하기</button>
		</form>
	</div>
	<footer>
		<p>&copy; 2025 YourCompany. All rights reserved.</p>
	</footer>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>