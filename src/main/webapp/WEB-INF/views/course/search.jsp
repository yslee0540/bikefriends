<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	/* int pages = (int) request.getAttribute("pages");
	int nowpage = Integer.parseInt(request.getParameter("page")); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<%@ include file="header.jsp"%>
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
			<div id="title2">
				'<%=title%>' 검색결과
			</div>
		</div>
		<hr>
		<c:if test="${empty list}">
			<div style="text-align: center;">검색 결과 없음</div>
		</c:if>
		<c:if test="${!empty list}">
			<table class="table">
				<tr class="table-secondary">
					<th width="120">작성자</th>
					<th>제목</th>
					<th width="150">날짜</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td style="word-wrap: break-word;">${vo.writer}</td>
						<td class="scontent"><a href="one?course_no=${vo.course_no}">${vo.title}</a>
						</td>
						<td>${vo.date}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<div id="search" style="text-align:center;padding:20px 0 0;">
			<form action="search">
				<input placeholder="제목" name="title">
				<input name="page" value="1" type="hidden">
				<button>검색</button>
			</form>
		</div>
		<%-- <div id="page">
			<ul class="pagination justify-content-center">
				<%
					if (nowpage > 1) {
				%>
				<li class="page-item"><a class="page-link"
					href="search?group_no=<%= group_no %>&content=<%= content %>&page=<%= nowpage - 1 %>">Previous</a>
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
					href="search?group_no=<%= group_no %>&content=<%= content %>&page=<%= p %>"><%=p%></a></li>
				<%
					} else {
				%>
				<li class="page-item"><a class="page-link"
					href="search?group_no=<%= group_no %>&content=<%= content %>&page=<%= p %>"><%=p%></a></li>
				<%
					}
				}
				%>
				<%
					if (nowpage < pages) {
				%>
				<li class="page-item"><a class="page-link"
					href="search?group_no=<%= group_no %>&content=<%= content %>&page=<%= nowpage + 1 %>">Next</a>
				</li>
				<%
					} else {
				%>
				<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				<%
					}
				%>
			</ul>
		</div> --%>
	</div>
</body>
</html>