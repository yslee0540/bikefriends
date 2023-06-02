<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 변경</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="resources/css/bbsstyle.css">	
</head>
<body>
	<center>
	<br>
		<h3>비밀번호 변경</h3>
		<%
			if (session.getAttribute("id") != null) {
		%>
		<form action="sign_password" method="get" class="table" style="vertical-align: middle;">
			<table style="text-align:center">
				<tr><td style="text-align: center;">비밀번호</td><td><input class="form-control" name="Sign_pw" type="password" value=""></td></tr>
				<tr><td style="text-align: center;">비밀번호 확인</td><td><input class="form-control" name="Sign_pw2" type="password" value=""></td></tr>  
			</table>
			<button class="btn btn-primary" type="submit" style="padding: 5px 20px 5px 20px">수정</button>
		</form>
		<%
			} else {
		%>
		<span>로그인해야 접근 할 수 있습니다. </span><br>
		<a href="login.jsp">
			<button class="btn btn-primary">로그인 화면으로</button>
		</a>
		<%
			}
		%>
	</center>
</body>
</html>