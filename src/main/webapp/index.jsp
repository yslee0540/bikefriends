<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
	<script type="text/javascript" src="/bf/resources/js/jquery-3.6.4.js"></script>
	<link rel="stylesheet" href="/bf/resources/css/bbsstyle.css">
	<style>
        .menu {
            font-size: 18px;
            font-weight: bold;
            padding: 15px 0;
        }
        tr:hover {
			background: #f5f5f5;
		}
		.menuInfo {
			font-size: 14px;
			color: #777;
			cursor: pointer;
			margin-left: 5px;
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
    <script type="text/javascript">
		$(function() {
			$.ajax({
				url : "/bf/bbs/best",
				success : function(x) {
					$('#bestlist').html(x)
				}
			})
			$.ajax({
				url : "/bf/bbs/recent",
				success : function(x) {
					$('#recentlist').html(x)
				}
			})
		})
	</script>
</head>
<body>
    <jsp:include page="nav.jsp"></jsp:include>
	
    <div style="width: 750px;margin: auto;">
        <div class="menu" style="padding-bottom:0px;">따릉이 정보
       		<span class="menuInfo" style="font-weight:normal;" id="myLocation">내위치로 이동</span>
       	</div>
       	<div style="position: relative;">
	        <div id="map" style="width: 750px; height: 300px;border: 2px solid black"></div>
			<p class="modes">
			    <button id="zoom">확대/축소 켜기</button>
			</p>
		</div>
        <div class="menu">지역별 게시판
        	<a href="bbs/grouplist">
        		<span class="menuInfo" style="font-weight:normal;">바로가기</span>
        	</a>
       	</div>
        <div class="row">
            <div class="col" id="bestlist"></div>
            <div class="col" id="recentlist"></div>
        </div>
        <div class="row" style="text-align: center;">
            <div class="col">
                <a href="bike/bikemain">
                    <button class="btn mainbtn">
                        <i class="fa-solid fa-bicycle"></i> 자전거 정보
                    </button>
                </a>
            </div>
            <div class="col">
                <a href="event/eventmain">
                    <button class="btn mainbtn">
                        <i class="fa-solid fa-users"></i> 이벤트
                    </button>
                </a>
            </div>
            <div class="col">
                <a href="payment/dailyticket.jsp">
                    <button class="btn mainbtn">
                        <i class="fa-regular fa-credit-card"></i> 이용권 구매
                    </button>
                </a>
            </div>
        </div>
    </div>

    <div style="text-align: center;padding: 30px 0 20px;font-size:14px;color: #777;">
    	&copy; BikeFriends All rights reserved.
   	</div>

    <!-- <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed39086327d2b4332a5533af606ec521"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
        map.addOverlayMapTypeId(kakao.maps.MapTypeId.BICYCLE);

		map.setZoomable(false);
		
	</script> -->
	<jsp:include page="/따릉이.jsp"></jsp:include>

</body>
</html>