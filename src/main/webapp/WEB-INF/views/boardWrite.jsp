<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 작성</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            padding: 30px;
        }

        .form-container {
            max-width: 700px;
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

        label {
            display: block;
            margin-top: 20px;
            margin-bottom: 6px;
            font-weight: bold;
            color: #495057;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ced4da;
            border-radius: 6px;
            font-size: 15px;
            background-color: #fff;
            color: #212529;
        }

        textarea {
            resize: vertical;
        }

        .button-group {
            text-align: right;
            margin-top: 30px;
        }

        button {
            background-color: #28a745;
            color: white;
            padding: 10px 22px;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        button:hover {
            background-color: #218838;
        }
    </style>
    
</head>
<body>

<div class="form-container">
    <h1>✏️ 게시글 작성</h1>

    <form action="${pageContext.request.contextPath}/boardWrite" method="post">
        <label for="boardTitle">제목</label>
        <input type="text" id="boardTitle" name="boardTitle" required>

        <label for="boardContent">내용</label>
        <textarea id="boardContent" name="boardContent" rows="10" required></textarea>

        <label for="boardUser">작성자</label>
        <input type="text" id="boardUser" name="boardUser" value="unnamed" required>

        <div class="button-group">
            <button type="submit" onclick="checker()">등록</button>
        </div>
    </form>
</div>
<script>
	function checker() {
		var boardTitle = document.getElementById('boardTitle');
		var boardContent = document.getElementById('boardContent');
		var boardUser = document.getElementById('boardUser');
		
		if(!boardTitle.value){
			alert("제목을 입력하세요");
			boardTitle.focus();
			return false;
		}
		if(!boardContent.value){
			alert("내용을 입력하세요");
			boardContent.focus();
			return false;
		}
	
		
	}
</script>
</body>
</html>
