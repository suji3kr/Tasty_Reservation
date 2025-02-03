<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>가게 목록</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">가게 목록</h2>

    <!-- 검색 폼 -->
    <form action="/store/storelist" method="get" class="d-flex mb-3">
        <input type="text" class="form-control me-2" name="searchKeyword" placeholder="가게명 검색">
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
                    <td>${store.storeName}</td>
                    <td>${store.storeLocation}</td>
                    <td>${store.storeCategory}</td>
                    <td>${store.phoneNumber}</td>
                    <td>
                        <img src="${store.storeImage}" alt="가게 이미지" width="80">
                    </td>
                </tr>
            </c:forEach>
            
        </tbody>
    </table>

    <a href="/board/register" class="btn btn-success">새 가게 등록</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
