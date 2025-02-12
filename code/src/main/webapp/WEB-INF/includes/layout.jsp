<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>AOR</title>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/layout.css">
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
	</div>

	<!-- 헤더 -->
	<!-- <div id="header">
            <div id="logo">Art Of Reservation</div>
            <ul id="nav-menu">
                <li><a href="#">Hot spot</a></li>
                <li><a href="#">Themes</a></li>
                <li><a href="#">Who are</a></li>
                <li><a href="#">My profile</a></li>
            </ul>
            <div id="auth-buttons">
                <a id="login" href="/member/login">Sign in</a>
                <a id="signup" href="/member/signup">Sign Up</a>
            </div>
        </div> -->

	<!-- 메인 배너 -->
	<!--         <div id="main-banner">
            <p>We help you find the perfect reservation.</p>
        </div>

        카드형 UI
        <div id="card-section">
            <div class="card"></div>
            <div class="card"></div>
            <div class="card"></div>
            <div class="card"></div>
        </div>
 -->
	<!-- 메인 컨텐츠 -->
	<div id="content">
		<tiles:insertAttribute name="body"/>
	</div>

	<!-- 지도 및 정보 -->
	<!--     <div id="info-section">
            <div id="map"></div>
            <div id="info-box">
                <h3>Feature that is amazing</h3>
                <p>Learn more about our service, consectetur adipiscing elit.</p>
                <ul>
                    <li>Benefit of Feature</li>
                    <li>Benefit of Feature</li>
                    <li>Benefit of Feature</li>
                </ul>
            </div>
        </div> -->

	<!-- 푸터 -->
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
	


</body>
</html>