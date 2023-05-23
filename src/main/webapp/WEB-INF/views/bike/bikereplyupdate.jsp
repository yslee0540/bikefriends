<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">


$(function() {
$("#b1").click(function() {
	$.ajax({
		url : 'bikereplyupdate2',
		data : {
			bikereply_no : ${vo.bikereply_no},
			bikereply_content : $('#content').val()
		},
		success : function(result){
			opener.location.href = 'bikeone?bike_no=' + ${vo.bike_no}		
			window.close();
		}		
		})
	})
})
</script>
<style type="text/css">
#main {
	margin: auto;
	width: 600px;
	border: 1px solid rgb(240, 240, 240);
	border-radius: 15px;
	box-shadow: 2px 2px 10px rgb(240, 240, 240);
	padding: 20px 0;
	height: auto;
}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../resources/css/bbsstyle.css">
<title>자전거 리뷰 수정</title>
</head>
<body>
	<jsp:include page="../../../nav.jsp"></jsp:include>
	<div id="main">
		<div style="padding: 0px 20px 10px;">
			<b>리뷰 수정하기</b>
		</div>
		<textarea id="content" rows="10" cols="60"
			style="width: 560px; margin: 10px 20px 0; resize: none;">${vo.bikereply_content}</textarea>
		<div style="padding: 10px 20px 0; text-align: right;">
			<button id="b1">수정</button>
		</div>
	</div>
</body>
</html>