<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>댓글수정</title>
    <jsp:include page="header.jsp"></jsp:include>
    <script type="text/javascript">
		$(function() {
			$('#b1').click(function() {
				$.ajax({
					url: "replyupdate2",
					data: {
						reply_no: ${vo.reply_no},
						content: $('#content').val()
					},
					success: function(x) {
						location.href = 'one?bbs_no=' + ${vo.bbs_no}
					}
				})
			})
		})
	</script>
</head>

<body>
    <jsp:include page="../../../nav.jsp"></jsp:include>

    <div id="main">
        <div style="padding: 0px 20px 10px;">
            <b>댓글 수정</b>
        </div>
        <textarea id="content" rows="10" cols="60" style="width: 560px;margin: 10px 20px 0;">${vo.content}</textarea>
        <div style="padding: 10px 20px 0;text-align: right;">
            <button id="b1">수정</button>
        </div>
    </div>

</body>

</html>