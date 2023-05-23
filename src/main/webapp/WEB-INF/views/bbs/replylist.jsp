<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<c:forEach var="vo" items="${list}" varStatus="status">
		<tr>
			<td class="rewriter" width="100"><b>${status.count}.
					${vo.writer}</b></td>
			<td class="redate" width="400">${vo.date}</td>
			<td class="rebtn" width="100"><c:if test="${id == vo.writer}">
					<a href="replyupdate?reply_no=${vo.reply_no}">
						<button class="btn btn-sm btn-secondary b4">수정</button></a>
					<button class="btn btn-sm btn-secondary b5"
						data-no="${vo.reply_no}">삭제</button>
				</c:if></td>
		</tr>
		<tr style="border-bottom: 1px solid #c1c1c1;">
			<td class="recon" colspan="3">${vo.content}</td>
		</tr>
	</c:forEach>
</table>