<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script     
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/out.css">
<link rel="stylesheet" type="text/css" href="../resources/css/bbsstyle.css">
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
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
			url : "../eventchallenge/challengelist",
			success : function(x) {
				$('#result').html(x)
			} //success
		}) //ajax
	})
		</script>
</head>
<body>
  <jsp:include page="../nav.jsp"></jsp:include>
  		<jsp:include page="menu.jsp"></jsp:include>
  
<div id="result"></div>
</body>
</html>