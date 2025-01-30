<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>헤더</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/header.css">
</head>
<body>

    <table border="0" width="100%">
        <tr>
            <td>
                <a href="${contextPath}/main.do">
                    <img src="${contextPath}/resources/image/duke_swing.gif" />
                </a>
            </td>
            <td>
                <h1><font size="30">Art Of Reservation</font></h1>
            </td>
            <td align="right">
                <c:choose>
                    <c:when test="${not empty sessionScope.loginEmail}">
                        <h3>환영합니다, ${sessionScope.loginEmail}님!</h3>
                        <a href="${contextPath}/member/logout"><h3>로그아웃</h3></a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/member/login"><h3>로그인</h3></a>
                        <a href="${contextPath}/member/signup"><h3>회원 가입</h3></a>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </table>

    <nav>
        <ul>
            <li><a href="#"><b>Hot spot</b></a>
                <ul class="dropdown-menu">
                    <li><a href="#">SNS 맛집</a></li>
                    <li><a href="#">포토 스팟</a></li>
                    <li><a href="#">리뷰 스팟</a></li>
                    <li><a href="#">실시간 Ai추천</a></li>
                </ul>
            </li>
            <li><a href="#"><b>Thema</b></a>
                <ul class="dropdown-menu">
                    <li><a href="${contextPath}/board/familyreservation">가족/단체예약</a></li>
                    <li><a href="#">프라이빗데이트</a></li>
                    <li><a href="#">키즈/노키즈</a></li>
                    <li><a href="#">파티룸</a></li>
                </ul>
            </li>
            <li><a href="#"><b>Favorite</b></a>
                <ul class="dropdown-menu">
                    <li><a href="#">육식파</a></li>
                    <li><a href="#">한식파</a></li>
                    <li><a href="#">채식파</a></li>
                    <li><a href="#">세계 요리</a></li>
                </ul>
            </li>

            <c:if test="${not empty sessionScope.loginEmail}">
                <li><a href="#" class="Myprofile"><b>My profile</b></a>
                    <ul class="dropdown-menu">
                        <li><a href="${contextPath}/board/favfood">즐겨찾는 맛집</a></li>
                        <li><a href="#">예약 맛집</a></li>
                        <li><a href="#">예약 수정</a></li>
                        <li><a href="#">리뷰 관리</a></li>
                    </ul>
                </li>
            </c:if>
        </ul>
    </nav>

</body>
</html>
