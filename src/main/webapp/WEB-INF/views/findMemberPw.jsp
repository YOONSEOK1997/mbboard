<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<form method="post" action ="/findMemberPw">
	<input type="text" name="memberId" placeholder="ID를 입력해주세요">
	<br>
	<input type="text" name="email" placeholder="email를 입력해주세요">
 	<button type="submit">비밀번호 찾기</button>
	</form>
</body>
</html>
