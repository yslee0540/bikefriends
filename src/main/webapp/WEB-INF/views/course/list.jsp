<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스 공유하기</title>
<style type="text/css">
tr:hover {
	background: #f5f5f5;
}
</style>
</head>
<body>
<%@ include file="../../../nav.jsp"%>
<div id="main">
	<div id="top">
        <div id="title">코스 공유</div>
		<a href="insert.jsp"><button class="btn btn-primary">출발점/도착점 선택</button></a>
		<a href="insertline.jsp"><button class="btn btn-primary">코스그리기</button></a>
     </div>
     <hr>
	
	<table class="table" style="width:600px;">
		<tr class="table-secondary">
			<th width="120">작성자</th>
			<th>제목</th>
			<th width="70">별점</th>
			<th width="120">날짜</th>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td>${vo.writer}</td>
				<td>
					<c:choose>
						<c:when test="${empty vo.line_lat}">
							<a href="one?course_no=${vo.course_no}">${vo.title}</a>
						</c:when>
						<c:otherwise>
							<a href="one2?course_no=${vo.course_no}">${vo.title}</a>
						</c:otherwise>
					</c:choose>
				</td>
				<td>${vo.rate}</td>
				<td><fmt:formatDate value="${vo.date}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
	</table>
	<div id="search" style="text-align:center;padding-bottom:0px;">
		<form action="search">
			<input placeholder="제목" name="title">
			<input name="page" value="1" type="hidden">
			<button>검색</button>
		</form>
	</div>
</div>
</body>
</html>