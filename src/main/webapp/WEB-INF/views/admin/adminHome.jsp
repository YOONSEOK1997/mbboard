<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h1>admin page </h1>
    <div>${loginMember.memberId} </div>
    <div><a href="/logout">로그아웃</a></div>

    <h2>멤버 리스트</h2>
    <table border="1">
        <tr>
            <th>아이디</th>
            <th>권한</th>
        </tr>
        <c:forEach var="member" items="${memberList}">
            <tr>
                <td>
                    ${member.memberId}
                    <input type="hidden" class="memberId" value="${member.memberId}">
                </td>
                <td>
                   <select class="memberRole">
    <option value="admin" ${member.memberRole eq 'admin' ? 'selected' : ''}>admin</option>
    <option value="user" ${member.memberRole eq 'user' ? 'selected' : ''}>user</option>
</select>

                </td>
            </tr>
        </c:forEach>
    </table>

    <br>
    <button id="saveBtn">수정 완료</button>

    <script>
        $('#saveBtn').click(function () {
            const updates = [];

            $('tr').each(function () {
                const id = $(this).find('.memberId').val();
                const role = $(this).find('.memberRole').val();

                if (id && role) {
                    updates.push({ memberId: id, memberRole: role });
                }
            });

            $.ajax({
                url: '/admin/updateMemberRole',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(updates),
                success: function (res) {
                    if (res === 'success') {
                        alert('수정 완료');
                        location.reload();
                    } else {
                        alert('수정 실패');
                    }
                }
            });
        });
    </script>
</body>
</html>
