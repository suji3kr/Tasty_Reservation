<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Art Of Reservation</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
</head>
<body>
	<header>
		<div class="head-container">
			<a href="/" class="logo">Art Of Reservation</a>
			<nav>
				<ul>
					<li><a href="#"><b>Hot spot</b></a>
						<ul class="dropdown-menu">
							<li><a href="#">SNS 맛집</a></li>
							<li><a href="#">포토 스팟</a></li>
							<li><a href="#">리뷰 스팟</a></li>
							<li><a href="#">실시간 Ai추천</a></li>
						</ul></li>
					<li><a href="#"><b>Thema</b></a>
						<ul class="dropdown-menu">
							<li><a href="/board/familyreservation">가족/단체예약</a></li>
							<li><a href="#">프라이빗데이트</a></li>
							<li><a href="#">키즈/노키즈</a></li>
							<li><a href="#">파티룸</a></li>
						</ul></li>
					<li><a href="#"><b>Favorite</b></a>
						<ul class="dropdown-menu">
							<li><a href="#">육식파</a></li>
							<li><a href="#">한식파</a></li>
							<li><a href="#">채식파</a></li>
							<li><a href="#">세계 요리</a></li>
						</ul></li>
					<%-- 로그인 상태 확인 --%>
					<%
					if (session.getAttribute("loginEmail") != null) {
					%>
					<li><a href="#" class="Myprofile"><b>My profile</b></a>
						<ul class="dropdown-menu">
							<li><a href="/board/favfood">즐겨찾는 맛집</a></li>
							<li><a href="#">예약 맛집</a></li>
							<li><a href="#">예약 수정</a></li>
							<li><a href="#">리뷰 관리</a></li>
						</ul></li>
					<%
					}
					%>
				</ul>
			</nav>
			<div class="buttons">
				<%
				if (session.getAttribute("loginEmail") == null) {
				%>
				<a href="/member/login" class="btn btn-green">Sign in</a> <a
					href="/member/signup" class="btn btn-black">Sign Up</a>

				<%
				} else {
				%>
				<a href="/member/update" class="btn btn-green">회원정보수정</a> <a
					href="/member/logout" class="btn btn-black">Logout</a>
				<%
				}
				%>
			</div>
		</div>
	</header>
</body>
</html>
