<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>

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
<style type="text/css">
    body, html {
        height: 100%;
        margin: 0;
    }
    .update {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 80vh;
    }
</style>
</head>
<body>
	
	<div class="update">
		<form action="/member/update" method="post" name="updateForm">
			<p>
				아 이 디 : <input type="text" name="id" value="${member.id}" readonly>
			</p>
			<p>
				이 메 일 : <input type="text" name="email" value="${member.email}"
					readonly>
			</p>
			<p>
				비 밀 번 호 : <input type="text" name="password" id="password"<%--  value="${member.memberPassword}" --%>>
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
				성별 : <input type="text" name="gender" value="${member.gender}"
					readonly>
			</p>
			<!-- 성별을 텍스트 필드로 변경하고 readonly 속성 추가 -->
			<input type="button" value="수정" onclick="update()">
		</form>
	</div>

</body>
</html>