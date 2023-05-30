<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹</title>
<style type="text/css">
.groupbtn:hover {
    color: white;
    background: #14870c;
}
</style>
</head>
<body>
<%@ include file="../../../nav.jsp" %>
<div class="row" style="width: 850px;margin: auto;">
	<jsp:include page="menu.jsp"></jsp:include>
    
	<div id="main" class="col-6" style="margin-left:225px;">
        <div id="top">
            <div id="title2">게시판 목록</div>
        </div>
        <hr>
        <div class="row">
            <div class="col group1">
                <c:forEach var="vo" items="${list}" step="2">
					<a href="list?group_no=${vo.group_no}&page=1">
                    	<button class="btn groupbtn">${vo.group_name}</button>
                	</a>
                </c:forEach>
            </div>
            <div class="col group2">
            	<c:forEach var="vo" items="${list}" begin="1" step="2">
					<a href="list?group_no=${vo.group_no}&page=1">
                		<button class="btn groupbtn">${vo.group_name}</button>
                	</a>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>