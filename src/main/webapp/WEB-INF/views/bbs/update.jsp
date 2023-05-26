<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물수정</title>
    <jsp:include page="header.jsp"></jsp:include>
    <script type="text/javascript">
	    $(function() {
	    	img = '${vo.img}'
	    	if (img == '') {
	    		$('#img').html('<input type="file" name="file">');
			}
			$('#delete').click(function() {
				$('#img').html('<input type="file" name="file">');
			})
		})</script>
</head>

<body>
    <jsp:include page="../../../nav.jsp"></jsp:include>

    <div id="main">
        <div style="padding: 0px 20px 10px;">
            <b>게시물 수정</b>
        </div>
        <form action="update2" method="post" enctype="multipart/form-data">
        	<input name="bbs_no" value="${vo.bbs_no}" type="hidden">	
	        <textarea name="content" rows="10" cols="60" style="width: 560px;margin: 10px 20px 0;">${vo.content}</textarea>
	        <div style="padding: 0px 20px" id="img">
	        	<input name="img" value="${vo.img}" readonly>
	        	<button id="delete" type="button">삭제</button>
	       		<input type="file" name="file" style="display:none;">
       		</div>
	        <div style="padding: 10px 20px 0;text-align: right;">
	            <button>수정</button>
	        </div>
        </form>
    </div>

</body>

</html>