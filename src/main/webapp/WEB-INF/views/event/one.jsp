<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#main {
	margin: auto;
	width: 600px;
	border: 1px solid rgb(240, 240, 240);
	border-radius: 15px;
	box-shadow: 2px 2px 10px rgb(240, 240, 240);
	padding: 20px 0;
	height: auto;
	border: 1px solid rgb(240 240 240);
}

#divleft {
	border: 3px solid black;
	height: auto;
	margin: 10px;
}
</style>
</head>

<body>

<div id="map" style="width:30%;height:200px; margin:0 auto;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15f705da222625307144938e873224ed&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${vo.event_location}', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:0px 0;">Here </div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
}); 
</script>
<div id="main">
작성자:${vo.event_id}<br>
</div>
<div id="main">
번개모임 장소:${vo.event_location}<br>
</div>
<div id="main">
모임 날짜:${vo.event_date}<br>
</div>
<div id="main">
모임 참석인원 :${vo.event_size}<br>
</div>
<hr color="blue">
수정할 번호: <input id="no"><br>
수정할 내용: <input id="content"><br>
<button id="b7">수정하기 </button>
<hr color="blue">
삭제할 번호: <input id="no2"><br>
<button id="b8">삭제하기 </button>
</body>
</html>