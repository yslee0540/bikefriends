<%@page import="com.spring.bf.member.MemberVO"%>
<%@page import="com.spring.bf.member.MemberDAO"%>
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
   
	
	<h3 class="main_image_text" style="font-size:30px">잘못된 접근입니다. one?id=(id값)으로 호출해주세요</h3>
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
	<div enctype="multipart/form-data">
		이름 : <%=name%><br>
		성별 : <%=gender%><br>
		나이 : <%=age%><br>
		소갯말 : <%=bio%><br>
		이메일 : <%=email%><br>
		주소 : <%=address%><br>
		전화번호 : <%=phone%><br>
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