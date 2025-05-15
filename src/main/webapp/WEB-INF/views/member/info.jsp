<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 상세정보 및 비밀번호 변경</title>
</head>
<body>

    <h1>${loginMember.memberId}님 상세정보</h1>
    <div>
        MEMBER_ROLE : ${loginMember.memberRole}
    </div>

    <hr>

    <h3>비밀번호 수정</h3>
    <form id="passwordForm" method="post" action="/member/updatePassword">

        <label for="newPw">새 비밀번호</label><br>
        <input type="password" id="newPw" name="newPw" required><br><br>

        <label for="confirmPw">새 비밀번호 확인</label><br>
        <input type="password" id="confirmPw" name="confirmPw" required><br><br>

        <div id="pwError" style="color:red; display:none;">새 비밀번호가 일치하지 않습니다.</div>

        <button type="submit">비밀번호 변경</button>
    </form>
<c:if test="${not empty error}">
    <div style="color: red;">${error}</div>
</c:if>

<c:if test="${not empty msg}">
    <div style="color: blue;">${msg}</div>
</c:if>

    <hr>

   

    <script>
      document.getElementById('passwordForm').addEventListener('submit', function(e) {
        var newPw = document.getElementById('newPw').value;
        var confirmPw = document.getElementById('confirmPw').value;
        var errorDiv = document.getElementById('pwError');

        if (newPw !== confirmPw) {
          e.preventDefault();
          errorDiv.style.display = 'block';
        } else {
          errorDiv.style.display = 'none';
        }
      });
    </script>

</body>
</html>
