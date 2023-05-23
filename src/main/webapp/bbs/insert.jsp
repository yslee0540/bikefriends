<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String group_no = request.getParameter("group_no"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
	<link rel="stylesheet" href="../resources/css/bbsstyle.css">
	<script type="text/javascript">
		$(function() {
			$('#b1').click(function(e) {
				var content = $('#content').val()
				if (content == '') {
			        e.preventDefault();
					alert('내용을 입력하세요')
				}
			})
		})
	</script>
</head>

<body>
    <jsp:include page="../nav.jsp"></jsp:include>

    <div id="main">
    	<form action="insert" method="post" enctype="multipart/form-data">
	        <table>
	            <tr class="post1">
	                <td class="profile" rowspan="2"><img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png" class="img"></td>
	                <td><b>${id}</b></td>
	            </tr>
	            <tr>
	                <td id="bbsinsert">
	                	<input name="group_no" value="<%= group_no %>" type="hidden">
	                	<input name="writer" value="${id}" type="hidden">
	                    <textarea name="content" id="content" rows="10" placeholder="내용을 입력하세요"></textarea>
	                	<input type="file" name="file">
	                </td>
	            </tr>
	        </table>
	        <div style="padding: 10px 20px 0;text-align: right;">
	            <button id="b1">글쓰기</button>
	        </div>
        </form>
    </div>

</body>

</html>