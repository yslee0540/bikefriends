<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background="lime">
 <jsp:include page="/nav.jsp"></jsp:include>
이미지 업로드 성공!!<img src="../resources/upload/${savedName}" width=300 height=300> <br> <br>
<hr color="red">
등록된 아이디는 ${eventVO.event_id} <br>
등록된 location은 ${eventVO.event_location} <br>

</body>
</html>