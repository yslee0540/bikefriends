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
		<c:choose>
			<c:when test="${id != null}">
		        <div id="title">코스 공유</div>
				<a href="insertline.jsp"><button class="btn btn-primary">코스그리기</button></a>
			</c:when>
			<c:otherwise>
		        <div id="title2">코스 공유</div>
			</c:otherwise>
		</c:choose>
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
				<td><a href="one?course_no=${vo.course_no}">${vo.title}</a></td>
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
	<%
		int pages = (int) request.getAttribute("pages");
		int nowpage = Integer.parseInt(request.getParameter("page"));
	%>
	<div id="page">
		<ul class="pagination justify-content-center">
			<%
				if (nowpage > 1) {
			%>
			<li class="page-item"><a class="page-link"
				href="list?page=<%= nowpage - 1 %>">Previous</a>
			</li>
			<%
				} else {
			%>
			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
			<%
				}
			%>
			<%
				for (int p = 1; p <= pages; p++) {
				if (p == nowpage) {
			%>
			<li class="page-item active"><a class="page-link"
				href="list?page=<%= p %>"><%=p%></a>
			</li>
			<%
				} else {
			%>
			<li class="page-item"><a class="page-link"
				href="list?page=<%= p %>"><%=p%></a>
			</li>
			<%
				}
			}
			%>
			<%
				if (nowpage < pages) {
			%>
			<li class="page-item"><a class="page-link"
				href="list?page=<%= nowpage + 1 %>">Next</a>
			</li>
			<%
				} else {
			%>
			<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
			<%
				}
			%>
		</ul>
	</div>
</div>
</body>
</html>