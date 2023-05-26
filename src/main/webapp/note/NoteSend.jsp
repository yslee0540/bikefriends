<%@page import="com.spring.bf.note.NoteVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
</head>
<body>
 <form action="insert" method="post">
        <label for="receiver">받는 사람:</label>
        <input type="text" id="receiver" name="receiver" value="samsung"><br><br>
        <label for="sender">보내는 사람:</label>
        <input type="text" id="sender" name="sender" value="apple"><br><br>
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" value="안녕"><br><br>
        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="5" cols="50">......</textarea><br><br>
        <label for="date">시간: </label><br>
        <input type="date" id="date" name="date" value="2023-05-18">
       
        <button type="submit">전송</button>
    </form>
</body>
</html>