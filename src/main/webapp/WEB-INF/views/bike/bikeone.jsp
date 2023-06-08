<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>	
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	
	$(function() {
		$('#bikereplybtn').click(function() {
			bikereply_writer = "<%=session.getAttribute("id")%>"
			bikereply_writername = "<%=session.getAttribute("name")%>"
			bikereply_content =  $('#content').val()
			bikereply_rating =  $('input[name=rating]:checked').val();
			if(bikereply_content == '' ){
				alert("리뷰를 작성해주세요")
			}else{
			$.ajax({
				url : "bikereplyinsert",
				data : {	
					bike_no : ${bag.bike_no},
					bikereply_writer : bikereply_writer,
					bikereply_content : bikereply_content,
					bikereply_rating : bikereply_rating,
					bikereply_writername : bikereply_writername
				},
				success : function(x) {
					$('#insertreply').html(x)
					location.reload()
				}//success
			})//ajax
		}
		})
		 
		 $(document).on('click', '#replydel', function() {
			if (confirm('리뷰 삭제하시겠습니까?')) {
				$.ajax({
					url: "bikereplydelete",
					data: {
						bikereply_no: $(this).data('no')
					},
					success: function() {
						alert('리뷰 삭제 완료')
						location.reload()
					}//success
				})//ajax
			}//if
		})//document 
		
		/* 리뷰 수정 버튼 */
		 $(document).on('click', '#replyup', function(e){
					
			 
				e.preventDefault();
				bikereply_no = $(this).data('no')
				let popUrl = "bikereplyupdate?bikereply_no=" + bikereply_no	
				let popOption = "width = 800px, height=490px, top=300px, left=300px, scrollbars=yes"	
				
				window.open(popUrl,"리뷰 수정",popOption);			
			 
		 });
	})
	
	 
	
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bbsstyle.css">
<link rel="stylesheet" href="../resources/css/bikestyle.css">
<title>자전거상세페이지</title>
</head>
<body>
	<jsp:include page="../../../nav.jsp"></jsp:include>
	<div id="main">
		<div>
			<img src="../resources/img/bike/${bag.bike_img}"
				style="width: 580px; height: 300px;">

			<table border="1" style="width: 600px; border-collapse: collapse;">
				<tr style="border: 1px solid #444444;">
					<td class="onelefttd" style="border: 1px solid #444444;">브랜드</td>
					<td class="onerighttd" style="border: 1px solid #444444;">${bag.bike_brand}</td>
				</tr>
				<tr style="border: 1px solid #444444;">
					<td class="onelefttd" style="border: 1px solid #444444;">제품명</td>
					<td class="onerighttd" style="border: 1px solid #444444;">${bag.bike_name}</td>
				</tr>
				<tr style="border: 1px solid #444444;">
					<td class="onelefttd" style="border: 1px solid #444444;">분류</td>
					<td class="onerighttd" style="border: 1px solid #444444;">${bag.bike_category}</td>
				</tr>
				<tr style="border: 1px solid #444444;">
					<td colspan="2" align="center"
						onClick="window.open('${bag.bike_detail}')"
						style="cursor: pointer; border: 1px solid #444444;">상세정보</td>
				</tr>
			</table>
		</div>
		<!--로그인 하지않으면 리뷰 작성 안됨  -->
		<%if(session.getAttribute("id") != null){ %>
		<div id="bikereply">
			<form id="myform">
				<fieldset>
					<span class="text-bold">추천점수</span> <input type="radio"
						name="rating" value="★★★★★" id="rate1" ><label for="rate1">★</label>
					<input type="radio" name="rating" value="★★★★" id="rate2"><label
						for="rate2">★</label> <input type="radio" name="rating"
						value="★★★" id="rate3"><label for="rate3">★</label> <input
						type="radio" name="rating" value="★★" id="rate4"><label
						for="rate4">★</label> <input type="radio" name="rating" value="★"
						id="rate5" checked="checked"><label for="rate5">★</label>
				</fieldset>
				<div>
					<textarea style="resize: none; width: 100%;" id="content"
						name="bikereply_content" placeholder="1000자 이내로 작성해주세요"></textarea>
				</div>	
			</form>
			<button style="float: right;" id="bikereplybtn">작성</button>
			<br>
		</div>
		<%} %>
		<div id="onereply" style="width: 100%;">
			<c:forEach items="${list}" var="vo" varStatus="vs">
				<table style="width: 100%; height:100px; margin-bottom:3px; border: 1px solid #444444; table-layout: fixed;">
					<tr>
						<td style="width: 15%; color: #FAD000;">${vo.bikereply_rating}</td>
						<td style="width: 60%; text-align: right;">${vo.bikereply_writername}</td>
						<td style="width: 25%; text-align: right; font-size: 6px">${vo.date}</td>
					</tr>
					<tr>
						<td colspan="3" style="width: 100%;  overflow-x:auto;">${vo.bikereply_content}</td>
					</tr>
					<!--로그인한 ID와 작성한 ID가 동일할시 -->
					<c:choose>
					<c:when test="${id == vo.bikereply_writer}">
					<tr>
						<td colspan="3">
							<button id="replyup" style="float: right;"
								data-no="${vo.bikereply_no}" class="btn btn-secondary">수정</button>
							<button id="replydel" style="float: right;  margin-right: 5px;"
								data-no="${vo.bikereply_no}" class="btn btn-secondary">삭제</button>
						</td>
					</tr>
					</c:when>
					</c:choose>
				</table>
			</c:forEach>
		</div>
		<div id="insertreply" style="width: 100%;"></div>
	</div>
</body>
</html>