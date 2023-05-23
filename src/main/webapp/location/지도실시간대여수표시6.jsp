
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			for (let i = 0; i < 3; i++) {
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
			for (let i = 0;i < 3; i++) {
				var jsonObject = {
					"data" : response['rentBikeStatus']['row'][i].parkingBikeTotCnt,
					"lat":response['rentBikeStatus']['row'][i].stationLatitude,
					"lon":	response['rentBikeStatus']['row'][i].stationLatitude					}
				jsonArray2[i] = jsonObject;
			}
		}
	})
	var ajax3=$.ajax({
		url : "http://openapi.seoul.go.kr:8088/49747167436369633836706f6a5367/json/bikeList/2001/2709/",
		success : function(response) {
			console.log("ajax2--0")
			for (let i = 0; i < 3; i++) {
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
			center : new kakao.maps.LatLng(jsonArray1[1].lat, jsonArray1[1].lon), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	
		for (var i = 0; i < 3; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position : new kakao.maps.LatLng(jsonArray1[i].lat, jsonArray1[i].lon)    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: jsonArray2[i].data // 인포윈도우에 표시할 내용
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
		
		/* for (var i = 0; i < 1000; i ++) {/*
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position : new kakao.maps.LatLng(jsonArray3[i].lat, jsonArray3[i].lon)		    });

		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: jsonArray3[i].data// 인포윈도우에 표시할 내용
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
		} */
		/* for (var i = 0; i < 710; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position : new kakao.maps.LatLng(jsonArray1[i].lat, jsonArray1[i].lon)		    });

		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: jsonArray2[i].data// 인포윈도우에 표시할 내용
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
		} */

	})
</script>
</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15f705da222625307144938e873224ed"></script>

</body>
</html>

