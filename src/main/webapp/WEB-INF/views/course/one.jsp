<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>코스 상세페이지</title>
<style type="text/css">
.style {
	padding: 0 20px;
}

.starR {
	cursor: auto;
}

.starR.off:hover {
	text-shadow: 0 0 0 #f0f0f0;
}

.modes {position: absolute;top: 15px;left: 15px;z-index: 1;}
#zoom {
	border: none;
	background: white;
	padding: 5px 10px;
	font-size: 14px;
	font-weight: bold;
}
</style>
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
						location.href = 'list?page=1';
					}
				})
			}
		})
		
		var zoomable = false;
		$('#zoom').click(function() {
			if (zoomable) {
				zoomable = false;
				map.setZoomable(zoomable); 
				$(this).text('확대/축소 켜기');
			} else {
				zoomable = true;
				map.setZoomable(zoomable); 
				$(this).text('확대/축소 끄기');
			}
		});
	})
</script>
</head>
<body>
<%@ include file="../../../nav.jsp"%>
	<div class="row" style="width: 850px;margin: auto;">
		<jsp:include page="menu.jsp"></jsp:include>
	    
		<div id="main" class="col-6">
			<div id="top">
				<c:choose>
					<c:when test="${id == vo.writer}">
						<div class="row">
							<div class="col-sm-8" id="title2" style="word-wrap: break-word;">${vo.title}</div>
							<div class="col-sm-4">
								<a href="updateline?course_no=${vo.course_no}">
									<button class="btn btn-primary">수정</button></a>
								<button class="btn btn-danger" id="coursedelete">삭제</button>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div id="title2" style="word-wrap: break-word;">${vo.title}</div>
					</c:otherwise>
				</c:choose>
			</div>
			<hr>
	
			<div class="style">작성자: ${vo.sign_name} 날짜: <fmt:formatDate value="${vo.date}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
			<div style="position: relative;">
				<div id="map" style="width: 600px; height: 350px;"></div>
				<p class="modes">
				    <button id="zoom">확대/축소 켜기</button>
				</p>
			</div>
			<p class="style">
				<input type="checkbox" id="chkBicycle"
					onclick="setOverlayMapTypeId()"/> 자전거도로 정보 보기
			</p>
			<div class="style">
				<b>출발</b> <span id="start"></span><br>
				<br> <b>내용</b><br> ${vo.content}<br>
				<br>
				<div class="starRev" style="padding-bottom: 10px;">
					<b>별점</b>
					<c:forEach begin="1" end="5" varStatus="status">
						<c:choose>
							<c:when test="${status.count <= vo.rate}">
								<span class="starR on">★</span>
							</c:when>
							<c:otherwise>
								<span class="starR off">★</span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<br>
				<div style="padding:0px;">
		            <a href="list?page=1">
		                <button class="btn btn-dark">
		                    <i class="fa-solid fa-list-ul"></i> 목록
		                </button>
		            </a>
		        </div>
			</div>
		</div>
	</div>
	
	<c:forEach var="lat" items="${lat}" varStatus="status">
		<input value="${lat}" class="lat${status.index}" type="hidden">
	</c:forEach>
	<c:forEach var="lng" items="${lng}" varStatus="status">
		<input value="${lng}" class="lng${status.index}" type="hidden">
	</c:forEach>
		
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed39086327d2b4332a5533af606ec521&libraries=services"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(${lat[0]}, ${lng[0]}), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
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
		
		var len = ${length}, 
        path = [];
		
		for (var i = 0; i < len; i++) {
			var lat = $('.lat' + i).val();
			var lng = $('.lng' + i).val();
	        var latlng = new kakao.maps.LatLng(lat, lng);
	        path.push(latlng);
		}
		
		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();
		
		for (var i = 0; i < len; i++) {
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(path[i]);
		}
		map.setBounds(bounds);
    
	    //지도에 표시할 선을 생성합니다
	    let polyline = new kakao.maps.Polyline({
	        map: map, // 지도에 선을 표시합니다 
	        path: path, // 선을 구성하는 좌표배열 입니다
	        strokeWeight: 4, // 선의 두께 입니다
	        strokeColor: 'red', // 선의 색깔입니다
	        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	        strokeStyle: 'solid' // 선의 스타일입니다
	    });
	    
	  	//map.setDraggable(false);
		map.setZoomable(false);
		
		var geocoder = new kakao.maps.services.Geocoder();

		var coord = new kakao.maps.LatLng(${lat[0]}, ${lng[0]});
		var callback = function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		    	var startaddr = result[0].address.address_name;
		    	start = document.getElementById('start');
				start.innerHTML = startaddr;
		    }
		};
		
		geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	</script>
	
</body>
</html>