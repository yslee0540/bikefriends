<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<p>${vo.nickname}! welcome</p>
	
	<button onclick="location.href='main.jsp'">메인화면으로</button> <br>
	<button id="b1">로그아웃</button>
</body>
</html>