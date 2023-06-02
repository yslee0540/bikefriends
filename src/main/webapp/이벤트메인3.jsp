<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script     
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/out.css">
<link rel="stylesheet" type="text/css" href="resources/css/bbsstyle.css">
<link rel="stylesheet" type="text/css" href="resources/css/style.css">

<style>
#result{
width:750px;
margin: auto;
}
</style>
<script type="text/javascript">
	$(function() {
		//시작하자마자 $.ajax() 호출하면 됨. 
		$.ajax({
			url : "event/list",
			success : function(x) {
				$('#result').html(x)
			} //success
		}) //ajax
	})
		</script>
</head>

<body>
 <jsp:include page="nav.jsp"></jsp:include>

<div id="div">
<div class="main">이벤트</div>
<div id="category">
	<ul class="list-group">
		<li class="list-group-item menu"><a href="event/이벤트개설.jsp" class="link">같이달려요</a></li>
		<li class="list-group-item menu"><a href="event/이벤트개설2.jsp" class="link">인증샷 챌린지</a></li>
	</ul>
</div>
</div>
<br><br><br><br><br><br><br><br><br>
<div id="result"></div>

</body>

</html>