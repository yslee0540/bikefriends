<%@page import="com.spring.bf.note.NoteVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>받은 쪽지함</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 20px;
}

th, td {
	text-align: left;
	padding: 8px;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: lightgray;
}

h1 {
	text-align: center;
	margin-top: 30px;
	font-size: 36px;
}

h2 {
	text-align: left;
	margin-top: 0px;
	font-size: 24px;
}

button {
	float: right;
}

.checkbox-column {
	width: 20px;
	text-align: center;
}

#noteTable {
	position: relative;
}

.delete-button {
	position: absolute;
	top: 50%;
	left: 10px;
	transform: translateY(-50%);
	display: none;
}

.paging {
	text-align: center;
	margin-top: 20px;
}

.paging a {
	margin: 0 5px;
}

.paging .active {
	font-weight: bold;
}

</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/bf/resources/js/jquery-3.6.4.js"></script>
<link rel="stylesheet" href="/bf/resources/css/bbsstyle.css">
<script>
$(function() {

	$('#delete').on('click', function() {
		var checkboxes = document.querySelectorAll('input[name="noteCheckbox"]:checked');
		 if (checkboxes.length === 0) {
		        alert("삭제할 쪽지가 없습니다.");
		        return;
		    }
		 	//alert(checkboxes)
		 	var notes = [];
		    for(let index =0; index<checkboxes.length; index++){
		        notes.push(checkboxes[index].value);
		    }
		
		    for(let index=0; index < notes.length; index++){
			    $.ajax({
			        url: 'delete', 
			        data: {
			        	no: notes[index]
			        },  
			        success: function(response) {
			        	location.href='receive_notelist?receiver=<%= session.getAttribute("id") %>'
			        	console.log("쪽지가 삭제되었습니다.");
			        },
			        error: function() {
			            console.log("쪽지 삭제에 실패했습니다.");
			        }
			    });//ajax
		    }
	})
	
	  
})//function
</script>
</head>
<body>
	<jsp:include page="/nav.jsp"></jsp:include>
	<h1>받은 쪽지함</h1>
	<div>
		<a href="receive_notelist?receiver=<%= session.getAttribute("id") %>"><button
				type="button" id="receive">받은쪽지함</button></a> <a
			href="send_notelist?sender=<%= session.getAttribute("id") %>"><button
				type="button" id="send">보낸쪽지함</button></a>
	</div>
	<div id = "notePage" style="width: 500px; margin: auto;">
		<table id="noteTable">
			<tr>
				<th class="checkbox-column"></th>
				<th>보낸 사람</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
			<!-- model.addAttribute("list", list); -->
			<c:forEach items="${list}" var="bag">
				<tr>
					<td class="checkbox-column"><input type="checkbox"
						name="noteCheckbox" value="${bag.no}"></td>
					<td>${bag.sender}</td>
					<td><a href="receive_note?no=${bag.no}">${bag.title}</a></td>
					<td>${bag.date}</td>
				</tr>
			</c:forEach>
		</table>
	
	</div>
	
		<button type="button" id="delete" >선택 삭제</button>
		<button type="button" onclick="location.href='NoteSend.jsp'">쪽지보내기</button>
	

</body>
</html>

