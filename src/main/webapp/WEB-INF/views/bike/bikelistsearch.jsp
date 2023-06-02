<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<style>
#main {
	margin: auto;
	width: 600px;
	border: 1px solid rgb(240, 240, 240);
	border-radius: 15px;
	box-shadow: 2px 2px 10px rgb(240, 240, 240);
	padding: 20px 0;
	height: auto;
}

#divleft {
	border: 3px solid black;
	height: auto;
	margin: 10px;
}
</style>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$('.pages').click(function() {
			$.ajax({
				url : "bikelistsearch",
				data : {
					page : $(this).text(),
					searchtype : '${searchtype}',
					keyword : '${keyword}'
				
				},
				success : function(result) {
					$('#main').html(result)
				},
				error : function() {
					alert('실패.@@@')
				}
			}) //ajax
		})
		
		$('#searchbtn').click(function() {
			var searchtype = $('[name=searchtype]').val()
			var keyword = $('[name=keyword]').val()
			$.ajax({
				url : "bikelistsearchdata",
				data : {
					searchtype : searchtype,
					keyword : keyword
				},
				success : function(result) {
					$('#main').html(result)
				},
				error : function() {
					alert('실패.@@@')
				}
			}) //ajax
		})
		

	})//$
</script>
</head>
<body>
	<div id="main">
		<c:forEach items="${list}" var="bag">
			<a href="bikeone?bike_no=${bag.bike_no}">
				<div id="divleft">
					<img src="../resources/img/bike/${bag.bike_img}"
						style="width: 200px; height: 100px; float: left;">
					<h4>
						<div>브랜드명: ${bag.bike_brand}</div>
					</h4>
					<p>제품명 : ${bag.bike_name}</p>
					<p>제품 종류: ${bag.bike_category}</p>
				</div>
			</a>
		</c:forEach>
		<div
			style="display: flex; justify-content: center; align-items: center; width: 100%;">
			<%
				int pages = (int) request.getAttribute("pages");

			for (int p = 1; p <= pages; p++) {
			%>
			
			
			<button
				style="background: gray; color: white; width: 50px; text-align: center; margin: 0px 4px 0px 4px;' "
				class="pages"><%=p%></button>
			<%
				}
			%>
		</div>
		<div
			style="display: flex; justify-content: center; align-items: center; margin-top: 10px">
			<select name="searchtype">
				<option value="bike_brand">브랜드</option>
				<option value="bike_category">종류</option>
			</select> <input type="text" name="keyword">
			<button type="button" id="searchbtn">검색</button>
		</div>
	</div>
</body>
</html>