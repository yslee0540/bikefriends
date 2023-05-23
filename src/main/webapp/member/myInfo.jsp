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
	<h3>마이 페이지</h3>
	<%
	if (session.getAttribute("id") != null) {
	String id = String.valueOf(session.getAttribute("id"));
	
	MemberDAO dao = new MemberDAO();
	MemberVO bag;
	bag = dao.select(id);
		
	System.out.println(bag);
	System.out.println(id);
	String name = bag.getSign_name();
	String gender = bag.getSign_gender();
	String bio = bag.getSign_bio();
	String img = bag.getSign_img();
	int age = bag.getSign_age();
	String birthday = bag.getSign_birthday();
	String email = bag.getSign_email();
	String address = bag.getSign_address();
	String phone = bag.getSign_phone();
	
%>
	<img src="../resources/img/<%=img%>" width="250" height="250" alt="내 프로필 사진">
	<div>
		이름 : <%=name%><br>
		성별 : <%=gender%><br>
		나이 : <%=age%><br>
		소갯말 : <%=bio%><br>
	</div>
	<a href="edit_profile.jsp">
		<button>수정하기</button>
	</a>
	<%
		} else {
	%>
	<a href="login.jsp">
		<button>로그인 화면으로 go</button>
	</a>
	<%
		}
	%>
</center>
</body>
</html>