<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>가게 목록</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: 'Roboto', sans-serif;
	background-color: #f4f7fc;
}

.container {
	margin-top: 50px;
	background: white;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

img {
	border-radius: 5px;
	border: 1px solid #ddd;
}
</style>
</head>
<body>

	<div class="container">
		<h2 class="text-center">가게 목록</h2>

		<!-- 검색 폼 -->
		<form action="/store/storeList" method="get" class="d-flex mb-3">
			<input type="text" class="form-control me-2" name="searchKeyword"
				placeholder="가게명 검색">
			<button type="submit" class="btn btn-primary">검색</button>
		</form>

		<!-- 가게 리스트 -->
		<table class="table table-bordered table-hover">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>가게 이름</th>
					<th>위치</th>
					<th>종류</th>
					<th>전화번호</th>
					<th>사진</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="store" items="${storeList}">
					<tr>
						<td>${store.id}</td>
						<td><a href="/store/detail?id=${store.id}"
							class="text-decoration-none"> ${store.storeName} </a></td>

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

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
