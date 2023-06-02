<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table class="table" style="margin-bottom:0px;">
	<tr style="background-color: #b7d5ac;">
    	<th>최신게시물</th>
    </tr>
</table>
<table class="table">
	<c:forEach var="vo" items="${list}" end="4">
		<tr>
			<td style="word-wrap: break-word;width:80px;">${vo.group_name}</td>
			<td class="scontent"><a href="bbs/one?bbs_no=${vo.bbs_no}">${vo.content}</a>
			</td>
			<td width="60"><fmt:formatDate value="${vo.date}" pattern="MM-dd" /></td>
		</tr>
	</c:forEach>
</table>
