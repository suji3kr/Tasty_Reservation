<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:include page="./includes/header.jsp" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>홈 페이지</title>

<script type="text/javascript">
	window.onload = function() {
		// JSP의 플래시 속성 접근
		var updateSuccess =
<%=request.getAttribute("updateSuccess") != null%>
	;
		if (updateSuccess) {
			alert("수정 완료되었습니다."); // 성공 시에만 경고 메시지 표시
		}
	};
</script>

<!-- Custom CSS -->
<style>
/* 공통 스타일 */
body {
	font-family: 'Roboto', sans-serif;
	background-color: #f4f7fc;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* 컨테이너 설정 */
.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

/* 상단 사진 3개 레이아웃 */
.top-row {
	display: flex;
	justify-content: space-between;
	gap: 20px;
	margin: 20px 0;
}

.photo-frame {
	width : 300px;
	position: relative;
	border-radius: 15px;
	overflow: hidden;
}

/* 양쪽 사진은 동일한 크기로 */
.photo-frame.small {
	flex: 2;
}

/* 가운데 사진은 더 넓게 */
.photo-frame.large {
	flex: 2; /* 두 배로 크기를 설정 */
} 
.photo-frame img {
	width: 100%;
	height: 300px;
	display: flex;
	justify-content: space-between;
}

.bottom-row {
	width : 1200px;
	height : auto;
	margin: 30px auto;
	text-align: center;
	
	}

.bottom-row img {
	width : 100 %;
	height : 100% ;
	object-fit: cover; /* 이미지가 컨테이너를 꽉 채우도록 설정 */
    object-position: center; /* 이미지의 중심을 기준으로 자르기 */
    border-radius: 15px;
}

/* 텍스트와 버튼 오버레이 스타일 */
.overlay {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	text-align: center;
	z-index: 1;
}

.overlay h1 {
	font-size: 2rem;
	font-weight: bold;
	margin-bottom: 10px;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
}

.overlay p {
	font-size: 1rem;
	margin-bottom: 20px;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);
}

.overlay button {
	padding: 10px 20px;
	font-size: 1rem;
	color: #fff;
	background-color: #ff7a00;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-shadow: none;
}

.overlay button:hover {
	background-color: #e66800;
}
</style>
</head>
<body>
	<div class="container">
		<!-- 상단 사진 3개 -->
		<div class="top-row">
			<!-- 왼쪽 사진 -->
			<div class="photo-frame small">
				<img src="/resources/image/레스토랑1.png" alt="Image 1">
			</div>

			<!-- 가운데 사진 (가로로 더 길게) -->
			<div class="photo-frame small">
				<img src="/resources/image/송아지스테이크.png" alt="Image 2">
				<!-- 오버레이 콘텐츠 -->
				<div class="overlay">
					<h1>Art Of Reservation</h1>
					<p>여행의 미학</p>
					<button>Where are you headed?</button>
				</div>
			</div>

			<!-- 오른쪽 사진 -->
			<div class="photo-frame small">
				<img src="/resources/image/연어레스토랑.png" alt="Image 3">
			</div>
		</div>

		<!-- 하단 큰 사진 -->
		<div class="bottom-row">
			<img src="/resources/image/과일스푼.png" alt="Image 4">
		</div>
	</div>

	<!-- Footer -->
	<footer>
		<p style="text-align: center; padding: 20px; color: #666;">&copy;
			2025 YourCompany. All rights reserved.</p>
	</footer>
</body>
</html>
