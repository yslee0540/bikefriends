<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
	<link rel="stylesheet" href="resources/css/bbsstyle.css">	
</head>
<body>
	<center>
	 	<jsp:include page="../../../nav.jsp"></jsp:include>
		<h3>수정하기</h3>
		<%
			if (session.getAttribute("id") != null) {
		%>
		<img src="../resources/img/${vo.sign_img}" width="250" height="250" alt="내 프로필 사진"><br>
		<a href="file.jsp">
			<button>변경</button>
		</a>
		<form action="sign_update" method="get">
			<table style="text-align:center">
				<tr><td>이름</td><td><input name="Sign_name" value="${vo.sign_name}"></td></tr>
				<tr><td>나이</td><td><input name="Sign_age" type="number" value="${vo.sign_age}"></td></tr>  
				<tr><td>성별</td><td><input name="Sign_gender" value="${vo.sign_gender}"></td></tr>
				<tr><td>소개</td><td><input name="Sign_bio" value="${vo.sign_bio}"></td></tr>
				<tr><td>이메일</td><td><input name="Sign_email" value="${vo.sign_email}"></td></tr>
				<tr><td>주소</td><td><input name="Sign_address" value="${vo.sign_address}"></td></tr>
				<tr><td>전화번호</td><td><input name="Sign_phone" value="${vo.sign_phone}"></td></tr>
				<tr><td colspan="2"><button type="submit" style="padding: 5px 20px 5px 20px">수정</button></td></tr>
			</table>
		</form>
		<%
			} else {
		%>
		<span>로그인해야 접근 할 수 있습니다. </span><br>
		<a href="login.jsp">
			<button>로그인 화면으로</button>
		</a>
		<%
			}
		%>
	</center>
</body>
</html>