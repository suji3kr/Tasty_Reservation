<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/header.css">
</head>

<nav id="head-container">
	<!-- 로고 -->
	<a id="logo" href="${contextPath}/">Art Of Reservation</a>

	<!-- 네비게이션 바 -->
	<ul id="nav-menu">
		<li><a href="#"><b>사진 및 리뷰</b></a>
			<ul class="dropdown-menu">
				<li><a href="#">SNS 맛집</a></li>
				<li><a href="${contextPath}/photoGallery">포토 스팟</a></li>
				<li><a href="${contextPath}/reviewSpot">리뷰 스팟</a></li>
				<li><a href="#">실시간 Ai추천</a></li>
			</ul>
		</li>
		<li><a href="#"><b>테마</b></a>
			<ul class="dropdown-menu">
				<li><a href="${contextPath}/board/familyreservation">가족/단체예약</a></li>
				<li><a href="#">프라이빗데이트</a></li>
				<li><a href="#">키즈/노키즈</a></li>
				<li><a href="#">파티룸</a></li>
			</ul>
		</li>
		<li><a href="#"><b>음식 분류</b></a>
			<ul class="dropdown-menu">
				<li><a href="#">육식파</a></li>
				<li><a href="#">한식파</a></li>
				<li><a href="#">채식파</a></li>
				<li><a href="#">세계 요리</a></li>
			</ul>
		</li>

		<c:if test="${not empty sessionScope.loginEmail}">
			<li><a href="#"><b>내정보</b></a>
				<ul class="dropdown-menu">
					<li><a href="${contextPath}/board/favfood">즐겨찾는 맛집</a></li>
					<li><a href="#">예약맛집 관리</a></li>
					<li><a href="${contextPath}/member/update">회원정보 수정</a></li>
					<li><a href="${contextPath}/board/get">리뷰 관리</a></li>
				</ul>
			</li>
		</c:if>
	</ul>

	<!-- 로그인/회원가입 버튼 -->
	<div class="button-container">
		<%
		if (session.getAttribute("loginEmail") == null) {
		%>
		<a href="/member/login" class="btn btn-green">로그인</a>
		<a href="/member/signup" class="btn btn-black">회원가입</a>

		<%
		} else {
		%>
		<%
		String loginEmail = (String) session.getAttribute("loginEmail");
		String userName = (loginEmail != null) ? loginEmail.split("@")[0] : "";
		%>

		<p>
			<strong><%=userName%></strong>님, 환영합니다 🐱‍🏍
		</p>
		<a href="/member/logout" class="btn btn-black">로그아웃</a>
		<%
		}
		%>
	</div>
</nav>