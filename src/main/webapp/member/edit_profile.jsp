<%@page import="com.spring.bf.member.MemberVO"%>
<%@page import="com.spring.bf.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>수정하기</h3>
		<%
			if (session.getAttribute("id") != null) {
				String id = String.valueOf(session.getAttribute("id"));
				
				MemberDAO dao = new MemberDAO();
				MemberVO bag;
				bag = dao.select(id);
		%>
		<img src="../resources/img/<%=bag.getSign_img()%>" width="250" height="250" alt="내 프로필 사진"><br>
		<a href="file.jsp">
			<button>변경</button>
		</a>
		<form action="sign_update" method="get">
			<table style="text-align:center">
				<tr><td>이름</td><td><input name="Sign_name"></td></tr>
				<tr><td>나이</td><td><input name="Sign_age" type="number"></td></tr>  
				<tr><td>성별</td><td><input name="Sign_gender"></td></tr>
				<tr><td>소개</td><td><input name="Sign_bio"></td></tr>
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