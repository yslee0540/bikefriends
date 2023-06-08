<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#b1{
width:200px;
margin: auto;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script     
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/out.css">
<link rel="stylesheet" type="text/css" href="../resources/css/bbsstyle.css">
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="../nav.jsp"></jsp:include>
  <div id="b1" style="margin: 0 auto;">
      <form action="insert" method="post"
					enctype="multipart/form-data" >
  <input type="hidden" name="event_id" value="${id}"><br>
  이벤트장소<input type="text" name="event_location"  ><br>
  제목<input type="text" name="title"  ><br>
  comment<input type="text" name="content"  ><br>
  이벤트수용인원<input type="number" name="event_size"><br>
   이미지첨부<input type="file" name="file" ><br>
   	  이벤트날짜<input type="date" name="event_date"><br>
  
 <button type="submit">글쓰기</button> 
	</form>
	</div>
</body>
</html>