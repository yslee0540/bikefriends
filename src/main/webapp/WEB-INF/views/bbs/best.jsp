<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기게시판</title>
</head>
<body>
<%@ include file="../../../nav.jsp" %>
	<div id="main">

		<div id="top">
			<div id="title2">인기 게시판</div>
		</div>
		<hr>
		<table class="table">
			<tr class="table-info">
				<th width="70">그룹명</th>
				<th>내용</th>
				<th width="120">날짜</th>
				<th width="70">조회수</th>
				<th width="70">좋아요</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td style="word-wrap: break-word;">${vo.group_name}</td>
					<td class="scontent"><a href="one?bbs_no=${vo.bbs_no}">${vo.content}</a>
					</td>
					<td>${vo.date}</td>
					<td>${vo.hit}</td>
					<td>${vo.like_cnt}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>