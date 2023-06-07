<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>자전거 코스 입력</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<link rel="stylesheet" href="../resources/css/bbsstyle.css">
<style type="text/css">
.style {
	 padding: 0 20px;
}
.modes {position: absolute;top: 15px;left: 15px;z-index: 1;}
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
			title = $('#ctitle').val()
			if (title == '' || rate == '' || lat == '') {
				alert('코스, 제목, 별점은 필수항목입니다')
			} else {
				$.ajax({
					url : "insertline",
					data : {
						line_lat : lat,
						line_lng : lng,
						rate: rate,
						title: title,
						content: $('#content').val(),
						writer: '${id}'
					},
					success : function() {
						location.href = "list?page=1";
					}
				})
			}
		})
	})
</script>
</head>
<body>
<%@ include file="../nav.jsp"%>
	<div id="main">
		<div class="style">
			<input id="csearch" placeholder="장소 검색">
			<button onclick="search()">검색</button>
		</div>
		<div style="position: relative;">
			<div id="map" style="width: 600px; height: 350px;"></div>
			<p class="modes">
			    <button onclick="selectOverlay('POLYLINE')" class="btn btn-dark">그리기</button>
			</p>
		</div>
		<p class="style">
			<input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" checked/>
			자전거도로 정보 보기
		</p>
		<div class="style">
			제목: <input id="ctitle"><br>
			내용<br> <textarea rows="5" cols="30" id="content"></textarea><br>
			<div class="starRev" style="padding-bottom:10px;">
				점수: 
		        <span class="starR" value="1">★</span>
		        <span class="starR" value="2">★</span>
		        <span class="starR" value="3">★</span>
		        <span class="starR" value="4">★</span>
		        <span class="starR" value="5">★</span>
		    </div>
			<button onclick="getDataFromDrawingMap()" id="save">작성</button>
		</div>
	</div>
	
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed39086327d2b4332a5533af606ec521&libraries=services,drawing"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
	</script>
	<jsp:include page="drawingmap.jsp"></jsp:include>
	
</body>
</html>