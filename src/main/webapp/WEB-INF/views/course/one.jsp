<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스 상세페이지</title>
<%@ include file="header.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#coursedelete').click(function() {
			if (confirm('게시물 삭제하시겠습니까?')) {
				$.ajax({
					url : "delete",
					data : {
						course_no : ${vo.course_no}
					},
					success : function() {
						location.href = 'list';
					}
				})
			}
		})
	})
</script>
<style type="text/css">
.style {
	padding: 0 20px;
}

.customoverlay {
	position: relative;
	bottom: 40px;
	border-radius: 6px;
	border: 1px solid #ccc;
	text-align: center;
	background: #fff;
	padding: 5px 15px;
	font-size: 14px;
	font-weight: bold;
}

.starR {
	cursor: auto;
}
.starR.off:hover {
	text-shadow: 0 0 0 #f0f0f0;
}
</style>
</head>
<body>
	<%@ include file="../../../nav.jsp"%>
	<div id="main">
		<div id="top">
			<c:choose>
				<c:when test="${id == vo.writer}">
					<div id="title">${vo.title}</div>
					<a href="update?course_no=${vo.course_no}">
						<button class="btn btn-primary" id="b2">수정</button></a>
					<button class="btn btn-danger" id="coursedelete">삭제</button>
				</c:when>
				<c:otherwise>
					<div id="title2">${vo.title}</div>
				</c:otherwise>
			</c:choose>
		</div>
		<hr>

		<div class="style">작성자: ${vo.writer} 날짜: ${vo.date}</div>
		<div id="map" style="width: 598px; height: 350px;"></div>
		<p class="style">
			<input type="checkbox" id="chkBicycle"
				onclick="setOverlayMapTypeId()" checked /> 자전거도로 정보 보기
		</p>
		<div class="style">
			<b>출발</b> ${vo.start_location}<br> <b>도착</b> ${vo.end_location}<br>
			<br> <b>내용</b><br> ${vo.content}<br>
			<br>
			<div class="starRev" style="padding-bottom: 10px;">
				<b>별점</b>
				<%
				int rate = (int) request.getAttribute("rate");
				for (int i = 1; i <= 5; i++) {
					if (rate >= i) {
				%>
				<span class="starR on">★</span>
				<%
					} else {
				%>
				<span class="starR off">★</span>
				<%
					}
				}
				%>
			</div>
			<br>
		</div>
		<a
			href="https://map.kakao.com/?sName=${vo.start_location}&eName=${vo.end_location}"
			target="_blank">카카오맵</a>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed39086327d2b4332a5533af606ec521&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(${vo.start_lat}, ${vo.start_lng}), // 지도의 중심좌표
			level : 3 // 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.BICYCLE);
		// 체크 박스를 선택하면 호출되는 함수입니다
		function setOverlayMapTypeId() {
			var chkBicycle = document.getElementById('chkBicycle')
	
			// 지도 타입을 제거합니다
			map.removeOverlayMapTypeId(kakao.maps.MapTypeId.BICYCLE);
	
			// 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
			if (chkBicycle.checked) {
				map.addOverlayMapTypeId(kakao.maps.MapTypeId.BICYCLE);
			}
	
		}
		
		// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
		var points = [ 
			new kakao.maps.LatLng(${vo.start_lat}, ${vo.start_lng}),
			new kakao.maps.LatLng(${vo.end_lat}, ${vo.end_lng})
		];
		
		var iwContent = ['출발', '도착'];

		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();

		var i, marker, customOverlay;
		for (i = 0; i < points.length; i++) {
			// 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
			marker = new kakao.maps.Marker({
				position : points[i]
			});
			marker.setMap(map);
			
			customOverlay = new kakao.maps.CustomOverlay({
				map: map,
				position : points[i],
			    content : '<div class="customoverlay">' + iwContent[i] + '</div>', 
				yAnchor: 1
			});

			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(points[i]);
		}
		map.setBounds(bounds);
		//map.setDraggable(false);
		map.setZoomable(false);
		
	</script>
</body>
</html>