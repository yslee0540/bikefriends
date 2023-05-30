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

#messageTable {
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
<link rel="stylesheet" href="resources/css/bbsstyle.css">
<script>
function deleteMessages() {
	var checkboxes = document.querySelectorAll('input[name="messageCheckbox"]:checked');
	var messageTable = document.getElementById('messageTable');
	for (var i = 0; i < checkboxes.length; i++) {
		var checkbox = checkboxes[i];
		var row = checkbox.closest('tr');
		messageTable.removeChild(row);
	}
}

function changePage(page) {
	// 페이지 변경 로직 작성
	alert('이동할 페이지: ' + page);
}
</script>
</head>
<body>
<jsp:include page="/nav.jsp"></jsp:include>

<div id="main" style="padding-top: 0px;">
</div>
<h1>받은 쪽지함</h1>
<div>
	<a href="receive_notelist?receiver=<%= session.getAttribute("id") %>"><button type="button" id="receive">받은쪽지함</button></a>
	<a href="send_notelist?sender=<%= session.getAttribute("id") %>"><button type="button" id="send">보낸쪽지함</button></a> 
</div>
<table id="messageTable">
	<tr>
		<th class="checkbox-column"></th>
		<th>보낸 사람</th>
		<th>제목</th>
		<th>날짜</th>
			</tr>
	<!-- model.addAttribute("list", list); -->
	<c:forEach items="${list}" var="bag">
		<tr>
			<td class="checkbox-column">
				<input type="checkbox" name="messageCheckbox">
			</td>
			<td>${bag.sender}</td>
			<td><a href="receive_note?no=${bag.no}">${bag.title}</a></td>
			<td>${bag.date}</td>
		</tr>
	</c:forEach>
</table>
<button type="button" onclick="deleteMessages()">선택 삭제</button>
<button type="button" onclick="location.href='NoteSend.jsp'">쪽지보내기</button>
<div class="paging">
	<c:choose>
		<c:when test="${currentPage > 1}">
			<a href="#" onclick="changePage(${currentPage - 1})">&lt; 이전</a>
		</c:when>
		<c:otherwise>
			<span class="disabled">&lt; 이전</span>
		</c:otherwise>
	</c:choose>
	<c:forEach begin="1" end="${totalPages}" var="page">
		<c:choose>
			<c:when test="${page == currentPage}">
				<a href="#" class="active">${page}</a>
			</c:when>
			<c:otherwise>
				<a href="#" onclick="changePage(${page})">${page}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${currentPage < totalPages}">
			<a href="#" onclick="changePage(${currentPage + 1})">다음 &gt;</a>
		</c:when>
		<c:otherwise>
			<span class="disabled">다음 &gt;</span>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>
		
