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
	<h1>rechangeMemberP</h1>
	<form>
		<div>
		 <input type="text" name="memberId" placeholder="memberId">	
	</div>
	
	<div>
	 <input type="password" name="memberPw" placeholder="메일로 받은 PW">
	</div>
	<div>
 	<input type="password" name="reMemberPw" placeholder="변경할 Pw">
	</div>
	<button type="submit"> 패스워드 변경</button>
	</form>
</body>
</html>
