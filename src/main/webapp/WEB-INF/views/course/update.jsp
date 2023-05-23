<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스 수정</title>
<%@ include file="header.jsp"%>
<style type="text/css">
.style {
	padding: 0 20px;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.customoverlay {
	position: relative;
	bottom: 35px;
	border-radius: 6px;
	border: 1px solid #ccc;
	text-align: center;
	background: #fff;
	padding: 5px 15px;
	font-size: 14px;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	$(function() {
		/* 별점 */
		var rate = '';
		$('.starRev span').click(function () {
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
            rate = $(this).attr("value");
            return false;
        })
        
		$('#save').click(function() {
			$.ajax({
				url : "update2",
				data : {
					course_no : ${vo.course_no},
					start_location : startaddr,
					start_lat : startLat,
					start_lng : startLng,
					end_location : endaddr,
					end_lat : endLat,
					end_lng : endLng,
					rate: rate,
					title: $('#ctitle').val(),
					content: $('#content').val()
				},
				success : function() {
					location.href = "one?course_no=" + ${vo.course_no};
				}
			})
		})
	})
</script>
</head>
<body>
	<%@ include file="../../../nav.jsp"%>
	<div id="main">
		<div class="style">
			<input id="csearch" placeholder="장소 검색">
			<button onclick="search()">검색</button>
		</div>
		<div id="map" style="width: 598px; height: 350px;"></div>
		<p class="style">
			<input type="checkbox" id="chkBicycle"
				onclick="setOverlayMapTypeId()" checked /> 자전거도로 정보 보기
		</p>
		<div class="style">
			<button onclick="start()" id="startbtn">출발지 다시 선택</button>
			<button onclick="end()" id="endbtn">도착지 다시 선택</button>
			<button onclick="finish()">완료</button>
			<br> 출발: <span id="start">${vo.start_location}</span><br>
			도착: <span id="end">${vo.end_location}</span><br>
			<br> 제목: <input id="ctitle" value="${vo.title}"><br>
			후기<br>
			<textarea rows="5" cols="30" id="content">${vo.content}</textarea>
			<br>

			<div class="starRev" style="padding-bottom: 10px;">
				점수:
				<%
				int rate = (int) request.getAttribute("rate");
				for (int i = 1; i <= 5; i++) {
					if (rate >= i) {
				%>
				<span class="starR on" value="<%=i%>">★</span>
				<%
					} else {
				%>
				<span class="starR" value="<%=i%>">★</span>
				<%
					}
				}
				%>
			</div>
			<button id="save">수정</button>
		</div>
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
		
		// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
		var points = [ 
			new kakao.maps.LatLng(${vo.start_lat}, ${vo.start_lng}),
			new kakao.maps.LatLng(${vo.end_lat}, ${vo.end_lng})
		];
		
		var iwContent = ['출발', '도착'];
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		
		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();

		var i, marker, infowindow;
		for (i = 0; i < points.length; i++) {
			// 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			
			// 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
			marker = new kakao.maps.Marker({
				position : points[i],
				image : markerImage
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
		
		var startaddr = '${vo.start_location}';
		var endaddr = '${vo.end_location}';
		var startLat = ${vo.start_lat};
		var startLng = ${vo.start_lng};
		var endLat = ${vo.end_lat};
		var endLng = ${vo.end_lng};
		
	</script>
	<jsp:include page="../../../course/map.jsp"></jsp:include>
</body>
</html>