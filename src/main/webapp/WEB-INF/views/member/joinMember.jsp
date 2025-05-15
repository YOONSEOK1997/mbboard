<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
   <!-- jQuery CDN (필요 시) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
function checkId() {
    const memberId = $("#memberId").val();
    const resultSpan = $("#idCheckResult");

    if (!memberId) {
        resultSpan.text("아이디를 입력하세요.").css("color", "red");
        return;
    }

    $.ajax({
        url: "checkId",
        type: "GET",
        data: { memberId: memberId },
        success: function(response) {
            if (response === "OK") {
                resultSpan.text("사용 가능한 아이디입니다.").css("color", "blue");
            } else if (response ==="DUPLICATE"){
                resultSpan.text("이미 사용 중인 아이디입니다.").css("color", "red");
            }
            else{
            	alert("오류 발생");
            }
        },
        error: function() {
            resultSpan.text("서버 오류 발생").css("color", "red");
        }
    });
}
</script>

    
</head>
<body>
	<form action="joinMember" method="post">
   <label for="memberId">아이디</label>
<input type="text" id="memberId" name="memberId" required>
<button type="button" onclick="checkId()">중복확인</button>
<span id="idCheckResult"></span>


    <label for="memberPw">비밀번호</label>
    <input type="password" id="memberPw" name="memberPw" required>

    <label for="memberRole">role </label>
	 <select name="memberRole">
  		<option value="admin">admin</option>
  		<option value="user">user</option>
    </select>


    <input type="submit" value="회원가입">
</form>
	
</body>
</html>
