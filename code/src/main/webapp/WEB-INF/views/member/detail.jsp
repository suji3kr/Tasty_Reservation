<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
</head>
<body>
	<table>
        <tr>
            <th>id</th>
            <td>${member.id}</td>
        </tr>
        <tr>
            <th>email</th>
            <td>${member.email}</td>
        </tr>
        <tr>
            <th>password</th>
            <td>${member.password}</td>
        </tr>
        <tr>
            <th>name</th>
            <td>${member.username}</td>
        </tr>
        <tr>
            <th>age</th>
            <td>${member.age}</td>
        </tr>
        <tr>
            <th>phone</th>
            <td>${member.phone}</td>
        </tr>
        <tr>
            <th>gender</th>
            <td>${member.gender}</td>
        </tr>
    </table>
    
     <!-- 메인화면으로 이동하는 링크 -->
    <a href="/">메인화면으로 이동</a>
</body>
</html>