
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.spring.bf.event.eventVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>여러개 마커에 이벤트 등록하기1</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
let jsonArray1 = [];
let jsonArray2 = [];
let jsonArray3 = [];
	var ajax1=$.ajax({
		url : "http://openapi.seoul.go.kr:8088/49747167436369633836706f6a5367/json/bikeList/1/1000/",
		success : function(response) {
			console.log("ajax2--0")
			for (let i = 0; i < 1000; i++) {
				var jsonObject = {
					"data" : response['rentBikeStatus']['row'][i].parkingBikeTotCnt,
					"lat":response['rentBikeStatus']['row'][i].stationLatitude,
					"lon":	response['rentBikeStatus']['row'][i].stationLatitude
				}
				jsonArray1[i] = jsonObject;
			}
		}
	})
	var ajax2=$.ajax({
		url : "http://openapi.seoul.go.kr:8088/49747167436369633836706f6a5367/json/bikeList/1001/2000/",
		success : function(response) {
			console.log("ajax2--0")
			for (let i = 0; i < 1000; i++) {
				var jsonObject = {
					"data" : response['rentBikeStatus']['row'][i].parkingBikeTotCnt,
					"lat":response['rentBikeStatus']['row'][i].stationLatitude,
					"lon":	response['rentBikeStatus']['row'][i].stationLatitude					}
				jsonArray2[i] = jsonObject;
			}
			console.log(jsonArray2[4].data)
		}
	})
	var ajax3=$.ajax({
		url : "http://openapi.seoul.go.kr:8088/49747167436369633836706f6a5367/json/bikeList/2001/2709/",
		success : function(response) {
			console.log("ajax2--0")
			for (let i = 0; i < 709; i++) {
				var jsonObject = {
					"data" : response['rentBikeStatus']['row'][i].parkingBikeTotCnt,
					"lat":response['rentBikeStatus']['row'][i].stationLatitude,
					"lon":	response['rentBikeStatus']['row'][i].stationLatitude
				}
				jsonArray3[i] = jsonObject;
			}
			
		}
	})
	$.when(ajax1, ajax2, ajax3).done(function(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.55564880,	126.91062927), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};

		var latlon=[
		[	37.55564880,	126.91062927],
		 [	37.55495071	,126.91083527],
		 [	37.55062866,	126.91498566],
		 [	37.55000687	,126.91482544],
		 [	37.54864502,	126.91282654],
		 [	37.55751038,	126.91850281],
		 [	37.55274582,	126.91861725],
		 [	37.54769135,	126.91998291],
		 [	37.54787064	,126.92353058],
		 [	37.54920197	,126.92320251],
		 [	37.55743790	,126.92382050],
			
			
		]
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	
		for (var i = 0; i < 3; i++) {
			// 마커를 생성합니다
			var j=37.5554884;
			var k=126.8998606;
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도

				position : new kakao.maps.LatLng(latlon[i][0],latlon[i][1])
			// 마커의 위치
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : "ggg"+jsonArray1[i].data

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
})
	

</script>
</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15f705da222625307144938e873224ed"></script>
</body>
</html>

