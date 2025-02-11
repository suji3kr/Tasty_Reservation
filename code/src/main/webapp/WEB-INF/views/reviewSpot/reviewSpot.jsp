<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>리뷰</title>

<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f0f0;
}

h1, h2 {
    text-align: center;
}

.review-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin: 20px;
}

.review-item {
    background-color: white;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    width: 180px;
    height: 220px;
    margin: 10px;
    padding: 10px;
    border-radius: 8px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
}

.review-item img {
    width: 100%;
    height: 100px;
    object-fit: cover;
    border-radius: 5px;
    margin-bottom: 10px;
    cursor: pointer;
}

.review-content {
    text-align: center;
    font-size: 14px;
    cursor: pointer;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 20px;
}

form input[type="text"],
form textarea {
    width: 50%;
    padding: 8px;
    margin: 5px 0;
    border: 1px solid #ddd;
    border-radius: 5px;
}

form button {
    padding: 8px 16px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 10px;
}

form button:hover {
    background-color: #45a049;
}

.rating {
    display: flex;
    flex-direction: row-reverse;
    justify-content: center;
    font-size: 1.2em;
    cursor: pointer;
}

.rating input {
    display: none;
}

.rating label {
    color: #ddd;
    cursor: pointer;
}

.rating input:checked ~ label {
    color: #f5b301;
}

.rating label:hover,
.rating label:hover ~ label {
    color: #f5b301;
}

/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.8);
}

.modal-content {
    margin: 15% auto;
    padding: 20px;
    width: 80%;
    max-width: 500px;
    text-align: center;
    background-color: white;
    border-radius: 8px;
}

.modal img {
    width: 100%;
    border-radius: 8px;
}

.modal-description {
    color: black;
    margin-top: 10px;
    font-size: 16px;
}
</style>
</head>
<body>

<h1>리뷰</h1>

<div class="review-list">
    <c:forEach var="review" items="${reviews}">
        <div class="review-item">
            <c:if test="${not empty review.imagePath}">
                <img src="${pageContext.request.contextPath}/uploads/${review.imagePath}" alt="Review Image" onclick="openModal('${pageContext.request.contextPath}/uploads/${review.imagePath}', '${review.restaurantName}', '${review.reviewContent}', '${review.rating}')">
            </c:if>
            <div class="review-content" onclick="openModal('${pageContext.request.contextPath}/uploads/${review.imagePath}', '${review.restaurantName}', '${review.reviewContent}', '${review.rating}')">
                <h3>${review.restaurantName}</h3>
                <p>${review.reviewContent}</p>
                <p>
                    평점:
                    <c:forEach begin="1" end="5" var="i">
                        <c:choose>
                            <c:when test="${i <= review.rating}">
                                ★
                            </c:when>
                            <c:otherwise>
                                ☆
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </p>
            </div>
        </div>
    </c:forEach>
</div>

<h2>리뷰 쓰기</h2>
<form action="${pageContext.request.contextPath}/addReview" method="post" enctype="multipart/form-data">
    <input type="text" name="restaurantName" placeholder="식당 이름" required />
    <textarea name="reviewContent" placeholder="내용 쓰기" required></textarea>

    <div class="rating">
        <input type="radio" id="star5" name="rating" value="5" /><label for="star5">★</label>
        <input type="radio" id="star4" name="rating" value="4" /><label for="star4">★</label>
        <input type="radio" id="star3" name="rating" value="3" /><label for="star3">★</label>
        <input type="radio" id="star2" name="rating" value="2" /><label for="star2">★</label>
        <input type="radio" id="star1" name="rating" value="1" /><label for="star1">★</label>
    </div>

    <input type="file" id="imageFile" name="imageFile" accept="image/jpeg, image/png, image/jpg, image/gif, image/webp" style="margin-top: 10px;" />
    <button type="submit">확인</button>
</form>

<!-- 모달 -->
<div id="imageModal" class="modal" onclick="closeModal()">
    <div class="modal-content">
        <img id="modalImage" src="" alt="Modal Image">
        <div id="modalTitle" class="modal-description"></div>
        <div id="modalDescription" class="modal-description"></div>
        <div id="modalRating" class="modal-description"></div>
    </div>
</div>

<script>
function openModal(imageSrc, title, description, rating) {
    document.getElementById("modalImage").src = imageSrc;
    document.getElementById("modalTitle").innerText = "식당 이름: " + title;
    document.getElementById("modalDescription").innerText = description;
    document.getElementById("modalRating").innerText = "평점: " + "★".repeat(rating) + "☆".repeat(5 - rating);
    document.getElementById("imageModal").style.display = "block";
}

function closeModal() {
    document.getElementById("imageModal").style.display = "none";
}

document.getElementById("imageFile").addEventListener("change", function() {
    const file = this.files[0];
    if (file) {
        const allowedExtensions = ["image/png", "image/jpeg", "image/jpg", "image/gif", "image/webp"];
        if (!allowedExtensions.includes(file.type)) {
            alert("이미지 파일(.jpg, .jpeg, .png, .gif, .webp)만 업로드 가능합니다.");
            this.value = ""; 
        }
    }
});
</script>
</body>
</html>
