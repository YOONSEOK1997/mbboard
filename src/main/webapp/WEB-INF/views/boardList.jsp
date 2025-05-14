<%@ page contentType="text/html; charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            padding: 30px;
        }

        .board-list-container {
            max-width: 900px;
            margin: 0 auto;
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #343a40;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table thead {
            background-color: #343a40;
            color: white;
        }

        table th, table td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #dee2e6;
        }

        table tr:hover {
            background-color: #f1f3f5;
        }

        table td a {
            color: #007bff;
            text-decoration: none;
        }

        table td a:hover {
            text-decoration: underline;
        }

        .pagination {
            text-align: center;
            margin: 20px 0;
        }

        .pagination a, .pagination strong {
            margin: 0 5px;
            text-decoration: none;
            color: #495057;
        }

        .pagination strong {
            font-weight: bold;
            color: #007bff;
        }

        .write-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            float: right;
        }

        .write-btn:hover {
            background-color: #0056b3;
        }

        .search-form {
            margin-top: 20px;
            text-align: right;
        }

        .search-form input[type="text"] {
            padding: 8px;
            width: 250px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        .search-form button {
            padding: 8px 12px;
            border: none;
            background-color: #28a745;
            color: white;
            border-radius: 4px;
            margin-left: 5px;
        }

        .search-form button:hover {
            background-color: #218838;
        }

        /* clearfix */
        .clearfix::after {
            content: "";
            display: table;
            clear: both;
        }
    </style>
</head>
<body>

<div class="board-list-container">
    <h1>📋 게시판 목록</h1>

    <div class="search-form">
        <form method="get" action="/boardList">
            <input type="text" name="searchWord" placeholder="검색어를 입력하세요" value="${param.searchWord}">
            <button type="submit">검색</button>
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td>${board.boardNo}</td>
                    <td><a href="boardOne?boardNo=${board.boardNo}">${board.boardTitle}</a></td>
                    <td>${board.boardUser}</td>
                    <td>${board.createdate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

   <div class="pagination">
    <c:if test="${page.currentPage > 10}">
        <a href="?currentPage=${page.currentPage - 10}&searchWord=${param.searchWord}">&laquo; 이전</a>
    </c:if>

    <c:forEach var="i" begin="1" end="${page.lastPage}">
        <c:choose>
            <c:when test="${i == page.currentPage}">
                <strong>[${i}]</strong>
            </c:when>
            <c:otherwise>
                <a href="?currentPage=${i}&searchWord=${param.searchWord}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${page.currentPage < page.lastPage - 10}">
        <a href="?currentPage=${page.currentPage + 10}&searchWord=${param.searchWord}">다음 &raquo;</a>
    </c:if>
</div>


    <div class="clearfix">
        <a href="/boardWrite" class="write-btn">✏️ 작성하기</a>
    </div>
</div>

</body>
</html>
