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
<h1>로그인 페이지</h1>
	
<!-- 로그인 안되어 있다면 -->
	<form method="post" action ="/login">
		<div>
			<div>memberId:</div>
			<div><input type="text" name="memberId"  value="${cookie.saveId.value}"></div>
			 <!-- cooke.getSaveId() -->				
				<input type="checkbox" value="yes" name="saveIdCk">아이디 저장
			<div>memberPw:</div>
			<div><input type="password" name="memberPw"></div>
			<div><button type="submit">로그인</button></div>
		</div>
	</form>
	<c:if test="${not empty error}">
    <div style="color: red">${error}</div>
</c:if>
	
	<div><a href="/joinMember">회원가입</a></div>
	<div><a href="/findMemberPw">비밀번호 찾기</a></div>
	<!-- 로그인 되어 있다면 -->

	<div>
		${loginMember.memberId }님 
		<a href="/member/memberHome">memberHome</a> 으로 이동
		<br>
		<a href="/admin/adminHome">adminHome</a> 으로 이동
	</div>
	<div><a href="/logout">로그아웃</a></div>

	
</body>
</html>
