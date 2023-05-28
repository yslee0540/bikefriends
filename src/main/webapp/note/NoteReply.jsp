<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답장 보내기</title>
</head>
<body>
<form action="insert" method="post">
		<input type="text" name="sender" value="<%= session.getAttribute("id") %>"> 

		<input type="text" name="reciever" value="${param.sender}">
 		<label for="title">제목:</label>
        <input type="text" id="title" name="title"><br><br>
        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="5" cols="50"></textarea><br><br>
        <label for="date">시간: </label><br>
	<%
		java.time.LocalDateTime now = java.time.LocalDateTime.now();
		java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		String formattedDateTime = now.format(formatter);
	%>
	<input type="datetime-local" id="date" name="date" value="<%= formattedDateTime %>"><br>
        <button type="submit">전송</button>
        </form>
</body>
</html>