<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>관리자 로그인 페이지</title>

<!-- <style>
body {
	font-family: 'Roboto', sans-serif;
	background-color: #e5ebbc;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	/* 	background-color: #cad291; */
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.filter-section {
	width: 1002px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	background-color: white;
	padding: 15px;
	border-radius: 10px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.filter-group {
	/* 	display: flex; */
	flex-direction: column;
	align-items: center;
	padding: 3px 0;
	justify-content: center; /* 세로 방향 중앙 정렬 */
}

.filter-stargroup {
	/* 	display: flex; */
	flex-direction: column;
	align-items: center;
	padding-top: 6px; /* 위쪽 패딩 값 추가 */
	padding-bottom: 5px; /* 아래쪽 패딩은 기존처럼 유지 */
}

.filter-checkgroup {
	/* 	display: flex; */
	flex-direction: column;
	align-items: center;
	padding-top: 11px; /* 위쪽 패딩 값 추가 */
	padding-bottom: 5px; /* 아래쪽 패딩은 기존처럼 유지 */
}

.filter-time-kids {
	/* 	display: flex; */
	flex-direction: column;
	align-items: center;
	padding-top: 8px; /* 위쪽 패딩 값 추가 */
	padding-bottom: 5px; /* 아래쪽 패딩은 기존처럼 유지 */
}

.filter-group label {
	font-weight: bold;
	margin-bottom: 5px;
}

.filter-group select, .filter-group input, .filter-group button {
	padding: 3px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.time-buttons {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 10px;
	margin-top: 10px;
}

.time-buttons button {
	padding: 10px;
	background-color: #4e7300;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.time-buttons button:hover {
	background-color: #3b5a00;
}

.photo-section {
	width: 100%;
	display: flex;
	justify-content: center;
	/* 	flex-wrap: wrap; */
	gap: 20px;
}

.photo-frame {
	width: 400px;
	position: relative;
}

.photo-frame img {
	width: 100%;
	height: 300px;
	border-radius: 15px;
	object-fit: cover;
} -->
</style>
</head>
<body>


	<div class="photo-section">
		<div class="photo-frame">
			<img src="/resources/image/뷔페.jpg" alt="뷔페">
		</div>
		<div class="photo-frame">
			<img src="/resources/image/국물요리.jpg" alt="국물요리">
		</div>
		<div class="photo-frame">
			<img src="/resources/image/관자요리.jpg" alt="관자요리">
		</div>
		<div class="time-buttons">
			<button>6:30</button>
			<button>7:30</button>
			<button>8:30</button>
			<button>9:30</button>
		</div>
	</div>
	<div class="body">

		<h2 class="text-center">가게 목록</h2>
		<!-- 가게 리스트 -->
		<table class="table table-bordered table-hover">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>예약자</th>
					<th>위치</th>
					<th>메뉴</th>
					<th>전화번호</th>
					<th>사진</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="store" items="${storeList}">
					<tr onclick="location.href='/store/detail?id=${store.id}'"
						style="cursor: pointer;">
						<td>${store.id}</td>
						<td>${store.storeName}</td>
						<td>${store.storeLocation}</td>
						<td>${store.storeCategory}</td>
						<!-- 전화번호를 010-XXXX-XXXX 형식으로 변환 -->
						<td><c:choose>
								<c:when test="${fn:length(store.phoneNumber) == 11}">
                        ${fn:substring(store.phoneNumber, 0, 3)}-${fn:substring(store.phoneNumber, 3, 7)}-${fn:substring(store.phoneNumber, 7, 11)}
                    </c:when>
								<c:otherwise>
                        ${store.phoneNumber} <!-- 11자리가 아닌 경우 그냥 출력 -->
								</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${not empty store.storeImage}">
									<img src="${store.storeImage}" alt="가게 이미지" width="80"
										height="80"
										onerror="this.onerror=null; this.src='/resources/images/default.jpg'">
								</c:when>
								<c:otherwise>
									<img src="/resources/images/default.jpg" alt="기본 이미지"
										width="80" height="80">
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/board/register" class="btn btn-success">새 가게 등록</a>
	</div>

</body>

<!-- 페이징처리 -->
<div class="pagination">

	<c:set var="amount"
		value="${not empty param.amount ? param.amount : 10}"></c:set>
	<c:set var="pageNum"
		value="${not empty param.pageNum ? param.pageNum : 1}"></c:set>

	<c:if test="${pageMaker.prev}">
		<a
			href="/board/familyreservation?pageNum=${pageMaker.startPage - 1}&amount=${amount}">이전</a>
	</c:if>

	<c:forEach var="i" begin="${pageMaker.startPage}"
		end="${pageMaker.endPage}">
		<c:choose>
			<c:when test="${i == pageNum}">
				<span class="current-page">${i}</span>
			</c:when>
			<c:otherwise>
				<a href="/board/familyreservation?pageNum=${i}&amount=${amount}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:if test="${pageMaker.next}">
		<a
			href="/board/familyreservation?pageNum=${pageMaker.endPage + 1}&amount=${amount}">다음</a>
	</c:if>
</div>

</html>
