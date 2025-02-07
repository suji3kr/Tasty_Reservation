<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사진 상세 보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="/WEB-INF/includes/header.jsp" />

<div class="container mt-4">
    <h2 class="mb-4">사진 상세 보기</h2>
    <div class="card mb-3">
        <img src="${photo.url}" class="card-img-top" alt="사진">
        <div class="card-body">
            <h5 class="card-title">${photo.description}</h5>
            <p>평균 별점: ${averageRating}</p>
        </div>
    </div>

    <div class="form-container mb-4">
        <form action="/rate" method="post" class="mb-2">
            <input type="hidden" name="photoId" value="${photo.id}">
            <label for="rating" class="form-label">별점 남기기:</label>
            <select name="rating" id="rating" class="form-select mb-2">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
            <button type="submit" class="btn btn-warning w-100">별점 제출</button>
        </form>

        <form action="/comment" method="post">
            <input type="hidden" name="photoId" value="${photo.id}">
            <textarea name="comment" class="form-control mb-2" rows="3" placeholder="댓글을 남겨주세요"></textarea>
            <button type="submit" class="btn btn-primary w-100">댓글 제출</button>
        </form>
    </div>

    <h4>댓글</h4>
    <ul class="list-group">
        <c:forEach var="comment" items="${comments}">
            <li class="list-group-item">${comment.user}: ${comment.text}</li>
        </c:forEach>
    </ul>

    <a href="/photoGallery" class="back-btn mt-4">갤러리로 돌아가기</a>
</div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

</body>
</html>
