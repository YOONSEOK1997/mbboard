<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div>
		${loginMember.memberId}님 반갑습니다
	</div>
	<div><a href="/logout">로그아웃</a></div>
	<div><a href="/member/info">마이페이지</a></div>
</body>
</html>
