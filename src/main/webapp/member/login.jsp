<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
</head>
<body>
<center>
	<%
		if (session.getAttribute("id") != null) {
	%>
	<h3>이미 로그인 하셨습니다.</h3>
	<button onclick="location.href='myInfo.jsp'">내 정보</button><br>
	<%
	
		} else {
	%>
	<form action="sign_in" method="get">
		<table style="text-align:center">
		<tr><td colspan="2"><h2>로그인</h2></td></tr>
		<tr><td>아이디</td><td><input name="Sign_id" value=""></td></tr>
		<tr><td>비밀번호</td><td><input name="Sign_pw" value="" type="password"></td></tr>  
		<tr><td colspan="2"><button type="submit" style="padding: 5px 20px 5px 20px">로그인</button></td></tr>
		</table>
	</form>
	<hr>
		<div id="naver_id_login"></div>
    <!-- //네이버 로그인 버튼 노출 영역 -->
    <script type="text/javascript">
        var naver_id_login = new naver_id_login("Faa9w2Y7kH0XycxYku9B", "http://localhost:8898/bf/member/callback.jsp");
        var state = naver_id_login.getUniqState();
        naver_id_login.setButton("white", 2,40);
        naver_id_login.setDomain("http://localhost:8898/bf");
        naver_id_login.setState(state);
        //naver_id_login.setPopup();
        naver_id_login.init_naver_id_login();
    </script>
	<button onclick="location.href='findPassword.jsp'">비밀번호 찾기</button> | 
	<button onclick="location.href='sign_up.jsp'">회원가입</button>
	<%
		}
	%>
</center>
</body>
</html>