<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../resources/css/bbsstyle.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		text-align: center;
	}
</style>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
</head>
<body>	
<jsp:include page="../nav.jsp"></jsp:include>
<center>
	<form action="mail" method="get">
	<table style="text-align:center">
		<tr><td colspan="2"><h3>비밀번호를 찾고자 하는 ID를 입력해주세요</h3></td></tr>
		<tr><td>아이디</td><td><input name="id" id="id" value=""></td></tr>
		<tr><td colspan="2"><input type="submit" id="submit" style="padding: 5px 20px 5px 20px" value="찾기"></td></tr>
	</table>
	</form>
</center>
</body>
</html>