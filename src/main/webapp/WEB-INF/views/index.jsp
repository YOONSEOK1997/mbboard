<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>index</h1>

<h2>전체</h2>

<table border="1">
	
	<tr>
		<th>ANONUMOUS</th>
		<th>USER</th>
		<th>ADMIN</th>
		<th>total</th>
	</tr>
	<tr>
		<td>${connectCountMapAll.anonymous}</td>
		<td>${connectCountMapAll.user}</td>
		<td>${connectCountMapAll.admin}</td>
		<td>${connectCountMapAll.anonymous + connectCountMapAll.user + connectCountMapAll.admin }</td>
		
	</tr>
</table>

<h2>오늘</h2>
<table border="1">
	
	<tr>
		<th>ANONUMOUS</th>
		<th>USER</th>
		<th>ADMIN</th>
		<th>total</th>
	</tr>
	<tr>
		<td>${connectCountMapToday.anonymous}</td>
		<td>${connectCountMapToday.user}</td>
		<td>${connectCountMapAToday.admin}</td>
		<td>${connectCountMapToday.anonymous + connectCountMapToday.user + connectCountMapToday.admin }</td>
	</tr>
</table>
<h2>현재 서버의 접속자(톰켓서버안에 활성이된 세션의 개수)</h2>
	<table border="1">
		<tr>
			<th>TOTAL</th>
		</tr>
		<tr>
			<td>${currentConnectCount}</td>
		</tr>
	</table>

</body>
</html>
