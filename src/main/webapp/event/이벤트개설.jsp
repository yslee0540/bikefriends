

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <jsp:include page="/nav.jsp"></jsp:include>
      <form action="insert" method="post"
					enctype="multipart/form-data" >
  아이디<input type="text" name="event_id" value="apple"><br>
  이벤트장소<input type="text" name="event_location" value="강남역" ><br>
  이벤트수용인원<input type="number" name="event_size" value="10"><br>
   이미지첨부<input type="file" name="file" ><br>
   	  이벤트날짜<input type="date" name="event_date"><br>
   
  
 <button type="submit">글쓰기</button> 
	</form>
</body>
</html>