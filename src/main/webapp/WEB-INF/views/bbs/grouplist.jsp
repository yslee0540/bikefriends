<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹</title>
</head>
<body>
<%@ include file="../../../nav.jsp" %>

	<div id="main">
        <div id="top">
            <div id="title2">게시판 목록</div>
        </div>
        <hr>
        <div class="row">
            <div class="col group1">
                <c:forEach var="vo" items="${list}" step="2">
					<a href="list?group_no=${vo.group_no}&page=1">
                    	<button class="btn btn-outline-secondary groupbtn">${vo.group_name}</button>
                	</a>
                </c:forEach>
            </div>
            <div class="col group2">
            	<c:forEach var="vo" items="${list}" begin="1" step="2">
					<a href="list?group_no=${vo.group_no}&page=1">
                		<button class="btn btn-outline-secondary groupbtn">${vo.group_name}</button>
                	</a>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>