<%@page import="com.spring.bf.note.NoteVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bag.title}</title>
<style>
  .container {
    display: grid;
    grid-template-columns: auto 1fr;
    grid-gap: 10px; 
  }
  
  .content {
    max-height: 500px;
    overflow: auto;
  }
  
  .label {
    font-weight: bold;
    margin-bottom: 5px;
  }
  
.box {
    border: 1px solid #ccc;
    padding: 5px;
  }
  
  .box1 {
  	border: 1px solid #ccc;
  	padding: 10px; 
  	white-space: pre-wrap; 
  	word-break: break-word;
  }
</style>
</head>
<body>
<!-- 받은 쪽지 상세페이지  -->
  <div class="container">
    <div class="label">보낸 사람:</div>
    <div class = "box">${bag.sender}</div>
    <div class="label">날짜:</div>
    <div class = "box">${bag.date}</div>
    <div class="label">제목:</div>
    <div class = "box">${bag.title}</div>
    <div class="label">내용:</div>
    <div class = "box1">${bag.content}</div>
  </div>
 <button type="button" onclick="location.href='NoteReply.jsp?sender=${bag.sender}'">답장 보내기</button>
</body>
</html>