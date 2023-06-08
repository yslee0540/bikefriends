<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<%@ include file="header.jsp"%>
</head>
<body>
<%@ include file="../../../nav.jsp"%>
<div class="row" style="width: 850px;margin: auto;">
	<jsp:include page="menu2.jsp"></jsp:include>
    
	<div id="main" class="col-6">

		<div id="top">
			<%
				if (session.getAttribute("id") != null) {
			%>
			<div id="title">
				${bbsVO.group_name} <a href="bestlist?group_no=${bbsVO.group_no}&page=1">
					<span class="best">BEST</span>
				</a>
			</div>
			<a href="insert.jsp?group_no=${bbsVO.group_no}">
				<button class="btn" style="background: #14870c;color:white;">글쓰기</button>
			</a>
			<%
				} else {
			%>
			<div id="title2">
				${bbsVO.group_name} <a href="bestlist?group_no=${bbsVO.group_no}&page=1">
					<span class="best">BEST</span>
				</a>
			</div>
			<%
				}
			%>
		</div>
		<hr>

		<div id="best">
			<c:if test="${empty list}">
				<div style="text-align: center; padding: 0 0 20px;">게시물 없음</div>
			</c:if>
			<c:if test="${!empty list}">
				<c:forEach var="vo" items="${list}">
					<table>
						<tr class="post">
							<td class="profile" rowspan="3"><img src="${vo.sign_img}" class="img" style="object-fit: cover;"></td>
							<td class="bbswriter"><b>${vo.sign_name}</b></td>
							<td class="bbsdate"><fmt:formatDate value="${vo.date}" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td class="bbscon" colspan="2">
								<a href="one?bbs_no=${vo.bbs_no}">${vo.content}</a>
								<c:if test="${!empty vo.img}">
									<i class="fa-regular fa-image"></i>
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="bbsinfo" colspan="2">
								<i class="fa-regular fa-comment"></i> ${vo.cmt_cnt}
								<i class="fa-regular fa-heart"></i> ${vo.like_cnt}
							</td>
						</tr>
					</table>
					<hr>
				</c:forEach>
				
				<div id="search" style="text-align:center;">
					<form action="search">
						<input name="group_no" value="${bbsVO.group_no}" type="hidden">
						<input placeholder="내용" name="content">
						<input name="page" value="1" type="hidden">
						<button>검색</button>
					</form>
				</div>
				
				<%
					int pages = (int) request.getAttribute("pages");
					int nowpage = Integer.parseInt(request.getParameter("page"));
					int i = 0;
					if (nowpage % 10 == 0) {
						i = nowpage / 10 - 1;
					} else {
						i = nowpage / 10;
					}
				%>
				<div id="page">
					<ul class="pagination justify-content-center">
						<!-- 이전 -->
						<%
							if (nowpage > 1) {
						%>
						<li class="page-item"><a class="page-link"
							href="list?group_no=${bbsVO.group_no}&page=<%= nowpage - 1 %>">Previous</a>
						</li>
						<%
							} else {
						%>
						<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
						<%
							}
						%>
						<!-- 페이지 -->
						<%
							for (int p = 10 * i + 1; p <= 10 * (i + 1); p++) {
							if (p == nowpage) {
						%>
						<li class="page-item active"><a class="page-link"
							href="list?group_no=${bbsVO.group_no}&page=<%= p %>"><%=p%></a>
						</li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							href="list?group_no=${bbsVO.group_no}&page=<%= p %>"><%=p%></a>
						</li>
						<%
							}
							if (p == pages) {
								break;
							}
						}
						%>
						<!-- 다음 -->
						<%
							if (nowpage < pages) {
						%>
						<li class="page-item"><a class="page-link"
							href="list?group_no=${bbsVO.group_no}&page=<%= nowpage + 1 %>">Next</a>
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
	</div>
</div>
</body>
</html>