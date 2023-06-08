<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script     
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/out.css">
<link rel="stylesheet" type="text/css" href="../resources/css/event.css">
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<link rel="stylesheet" type="text/css" href="../resources/css/bbsstyle.css">
</head>
<body>
  <jsp:include page="../../../nav.jsp"></jsp:include>
  <div class="row" style="width: 850px; margin: auto;">
		<jsp:include page="menu.jsp"></jsp:include> 


<div id="main" class="col-6">
			<div id="top">
			</div>
			<table class="table style=width:650px;">
	<tr style="text-align:center;background-color: #b7d5ac;">
    	<th colspan="6 ">번개 모임</th>
    </tr>
	<tr align="center">
		<td class="top" width="150"></td>
		<td class="top" width="150">제목</td>
		<td class="top" width="150">글쓴이</td>
		<td class="top" width="150">장소</td>
		<td class="top" width="200">모임 날짜</td>
		<td class="top" width="150">참여 인원</td>
	</tr>

	<c:forEach var="eventVO" items="${list}">

		<tr align="center">
			<td class="down">${eventVO.no}</td>
			<td class="down"><a href="one?event_id=${eventVO.no}">${eventVO.title}</a></td>
			<td class="down">${eventVO.event_id}</td>
			<td class="down"  >${eventVO.event_location}</td>
			<td class="down">${eventVO.event_date}</td>
			<td class="down">${eventVO.event_size}</td>
		</tr>

	</c:forEach>
</table>
			</div>
			</div>

</body>

</html>