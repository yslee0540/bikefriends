<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/out.css">
<link rel="stylesheet" type="text/css" href="../resources/css/event.css">
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<link rel="stylesheet" type="text/css" href="../resources/css/bbsstyle.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script     
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body background="lime">
 <jsp:include page="/nav.jsp"></jsp:include>
<img src="../resources/upload/${savedName}" width=300 height=300> <br> 
등록이 완료되었습니다.
<hr color="red">
약속 날짜는 ${eventVO.event_date} <br>
등록된 location은 ${eventVO.event_location} <br>

</body>
</html>