<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script     
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/out.css">
<link rel="stylesheet" type="text/css" href="../resources/css/bbsstyle.css">
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
#main {
	margin: auto;
	width: 600px;
	border: 1px solid rgb(240, 240, 240);
	border-radius: 15px;
	box-shadow: 2px 2px 10px rgb(240, 240, 240);
	padding: 20px 0;
	height: auto;
	border: 1px solid rgb(240 240 240);
}
</style>
</head>
<body>
<jsp:include page="../../../nav.jsp"></jsp:include>
<div  style="text-align : center;"><img src="../resources/img/event/${vo.img}" width="400" height="400"></div>
<div id="main">
작성자:${vo.writer}<br>
</div>
<div id="main">
${vo.content}<br>
</div>
<div id="main">
작성날짜:${vo.date}<br>
</div>

</body>
</html>