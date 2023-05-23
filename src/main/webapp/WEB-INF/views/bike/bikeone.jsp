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
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	
	$(function() {
		$('#bikereplybtn').click(function() {
			bikereply_writer = "APPLE"
			bikereply_content =  $('#content').val()
			bikereply_rating =  $('input[name=rating]:checked').val();
			$.ajax({
				url : "bikereplyinsert",
				data : {	
					bike_no : ${bag.bike_no},
					bikereply_writer : bikereply_writer,
					bikereply_content : bikereply_content,
					bikereply_rating : bikereply_rating,
				},
				success : function(x) {
					$('#insertreply').html(x)
					location.reload()
				}//success
			})//ajax
		})//bikereplybtn bikereply데이터베이스에 저장
		 
		 $(document).on('click', '#replydel', function() {
			if (confirm('댓글 삭제하시겠습니까?')) {
				$.ajax({
					url: "bikereplydelete",
					data: {
						bikereply_no: $(this).data('no')
					},
					success: function() {
						alert('댓글 삭제 완료')
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
				let popOption = "width = 600px, height=490px, top=300px, left=300px, scrollbars=yes"	
				
				window.open(popUrl,"리뷰 수정",popOption);			
			 
		 });
	})
	
	 
	
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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

.onelefttd {
	width: 20%;
	text-align: center;
}

.onerighttd {
	width: 80%;
	text-align: center;
}

#myform fieldset {
	width: 100%;
	display: inline-block;
	direction: rtl;
	border: 0;
	text-align: center;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 2em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
	width: 100%;
	height: 100px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}
</style>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../resources/css/bbsstyle.css">
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
		<div id="bikereply">
			<form id="myform">
				<fieldset>
					<span class="text-bold">추천점수</span> <input type="radio"
						name="rating" value="★★★★★" id="rate1"><label for="rate1">★</label>
					<input type="radio" name="rating" value="★★★★" id="rate2"><label
						for="rate2">★</label> <input type="radio" name="rating"
						value="★★★" id="rate3"><label for="rate3">★</label> <input
						type="radio" name="rating" value="★★" id="rate4"><label
						for="rate4">★</label> <input type="radio" name="rating" value="★"
						id="rate5"><label for="rate5">★</label>
				</fieldset>
				<div>
					<textarea style="resize: none; width: 100%;" id="content"
						name="bikereply_content" placeholder="1000자 이내로 작성해주세요"></textarea>
				</div>
			</form>
			<button style="float: right;" id="bikereplybtn">등록</button>
			<br>
		</div>
		<div id="onereply" style="width: 100%;">
			<c:forEach items="${list}" var="vo" varStatus="vs">
				<table style="width: 100%; margin: 5px;">
					<tr>
						<td style="width: 15%; color: #FAD000;">${vo.bikereply_rating}</td>
						<td style="width: 60%; text-align: right;">${vo.bikereply_writer}</td>
						<td style="width: 25%; text-align: right; font-size: 6px">${vo.date}</td>
					</tr>
					<tr>
						<td colspan="3">${vo.bikereply_content}</td>
					</tr>
					<tr>
						<td colspan="3">
							<%-- <a href="bikereplyupdate?bikereply_no=${vo.bikereply_no}"> --%>
							<button id="replyup" style="float: right;"
								data-no="${vo.bikereply_no}">수정</button>
							<!-- </a> -->
							<button id="replydel" style="float: right;"
								data-no="${vo.bikereply_no}">삭제</button>
						</td>
					</tr>
				</table>
			</c:forEach>
		</div>
		<div id="insertreply" style="width: 100%;"></div>
	</div>
</body>
</html>