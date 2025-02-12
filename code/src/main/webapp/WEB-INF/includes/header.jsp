<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/header.css">
</head>

<nav id="head-container">
	<!-- 로고 -->
	<a id="logo" href="${contextPath}/">Art Of Reservation</a>

	<!-- 네비게이션 바 -->
	<ul id="nav-menu">
		<li><a href="#"><b>사진 및 리뷰</b></a>
			<ul class="dropdown-menu">
				<li><a href="${contextPath}/recommendations">SNS 맛집</a></li>
				<li><a href="${contextPath}/photoGallery">포토 스팟</a></li>
				<li><a href="${contextPath}/reviewSpot">리뷰 스팟</a></li>
				<li><a href="${contextPath}/recommend">실시간 Ai추천</a></li>
			</ul></li>
		<li><a href="#"><b>테마</b></a>
			<ul class="dropdown-menu">
				<li><a href="${contextPath}/board/familyreservation">가족/단체예약</a></li>
				<li><a href="${contextPath}/board/privateroom">프라이빗룸</a></li>
				<li><a href="${contextPath}/board/kidnokids">키즈/노키즈</a></li>
				<li><a href="${contextPath}/board/partyroom">파티룸</a></li>
			</ul></li>
		<li><a href="#"><b>음식 분류</b></a>
			<ul class="dropdown-menu">
				<li><a href="${contextPath}/category/japen">일식맛집추천</a></li>
				<li><a href="${contextPath}/category/korean">한식맛집추천</a></li>
				<li><a href="${contextPath}/category/china">중식맛집추천</a></li>
				<li><a href="${contextPath}/category/western">양식맛집추천</a></li>
			</ul></li>
			
		<c:if test="${not empty sessionScope.loginEmail}">
			<li><a href="#"><b>${sessionScope.userRole eq 'admin' ? '가게정보관리' : '내정보'}</b></a>
				<ul class="dropdown-menu">
					<!-- 즐겨찾는 맛집 / 내가게 히스토리 (Admin vs User 분기) -->
					<c:choose>
						<c:when test="${sessionScope.userRole eq 'admin'}">
							<li><a href="${contextPath}/store/storeList">등록된 스토어</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${contextPath}/board/favfood">즐겨찾는 맛집</a></li>
						</c:otherwise>
					</c:choose>

					<!-- 예약 맛집 관리 (Admin vs User 분기) -->
					<c:choose>
						<c:when test="${sessionScope.userRole eq 'admin'}">
							<li><a href="${contextPath}/board/reservation_admin">예약손님
									관리</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${contextPath}/board/reservation_user">예약맛집
									관리</a></li>
						</c:otherwise>
					</c:choose>

					<!-- 회원정보 수정/ 가게정보 관리/수정 (Admin vs User 분기) -->
					<c:choose>
						<c:when test="${sessionScope.userRole eq 'admin'}">
							<li><a href="${contextPath}/board/register">맛집가게 등록</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${contextPath}/member/update">회원정보수정</a></li>
						</c:otherwise>
					</c:choose>
				</ul></li>
		</c:if>

	</ul>

	<!-- 로그인/회원가입 버튼 -->
	<div class="button-container">
		<%
		if (session.getAttribute("loginEmail") == null) {
		%>
		<a href="/member/login" class="btn btn-green">로그인</a> <a
			href="/member/signup" class="btn btn-black">회원가입</a>

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