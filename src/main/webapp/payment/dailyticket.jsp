<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<title>CSS 레이아웃 - 3단 레이아웃</title>
<meta charset="UTF-8">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	text-align: center;
}

#container {
	width: 600px;
	margin: 20px auto;
	text-align: center;
}

#header {
    
	line-height: 120px;
	width: 100%;
	height: 120px;
	text-align: center;
	background-color: #acacac;
}

#left-sidebar {
	width: 250px;
	height: 600px;
	background-color: #e9e9e9;
	float: left;
}

#contents {
	width: 600px;
	height:500px;
	background-color: #f7f7f7;
	float: left;
}

#footer {
	width: 100%;
	height: 120px;
	background-color: #888888;
	text-align: center;
	clear: left;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 3px 1px;
	cursor: pointer;
}

.button3 {border-radius: 8px; width: 30%;}
.button4 {border-radius: 8px; width: 20%;background-color: #008CBA;}
.button5 {border-radius: 8px; width: 15%;background-color: lime;}
div.c {
  font-size: 20px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
 var money = 0;
	$(function() {
		$('#b2').click(function() {
			$.ajax({
				url: "json1000",
				dataType : "json",
				success: function(json) {
					
					money = json.money
					
					
					$('#result').html(money)
				} //success
			}) //ajax
		})//b3
		
	
	
		$('#b3').click(function() {
			$.ajax({
				url: "json2000",
				dataType : "json",
				success: function(json) {
					
					money = json.money
					
					
					$('#result').html(money)
				} //success
			}) //ajax
		})//b3
		
		$(".button5").click(function() {
			//value = $(".button4").
			alert(money)
			location.href="구매하기.jsp?money="+ money
				
			
		})//b3
		
	})//$
	
	
</script>




</head>

<body>
	<div id="container">
		<header id="header">
			<h1>이용권 선택</h1>
			
			<a href="paidList"><button>구매내역</button></a>
				</header>
		
		<main id="contents">
		<a href="dailyticket.jsp">
		<button class="button button3">일일권</button>
		</a>|
		<a href="regularticket.jsp">
		<button class="button button3">정기권</button>
		</a>
		<hr color="gray"><br><br><br>
		<div class="c">기본 대여 시간</div><br>
		
		<br> <br> <br> <br>
		
		<button id="b2" class="button button4" value="1000">1시간<br>1000</button>
		<button id="b3" class="button button4" value="2000">2시간<br>2000</button>
		<br> <br> <br>
			</main>
		<hr color="red">
		
		<footer id="footer">
			<h2>결제금액</h2><div id="result"></div>
			
			<button  class="button button5">다음</button>
			
		</footer>
	</div>
</body>

</html>