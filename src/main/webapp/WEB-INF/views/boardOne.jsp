<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 상세 페이지</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            padding: 30px;
        }

        .board-detail-container {
            max-width: 800px;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th, td {
            border-bottom: 1px solid #dee2e6;
            padding: 12px 16px;
            text-align: left;
        }

        th {
            background-color: #f1f3f5;
            width: 20%;
            color: #495057;
        }

        td {
            color: #212529;
        }

        .action-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .action-buttons a {
            text-decoration: none;
            padding: 10px 16px;
            border-radius: 6px;
            font-size: 14px;
            color: #fff;
            transition: background-color 0.2s;
        }

        .btn-list {
            background-color: #6c757d;
        }

        .btn-edit {
            background-color: #007bff;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-list:hover {
            background-color: #5a6268;
        }

        .btn-edit:hover {
            background-color: #0056b3;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#deleteBtn').click(function () {
                deleteBoard(${board.boardNo});
            });
        });

        function deleteBoard(boardNo) {
            if (!confirm("정말 삭제하시겠습니까?")) return;

            $.ajax({
                url: '/boardDelete',
                type: 'POST',
                data: { boardNo: boardNo },
                success: function () {
                    alert("삭제 완료되었습니다.");
                    location.href = '/boardList';
                },
                error: function () {
                    alert("삭제 실패! 다시 시도해 주세요.");
                }
            });
        }
    </script>
</head>
<body>

<div class="board-detail-container">
    <h1>📄 게시글 상세 보기</h1>

    <table>
        <tr>
            <th>게시글 번호</th>
            <td>${board.boardNo}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.boardUser}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>${board.createdate}</td>
        </tr>
        <tr>
            <th>수정일</th>
            <td>${board.updatedate}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${board.boardContent}</td>
        </tr>
    </table>

    <div class="action-buttons">
        <a href="/boardList" class="btn-list">목록으로</a>
        <a href="/boardEdit?boardNo=${board.boardNo}" class="btn-edit">수정하기</a>
        <a href="javascript:void(0);" id="deleteBtn" class="btn-delete">삭제하기</a>
    </div>
</div>

</body>
</html>
