<%@page import="com.spring.bf.pay.PayVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="/js/jquery.twbsPagination.js"></script>

<!-- jQuery -->
<script src="/js/jquery-3.6.0.min.js"></script>

<!-- Bootstrap -->
<script src="/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.min.css" />

<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "payList2", //views/payList2.jsp가 결과!
			data : {
				page : 1
			},
			success : function(result) { //결과가 담겨진 table부분코드
				$('#d1').html(result)
			},
			error : function() {
				alert('실패.@@@')
			}
		}) //ajax
		
		//alert('test...')
		$('#b1').click(function() {
			$.ajax({
				url : "payList", //views/payList.jsp가 결과!
				success : function(result) { //결과가 담겨진 table부분코드
					$('#d1').html(result)
				},
				error : function() {
					alert('실패.@@@')
				}
			}) //ajax
		}) //b1
		$('#b2').click(function() {
			$.ajax({
				url : "payList2", //views/payList2.jsp가 결과!
				data : {
					start : 1, 
					end : 5
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('#d1').html(result)
				},
				error : function() {
					alert('실패.@@@')
				}
			}) //ajax
		}) //b2
		
		$('#b3').click(function() {
			$.ajax({
				url : "payList2", //views/payList2.jsp가 결과!
				data : {
					start : 6, 
					end : 10
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('#d1').html(result)
				},
				error : function() {
					alert('실패.@@@')
				}
			}) //ajax
		}) //b3
		
		$('#b4').click(function() {
			$.ajax({
				url : "payList2", //views/payList2.jsp가 결과!
				data : {
					page : 1
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('#d1').html(result)
				},
				error : function() {
					alert('실패.@@@')
				}
			}) //ajax
		}) //b4
		
		$('#b5').click(function() {
			$.ajax({
				url : "payAll", //views/payList2.jsp가 결과!
				data : {
					page : 2
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('#d1').html(result)
				},
				error : function() {
					alert('실패.@@@')
				}
			}) //ajax
		}) //b5
		
	})
</script>









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
	height: 500px;
	background-color: #f7f7f7;
	float: left;
}

#footer {
	width: 100%;
	height: 100px;
	background-color: #888888;
	text-align: center;
	clear: left;
}

td {
	width: 100px;
	text-align: center;
}

.top {
	background: black;
	color: white;
}

.down {
	background: lime;
}
</style>


</head>
<body>

	<script type="text/javascript">
		const onclick_es6 = (value) => {
			console.log(value)
		}
		
		function onclick_es5(value) {
			console.log('onclick_es5')
		}
		
</script>
	<script type="text/javascript">
	$(function() {
		$('#delete').click(function() {
			console.log('delete')
		})//b3
		
		
	})//$
</script>

	<div id="container">
		<header id="header">
			<h1>구매내역</h1>
		</header>
		<main id="contents">
			<table>
				<tr>
					<td class="top">아이디</td>
					<td class="top">구매금액</td>
					<td class="top">구매자</td>
					<td class="top">전화번호</td>
					<td class="top">email</td>
				</tr>

				<c:forEach items="${list}" var="bag">

					<tr>
						<td class="down">${bag.id}</td>
						<td class="down">${bag.money}</td>
						<td class="down">${bag.name}</td>
						<td class="down">${bag.tel}</td>
						<td class="down">${bag.email}</td>
						
						
						<td><button id="delete" >삭제</button></td>
					</tr>

				</c:forEach>
			</table>
	
		</main>
		<footer id="footer">
		<div class="pagination">
  <a href="#">&laquo;</a>
  <a href="#">1</a>
  <a href="#">2</a>
  <a href="#">3</a>
  <a href="#">4</a>
  <a href="#">5</a>
  <a href="#">6</a>
  <a href="#">&raquo;</a>
</div>
		
		<div class="paging-div">
  <ul class="pagination" id="pagination"></ul>
</div>
		 </footer>


	</div>
</body>
</html>