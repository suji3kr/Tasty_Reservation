<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/header.css">
</head>

<nav id="head-container">
    <!-- 로고 -->
    <a id="logo" href="${contextPath}/">Art Of Reservation</a>

    <!-- 네비게이션 바 -->
    <ul id="nav-menu">
        <li><a href="#"><b>Hot Spot</b></a>
            <ul class="dropdown-menu">
                <li><a href="#">SNS 맛집</a></li>
                <li><a href="#">포토 스팟</a></li>
                <li><a href="#">리뷰 스팟</a></li>
                <li><a href="#">실시간 Ai추천</a></li>
            </ul>
        </li>
        <li><a href="#"><b>Themes</b></a>
            <ul class="dropdown-menu">
                <li><a href="${contextPath}/board/familyreservation">가족/단체예약</a></li>
                <li><a href="#">프라이빗데이트</a></li>
                <li><a href="#">키즈/노키즈</a></li>
                <li><a href="#">파티룸</a></li>
            </ul>
        </li>
        <li><a href="#"><b>Who are</b></a>
            <ul class="dropdown-menu">
                <li><a href="#">육식파</a></li>
                <li><a href="#">한식파</a></li>
                <li><a href="#">채식파</a></li>
                <li><a href="#">세계 요리</a></li>
            </ul>
        </li>

        <c:if test="${not empty sessionScope.loginEmail}">
            <li><a href="#"><b>My Profile</b></a>
                <ul class="dropdown-menu">
                    <li><a href="${contextPath}/board/favfood">즐겨찾는 맛집</a></li>
                    <li><a href="#">예약 맛집</a></li>
                    <li><a href="#">예약 수정</a></li>
                    <li><a href="#">리뷰 관리</a></li>
                </ul>
            </li>
        </c:if>
    </ul>

    <!-- 로그인/회원가입 버튼 -->
    <div id="auth-buttons">
        <c:choose>
            <c:when test="${not empty sessionScope.loginEmail}">
                <span>환영합니다, ${sessionScope.loginEmail}님!</span>
                <a id="login" href="${contextPath}/member/logout">로그아웃</a>
            </c:when>
            <c:otherwise>
                <a id="login" href="${contextPath}/member/login">Login</a>
                <a id="signup" href="${contextPath}/member/signup">Sign Up</a>
            </c:otherwise>
        </c:choose>
    </div>
</nav>
