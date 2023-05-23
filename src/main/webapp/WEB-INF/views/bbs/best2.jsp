<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기게시판</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="../../../nav.jsp"%>

	<div id="main">

		<div id="top">
			<%
				if (session.getAttribute("id") != null) {
			%>
			<div id="title">
				${group.group_name} 
				<a href="list?group_no=${group.group_no}&page=1">
					<span class="best" style="color: red;">BEST</span>
				</a>
			</div>
			<form action="insert.jsp">
				<input name="group_no" value="${group.group_no}" type="hidden">
				<button class="btn btn-primary">글쓰기</button>
			</form>
			<%
				} else {
			%>
			<div id="title2">
				${group.group_name} 
				<a href="list?group_no=${group.group_no}&page=1">
					<span class="best" style="color: red;">BEST</span>
				</a>
			</div>
			<%
				}
			%>
		</div>
		<hr>

		<c:if test="${empty list}">
			<div style="text-align: center; padding: 0 0 20px;">게시물 없음</div>
		</c:if>
		<c:if test="${!empty list}">
			<c:forEach var="vo" items="${list}">
				<table>
					<tr class="post">
						<td class="profile" rowspan="3"><img
							src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
							class="img"></td>
						<td class="bbswriter"><b>${vo.writer}</b></td>
						<td class="bbsdate"><fmt:formatDate value="${vo.date}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td class="bbscon" colspan="2"><a
							href="one?bbs_no=${vo.bbs_no}">${vo.content}</a>
							<c:if test="${!empty vo.img}">
								<i class="fa-regular fa-image"></i>
							</c:if>		
						</td>
					</tr>
					<tr>
						<td class="bbsinfo" colspan="2">
							<i class="fa-regular fa-eye"></i> ${vo.hit}
							<i class="fa-regular fa-comment"></i> ${vo.cmt_cnt}
							<i class="fa-regular fa-heart"></i> ${vo.like_cnt}
						</td>
					</tr>
				</table>
				<hr>
			</c:forEach>
			
			<%
				int pages = (int)request.getAttribute("pages");
				int nowpage = Integer.parseInt(request.getParameter("page"));
			%>
			<div id="page">
				<ul class="pagination justify-content-center">
					<%
						if (nowpage > 1) {
					%>
					<li class="page-item"><a class="page-link"
						href="best2?group_no=${group.group_no}&page=<%= nowpage - 1 %>">Previous</a>
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
						href="best2?group_no=${group.group_no}&page=<%= p %>"><%=p%></a>
					</li>
					<%
						} else {
					%>
					<li class="page-item"><a class="page-link"
						href="best2?group_no=${group.group_no}&page=<%= p %>"><%=p%></a>
					</li>
					<%
						}
					}
					%>
					<%
						if (nowpage < pages) {
					%>
					<li class="page-item"><a class="page-link"
						href="best2?group_no=${group.group_no}&page=<%= nowpage + 1 %>">Next</a>
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
		</c:if>
		
	</div>
</body>
</html>