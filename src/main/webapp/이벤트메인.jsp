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
	<script type="text/javascript" src="resources/js/jquery-3.6.1.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/out.css">
<script type="text/javascript">
	$(function() {
		//시작하자마자 $.ajax() 호출하면 됨. 
		$.ajax({
			url : "event/list",
			success : function(x) {
				$('#result').append(x)
			} //success
		}) //ajax
	})
		</script>
</head>

<body>

 <jsp:include page="nav.jsp"></jsp:include>
	<div id="div">
			<div class="main">이벤트</div>
			<br>
			<div id="category">
				<ul class="list-group">
					<li class="list-group-item menu"><a href="myevent/내가가입한이벤트.jsp" class="link">내가 가입한 이벤트</a></li>
					<li class="list-group-item menu"><a href="event/이벤트개설.jsp" class="link">이벤트개설</a></li>
					<li class="list-group-item menu"><a href="location/공유자전거.jsp" class="link">공유자전거</a></li>
				</ul>
			</div>
	</div>
	<br><br><br><br><br><br><br><br>
	<div id="result"></div>
	

</body>

</html>