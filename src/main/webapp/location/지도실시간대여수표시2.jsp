
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>여러개 마커에 이벤트 등록하기1</title>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script>


</script>
<script type="text/javascript">
    let jsonArray1 = []; 
    
	$(function() {
		//시작하자마자 $.ajax() 호출하면 됨. 
		
		$.ajax({
					url : "http://openapi.seoul.go.kr:8088/49747167436369633836706f6a5367/json/bikeList/1/1000/",
					success : function(response) {
						for (let i = 0; i < 1000; i++) {
							var jsonObject = {
								"data" : response['rentBikeStatus']['row'][i].parkingBikeTotCnt
							}
							jsonArray1[i] = jsonObject;
						}
						console.log(jsonArray1[6].data)
					} //success
				}) //ajax



		//시작하자마자 $.ajax() 호출하면 됨. 
		$.ajax({
					url : "http://openapi.seoul.go.kr:8088/49747167436369633836706f6a5367/json/bikeList/1001/2000/",
					success : function(response) {
						var jsonArray2 = []; 
						for (let i = 0; i < 1000; i++) {
							var jsonObject = {
								"data" : response['rentBikeStatus']['row'][i].parkingBikeTotCnt
							}
							jsonArray2[i] = jsonObject;
						}
						console.log(jsonArray2[1].data)
					} //success
				}) //ajax

		//시작하자마자 $.ajax() 호출하면 됨. 
		$.ajax({
					url : "http://openapi.seoul.go.kr:8088/49747167436369633836706f6a5367/json/bikeList/2001/2709/",
					success : function(response) {
						var jsonArray3 = []; 
						for (let i = 0; i < 709; i++) {
							var jsonObject = {
								"data" : response['rentBikeStatus']['row'][i].parkingBikeTotCnt
							}
							jsonArray3[i] = jsonObject;
						}
						console.log(jsonArray3[5].data)
					} //success
				}) //ajax
	})
</script>
</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15f705da222625307144938e873224ed"></script>
	<script>
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [ {
			latlng : new kakao.maps.LatLng(33.450705, 126.570677)
		}, {
			latlng : new kakao.maps.LatLng(33.450936, 126.569477)
		}, {
			latlng : new kakao.maps.LatLng(33.450879, 126.569940)
		}, {
			latlng : new kakao.maps.LatLng(33.451393, 126.570738)
		} ];
		
		

		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng
			// 마커의 위치
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : jsonArray1[6].data
			// 인포윈도우에 표시할 내용
			});

			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}

		/* 아래와 같이도 할 수 있습니다 */
		/*
		 for (var i = 0; i < positions.length; i ++) {
		 // 마커를 생성합니다
		 var marker = new kakao.maps.Marker({
		 map: map, // 마커를 표시할 지도
		 position: positions[i].latlng // 마커의 위치
		 });

		 // 마커에 표시할 인포윈도우를 생성합니다 
		 var infowindow = new kakao.maps.InfoWindow({
		 content: positions[i].content // 인포윈도우에 표시할 내용
		 });

		 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		 // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		 (function(marker, infowindow) {
		 // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		 kakao.maps.event.addListener(marker, 'mouseover', function() {
		 infowindow.open(map, marker);
		 });

		 // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
		 kakao.maps.event.addListener(marker, 'mouseout', function() {
		 infowindow.close();
		 });
		 })(marker, infowindow);
		 }
		 */
	</script>
</body>
</html>

