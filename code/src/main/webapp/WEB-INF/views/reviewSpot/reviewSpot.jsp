<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<head>
<meta charset="UTF-8">
<title>리뷰 </title>


<style>
/* reviewSpot.css */

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
    flex-direction: column;
    align-items: center;
    margin: 20px;
}

.review-item {
    background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 60%;
    margin: 10px 0;
    padding: 20px;
    border-radius: 8px;
}

.review-item h2 {
    margin-top: 0;
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
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ddd;
    border-radius: 5px;
}

form button {
    padding: 10px 20px;
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

/* 별점 스타일 추가 */
.rating {
    display: flex;
    flex-direction: row-reverse;
    justify-content: center;
}

.rating input {
    display: none;
}

.rating label {
    font-size: 2em;
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


</style>
</head>
<body>



    <h1>리뷰</h1>

    <div class="review-list">
        <c:forEach var="review" items="${reviews}">
            <div class="review-item">
                <h2>${review.restaurantName}</h2>
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
                <!-- 업로드된 이미지 표시 -->
                <c:if test="${not empty review.imagePath}">
                    <img
                        src="${pageContext.request.contextPath}/uploads/${review.imagePath}"
                        alt="Review Image" width="100%">
                </c:if>
            </div>
        </c:forEach>
    </div>

    <h2>리뷰 쓰기</h2>
    <form action="${pageContext.request.contextPath}/addReview"
        method="post" enctype="multipart/form-data">
        <input type="text" name="restaurantName" placeholder="식당 이름" required />
        <textarea name="reviewContent" placeholder="내용 쓰기" required></textarea>

        <div class="rating">
            <input type="radio" id="star5" name="rating" value="5" /><label
                for="star5">★</label> <input type="radio" id="star4" name="rating"
                value="4" /><label for="star4">★</label> <input type="radio"
                id="star3" name="rating" value="3" /><label for="star3">★</label> <input
                type="radio" id="star2" name="rating" value="2" /><label
                for="star2">★</label> <input type="radio" id="star1" name="rating"
                value="1" /><label for="star1">★</label>
        </div>

        <!-- 이미지 파일 업로드 -->
        <label for="imageFile" class="btn btn-secondary">사진 올리기</label> <input
            type="file" id="imageFile" name="imageFile"
            accept="image/jpeg, image/png, image/jpg, image/gif, image/webp"
            style="display: block;" />

        <button type="submit">확인</button>
    </form>


</body>

<script>
    document
            .getElementById("imageFile")
            .addEventListener(
                    "change",
                    function() {
                        const file = this.files[0];
                        if (file) {
                            const allowedExtensions = [ "image/png",
                                    "image/jpeg", "image/jpg", "image/gif",
                                    "image/webp" ];
                            if (!allowedExtensions.includes(file.type)) {
                                alert("이미지 파일(.jpg, .jpeg, .png, .gif, .webp)만 업로드 가능합니다.");
                                this.value = ""; // 파일 입력 초기화
                            }
                        }
                    });
</script>
</html>
