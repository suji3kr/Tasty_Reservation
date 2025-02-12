<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8">
<title>회원정보 수정</title>

<style>
/* 회원정보 수정 영역 전체 스타일 */
.update-section {
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
	width: 100%;
}

/* 본문(회원정보 수정 폼) */
.update-section .update-container {
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	width: 400px;
	text-align: left;
	margin-top: 20px;
}

.update-section .update-container h2 {
	margin-bottom: 20px;
}

.update-section .update-container input {
	width: 95%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
}

/* 버튼 스타일 */
.update-section .btn {
	width: 48%;
	padding: 10px;
	margin: 10px 5px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	color: white;
}

.update-section .update-container .button-wrapper {
	text-align: center;
}

.update-section .btn-update {
	background-color: #b0a326; /* 올리브그린 */
}

.update-section .btn-cancel {
	background-color: gray;
}

h2 {
	padding-bottom: 20px;
	text-align: center;
}

button {
	margin: 0 auto;;
}

.id-class {
	display: none;
}
</style>
</head>
<body>

	<!-- 회원정보 수정 영역 -->
	<div class="update-section">

		<div class="update-container">

			<h2>회원정보 수정</h2>

			<form action="/member/update" method="post" name="updateForm">
				<p class="id-class">
					아 이 디 : <input type="text" name="id" value="${member.id}" readonly>
				</p>
				<p>
					이 메 일 : <input type="text" name="email" value="${member.email}"
						readonly>
				</p>
				<p>
					비밀번호 : <input type="password" name="currentPassword" required>
				</p>
				<p>
					이 름 : <input type="text" name="username" value="${member.username}"
						readonly>
				</p>
				<p>
					나 이 : <input type="text" name="age" value="${member.age}">
				</p>
				<p>
					전화번호 : <input type="text" name="phone" value="${member.phone}">
				</p>
				<p>
					성 별 : <input type="text" name="gender" value="${member.gender}"
						readonly>
				</p>
				<p class="id-class">
					권 한 : <input type="text" name="role" value="${member.role}" readonly>
				</p>

				<div class="button-wrapper">
					<button type="submit" class="btn btn-update">수정</button>
					<button type="button" class="btn btn-cancel"
						onclick="cancelUpdate()">취소</button>
				</div>
			</form>


		</div>


	</div>

</body>

<script>

/* const update = () => {
    const passwordDB = '${member.password}';
    const password = document.getElementById("password").value;
    if (passwordDB === password) {
    	alert("수정완료 되었습니다🚀");
       document.updateForm.submit();
    } else {
        alert("비밀번호가 일치하지 않습니다.🚀");
    }
} 
 */
</script>

</html>
