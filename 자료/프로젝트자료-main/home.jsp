<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홈 페이지</title>
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
    


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<section class="hero">
  <img src="hero-image.jpg" alt="Hero">
  <p>We help you find the perfect reservation.</p>
</section>

<div class="categories">
  <button>Italian</button>
  <button>French</button>
  <button>Seafood</button>
</div>

<section class="featured">
  <div class="card">
    <img src="food1.jpg" alt="Food 1">
    <h3>Italian Pasta</h3>
    <p>Top-rated pasta dishes.</p>
  </div>
  <div class="card">
    <img src="food2.jpg" alt="Food 2">
    <h3>French Croissants</h3>
    <p>Authentic French croissants.</p>
  </div>
  <div class="card">
    <img src="food3.jpg" alt="Food 3">
    <h3>Seafood Specials</h3>
    <p>Fresh seafood every day.</p>
  </div>
</section>

<section class="map-section">
  <img src="map.jpg" alt="Map">
  <div class="info">
    <h3>Ready to get started?</h3>
    <ul>
      <li>Benefit 1</li>
      <li>Benefit 2</li>
      <li>Benefit 3</li>
    </ul>
  </div>
</section>

<!-- Footer -->
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>

</body>
</html>
