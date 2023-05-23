<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
$(function() {
	$('#b1').click(function() {
		$.ajax({
			url : "logout",
			type : "POST",
			success : function(x) {
				alert("로그아웃 되셨습니다.");
			}, error:function(e) {
			　　　　alert("error: " + e);
			}
		}) //ajax
	})//b1
})//$
</script>
</head>
<body>
<center>
(메인 페이지)

로그인 세션 : <%=session.getAttribute("id") %> <br>
<button onclick="location.href='login.jsp'">로그인 하러가기</button> <br>
<button id="b1">로그아웃</button>

<a href="myInfo.jsp">
	<button>내 정보</button>
</a>
</center>
</body>
</html>