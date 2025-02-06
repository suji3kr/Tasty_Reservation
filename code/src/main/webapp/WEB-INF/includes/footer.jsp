<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 푸터 스타일 추가 -->
<style>
#footer-container {
	border-top: 1px solid #ccc; /* 위쪽에 얇은 테두리 */
	border-bottom: 1px solid #ccc; /* 아래쪽에도 적용 가능 */
	background-color: #ffffff;
	border-top: 1px solid #e7e7e7;
	padding: 0 30px;
	text-align: center;
	display: flex;
	justify-content: center;
	width: 100%;
}

#footer-content {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	flex-wrap: wrap;
	max-width: 1200px;
	width: 100%;
	text-align: left;
}

.footer-column {
	width: 30%;
	padding: 10px;
}

.footer-column h3 {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 10px;
}

.footer-column ul {
	list-style-type: none;
	padding: 0;
}

.footer-column ul li {
	margin-bottom: 5px;
}

.footer-column ul li a {
	text-decoration: none;
	color: #333;
	font-size: 14px;
}

.footer-bottom {
	text-align: center;
	margin-top: 20px;
	font-size: 14px;
	color: #777;
}
</style>

<!-- 푸터 영역 -->
<div id="footer-container">
	<div id="footer-content">
		<!-- 첫 번째 컬럼: 회사 소개 -->
		<div class="footer-column">
			<h3>Company</h3>
			<ul>
				<li><a href="#">About</a></li>
				<li><a href="#">Careers</a></li>
				<li><a href="#">Press</a></li>
				<li><a href="#">Blog</a></li>
			</ul>
		</div>

		<!-- 두 번째 컬럼: 메뉴 -->
		<div class="footer-column">
			<h3>Resources</h3>
			<ul>
				<li><a href="#">Product</a></li>
				<li><a href="#">Features</a></li>
				<li><a href="#">Support</a></li>
				<li><a href="#">Documentation</a></li>
			</ul>
		</div>

		<!-- 세 번째 컬럼: 연락처 정보 -->
		<div class="footer-column">
			<h3>Contact</h3>
			<ul>
				<li>이메일: support@artofreservation.com</li>
				<li>핸드폰 번호: 010-1234-5678</li>
				<li>주소: 대한민국</li>
			</ul>
		</div>
	</div>
</div>
<!-- 저작권 정보 -->
<div class="footer-bottom">
	<p>&copy; 2025 Art Of Reservation. All Rights Reserved.</p>
</div>

<!-- JavaScript 및 플러그인 -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>
<script src="/resources/dist/js/sb-admin-2.js"></script>

<script>
	$(document).ready(
			function() {
				$(".sidevar-nav").attr("class",
						"sidebar-nav navbar-collapse collapse").attr(
						"aria-expanded", 'false').attr("style", "height:1px");
			});
</script>

</body>
</html>
