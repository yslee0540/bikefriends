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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
	<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
	<link rel="stylesheet" href="resources/css/bbsstyle.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="/js/jquery.twbsPagination.js"></script>

<!-- jQuery -->
<script src="/js/jquery-3.6.0.min.js"></script>

<!-- Bootstrap -->
<script src="/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.min.css" />











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
.find-btn{
	text-align: center;
}
.find-btn1{
	display :inline-block;
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

	$(function() {
		$('.delete').click(function() {
			//alert($(this).attr("value"))
			
			$.ajax ({
			url : "delete", 
			data : { 
				id : $(this).attr("value")
			},
			success : function(x) {
				
				location.href="list_result.jsp"
				$('#result').append(x+"<br>")
				
			}

		}) //ajax
	}) //b2
	})
</script>
 <jsp:include page="/nav.jsp"></jsp:include>
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
						
						
						<td><button class="delete" value="${bag.pay_no}" >삭제</button></td>
					</tr>

				</c:forEach>
			</table>
	
		</main>
		<footer id="footer">
		<div class="pagination "style="display: flex; justify-content: center; align-items: center;">
  <%
	int pages = (int)request.getAttribute("pages");
	for(int p = 1; p <= pages; p++){
%>

	<a href=paidList?page=<%= p %>>
	
		<button style="background: lime; color: red; width: 50px;
		
		"><%= p %></button>
	
	</a>  

<%		
	}
%>
</div>
		
		<div class="paging-div">
  <ul class="pagination" id="pagination"></ul>
</div>
		 </footer>


	</div>
</body>
</html>