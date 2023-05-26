<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/out.css">
<script type="text/javascript">
	$(function() {
		//시작하자마자 $.ajax() 호출하면 됨. 
		$.ajax({
			url : "event/list",
			success : function(x) {
				$('#result').append(x)
			} //success
		}) //ajax
	})
		</script>
</head>

<body>
 <jsp:include page="nav.jsp"></jsp:include>
<div id="map" style="width:100%;height:800px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15f705da222625307144938e873224ed"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.502, 127.026581), // 지도의 중심좌표
        level: 8// 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 커스텀 오버레이에 표시할 내용입니다     
// HTML 문자열 또는 Dom Element 입니다 
var content = '<div id="div">'+
'<div class="main">이벤트</div>'+
'<div id="category">'+
	'<ul class="list-group">'+
		/* '<li class="list-group-item menu"><a href="myevent/내가가입한이벤트.jsp" class="link">같이달려요</a></li>'+ */
		'<li class="list-group-item menu"><a href="event/이벤트개설.jsp" class="link">같이달려요</a></li>'+ 
		'<li class="list-group-item menu"><a href="location/지도실시간대여수표시7.jsp" class="link">자전거공유하기</a></li>'+
	'</ul>'+
'</div>'+
'</div>'+
'<br><br><br><br><br><br><br><br>'+

'<div id="result"></div>';

// 커스텀 오버레이가 표시될 위치입니다 
var position = new kakao.maps.LatLng(37.49887, 127.026581);  

// 커스텀 오버레이를 생성합니다
var customOverlay = new kakao.maps.CustomOverlay({
    position: position,
    content: content,
    xAnchor: 0.3,
    yAnchor: 0.91
});

// 커스텀 오버레이를 지도에 표시합니다
customOverlay.setMap(map);

	</script>
	<div id="result"></div>
</body>

</html>