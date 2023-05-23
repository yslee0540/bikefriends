<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var = "val01Name" value="${param.val01}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자전거정보</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "bikelistGetData",
			success : function(response) {
				console.log('response',response)
				//$('#main').html()
			} //success
		}) //ajaxssssss
	})//$
				
	
</script>
<link rel="stylesheet" href="../resources/css/bbsstyle.css">
<style>
#main {
	margin: auto;
	width: 600px;
	border: 1px solid rgb(240, 240, 240);
	border-radius: 15px;
	padding: 20px 0;
	height: auto;
} 

</style>
</head>
<body>	
	<jsp:include page="../../../nav.jsp"></jsp:include>
   <jsp:include page="bikelist.jsp">
		<jsp:param name="pages" value="${pages}" />		
	</jsp:include>

	
	<div id="main" style="padding-top: 0px;"></div>
</body>
</html>