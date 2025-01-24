<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<script>
	const deleteMember = (id) => {
		console.log(id);
		location.href = "/member/delete?id="+ id;
	}
</script>
<meta charset="UTF-8">
<title>List</title>
</head>
<body>
	<table>
		<tr>
			<th>id</th>
			<th>email</th>
			<th>password</th>
			<th>name</th>
			<th>age</th>
			<th>phone</th>
			<th>gender</th>
			<th>조회</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${memberList}" var="member">
			<tr>
				<td>${member.id}</td>
				<td>
					<a href="/member?id=${member.id}">${member.email}</a>			
				</td>
				<td>${member.password}</td>
				<td>${member.username}</td>
				<td>${member.age}</td>
				<td>${member.phone}</td>
				<td>${member.gender}</td>
				<td>
					<a href="/member?id=${member.id}">조회</a>	
				</td>
				<td>
					<button onclick="deleteMember('${member.id}')">삭제</button>	
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>