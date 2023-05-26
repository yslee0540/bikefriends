<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스 수정</title>
<%@ include file="header.jsp"%>
<style type="text/css">
.style {
	padding: 0 20px;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.customoverlay {
	position: relative;
	bottom: 35px;
	border-radius: 6px;
	border: 1px solid #ccc;
	text-align: center;
	background: #fff;
	padding: 5px 15px;
	font-size: 14px;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	$(function() {
		/* 별점 */
		var rate = ${vo.rate};
		$('.starRev span').click(function () {
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
            rate = $(this).attr("value");
            return false;
        })
        
		$('#save').click(function() {
			$.ajax({
				url : "updateline2",
				data : {
					course_no : ${vo.course_no},
					rate: rate,
					title: $('#ctitle').val(),
					content: $('#content').val()
				},
				success : function() {
					location.href = "one?course_no=" + ${vo.course_no};
				}
			})
		})
	})
</script>
</head>
<body>
	<%@ include file="../../../nav.jsp"%>
	<div id="main">
		<div class="style">
			제목: <input id="ctitle" value="${vo.title}"><br>
			후기<br>
			<textarea rows="5" cols="30" id="content">${vo.content}</textarea>
			<br>

			<div class="starRev" style="padding-bottom: 10px;">
				점수:
				<c:forEach begin="1" end="5" varStatus="status">
					<c:choose>
						<c:when test="${status.count <= vo.rate}">
							<span class="starR on" value="${status.count}">★</span>
						</c:when>
						<c:otherwise>
							<span class="starR off" value="${status.count}">★</span>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<button id="save">수정</button>
		</div>
	</div>
		
</body>
</html>