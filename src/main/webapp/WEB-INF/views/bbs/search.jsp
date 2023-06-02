<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String content = request.getParameter("content");
	String group_no = request.getParameter("group_no");
	int pages = (int) request.getAttribute("pages");
	int nowpage = Integer.parseInt(request.getParameter("page"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<style type="text/css">
tr:hover {
	background: #f5f5f5;
}
</style>
<%@ include file="header.jsp"%>
</head>
<body>
<%@ include file="../../../nav.jsp"%>
<div class="row" style="width: 850px;margin: auto;">
	<jsp:include page="menu2.jsp"></jsp:include>
    
	<div id="main" class="col-6">

		<div id="top">
			<div id="title2">
				'<%=content%>' 검색결과
			</div>
		</div>
		<hr>
		<c:if test="${empty list}">
			<div style="text-align: center;">검색 결과 없음</div>
		</c:if>
		<c:if test="${!empty list}">
			<table class="table">
				<tr style="background-color: #b7d5ac;">
					<th width="100">작성자</th>
					<th>내용</th>
					<th width="150">날짜</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td style="word-wrap: break-word;">${vo.sign_name}</td>
						<td class="scontent"><a href="one?bbs_no=${vo.bbs_no}">${vo.content}</a>
						</td>
						<td><fmt:formatDate value="${vo.date}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<hr>


		<div id="search" style="text-align:center;">
			<form action="search">
				<input name="group_no" value="<%=group_no%>" type="hidden">
				<input placeholder="내용" name="content">
				<input name="page" value="1" type="hidden">
				<button>검색</button>
			</form>
		</div>
			
		<div id="page">
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
		</div>
	</div>
</div>
</body>
</html>