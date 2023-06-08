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
		<br>
		<input type="text" name="reciever" value="${param.sender}">
		<br>
 		<label for="title">제목:</label>
        <input type="text" id="title" name="title"><br><br>
        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="5" cols="50"></textarea><br><br>
        <button type="submit">전송</button>
        </form>
</body>
</html>