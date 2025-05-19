<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쿠키 로그인 성공</title>
</head>
<body>
    <c:choose>
        <c:when test="${not empty cookie.loginMemberId.value}">
            ${cookie.loginMemberId.value}님 반갑습니다.
            <br>
            <a href="/cookieLogout">로그아웃</a>
        </c:when>
        <c:otherwise>
            쿠키 정보가 없습니다. 다시 로그인해주세요.
            <br>
            <a href="/cookieLogin">로그인 페이지로</a>
        </c:otherwise>
    </c:choose>
</body>
</html>
