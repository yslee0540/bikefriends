<%@page import="com.spring.bf.note.NoteVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>보낸 쪽지함</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 20px;
}

th, td {
	text-align: left;
	padding: 8px;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: lightgray;
}

h1 {
	text-align: center;
	margin-top: 30px;
	font-size: 36px;
}

h2 {
	text-align: left;
	margin-top: 0px;
	font-size: 24px;
}

button {
	float: right;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<link rel="stylesheet" href="../resources/css/bbsstyle.css">
</head>
<body>
	<jsp:include page="/nav.jsp"></jsp:include>
	<h1>보낸 쪽지함</h1>
	<div>
		<a href="receive_notelist?receiver=<%= session.getAttribute("id") %>"><button type="button" id="receive">받은쪽지함</button></a>
		<a href="send_notelist?sender=<%= session.getAttribute("id") %>"><button type="button" id="send">보낸쪽지함</button></a> 
	</div>
	<div id = "notePage" style="width: 500px; margin: auto;">
	<table id="noteTable">
		<tr>
			<th>받은 사람</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${list}" var="bag">
			<tr>
				<td>${bag.receiver}</td>
				<td><a href="send_note?no=${bag.no}">${bag.title}</a></td>
				<td>${bag.date}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<button type="button" onclick="location.href='NoteSend.jsp'">쪽지보내기</button>
	<script>
		
	</script>
</body>
</html>