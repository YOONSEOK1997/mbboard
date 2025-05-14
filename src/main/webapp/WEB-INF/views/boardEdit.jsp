<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f1f3f5;
            padding: 30px;
        }

        .edit-container {
            max-width: 700px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #343a40;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 20px;
            font-weight: bold;
            color: #495057;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        .btn-group {
            margin-top: 30px;
            text-align: right;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            border: none;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            margin-left: 10px;
        }

        .btn-submit {
            background-color: #007bff;
            color: white;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        .btn-cancel {
            background-color: #6c757d;
            color: white;
        }

        .btn-cancel:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<div class="edit-container">
    <h1>✏️ 게시글 수정</h1>

    <form method="post" action="boardEdit">
        <input type="hidden" name="boardNo" value="${board.boardNo}" />

        <label for="title">제목:</label>
        <input type="text" id="title" name="boardTitle" value="${board.boardTitle}" required />

        <label for="user">작성자:</label>
        <input type="text" id="user" name="boardUser" value="${board.boardUser}" required />

        <label for="content">내용:</label>
        <textarea id="content" name="boardContent" rows="10" required>${board.boardContent}</textarea>

        <div class="btn-group">
            <input type="submit" class="btn btn-submit" value="수정 완료" />
            <a href="boardOne?boardNo=${board.boardNo}" class="btn btn-cancel">취소</a>
        </div>
    </form>
</div>

</body>
</html>
