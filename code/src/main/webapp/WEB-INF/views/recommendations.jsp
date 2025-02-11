<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>SNS 맛집 추천</title>

<!-- Font Awesome for SNS icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
    color: #333;
}

h1 {
    text-align: center;
    margin-top: 30px;
    color: #ff6347;
    font-size: 36px;
    font-weight: bold;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
}

/* 추천 목록 스타일 */
.recommendation {
    max-width: 600px;
    margin: 20px auto;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    overflow: hidden;
}

/* 이미지 스타일 (스토어 리스트 방식 적용) */
.recommendation img {
    width: 100%;
    height: auto;
}

.recommendation-content {
    padding: 20px;
}

.recommendation h2 {
    margin: 0;
    font-size: 24px;
    color: #333;
}

.recommendation p {
    font-size: 16px;
    color: #666;
}

.tags {
    margin-top: 10px;
}

.tag {
    display: inline-block;
    background-color: #ff6347;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    margin-right: 5px;
    font-size: 14px;
}

.sns-icons {
    margin-top: 10px;
}

.sns-icons a {
    margin-right: 10px;
    color: #333;
    font-size: 20px;
    transition: color 0.3s;
}

.sns-icons a:hover {
    color: #ff6347;
}
</style>
</head>
<body>

    <h1>SNS 맛집 추천</h1>

    <!-- 스토어 리스트 연동 -->
    <c:forEach var="store" items="${storeList}">
        <div class="recommendation">
            <!-- 스토어 리스트 방식으로 이미지 로딩 -->
            <a href="/store/detail?id=${store.id}">
                <c:choose>
                    <c:when test="${not empty store.storeImage}">
                        <img src="${store.storeImage}" alt="가게 이미지"
                            onerror="this.onerror=null; this.src='/resources/images/default.jpg'">
                    </c:when>
                    <c:otherwise>
                        <img src="/resources/images/default.jpg" alt="default">
                    </c:otherwise>
                </c:choose>
            </a>

            <div class="recommendation-content">
                <h2>${store.name}</h2>
                <p>${store.description}</p>
                <div class="tags">
                    <c:forEach var="tag" items="${store.tags}">
                        <span class="tag">${tag}</span>
                    </c:forEach>
                </div>
                <div class="sns-icons">
                    <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
                    <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
                    <a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
                </div>
            </div>
        </div>
    </c:forEach>

</body>
</html>
