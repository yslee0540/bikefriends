<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<script     
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/out.css">
<link rel="stylesheet" type="text/css" href="../resources/css/bbsstyle.css">
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* #main {
	margin: auto;
	width: 600px;
	border: 1px solid rgb(240, 240, 240);
	border-radius: 15px;
	box-shadow: 2px 2px 10px rgb(240, 240, 240);
	padding: 20px 0;
	height: auto;
	border: 1px solid rgb(240 240 240);
} */

/* #divleft {
	border: 3px solid black;
	height: auto;
	margin: 10px;
} */
.bbswriter {
    width: 270px;
    padding: 10px 5px 10px;
}
</style>
</head>

<body>
<jsp:include page="../../../nav.jsp"></jsp:include>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15f705da222625307144938e873224ed&libraries=services"></script>
<div id="main"style="text-align: center;font-weight: bold;font-size: 2.0em;line-height: 1.0em;">${vo.title}</div>
<div id="main"style="text-align: center;"><img src="../resources/upload/${vo.event_img}" width="300"></div>
<div id="main">모임장소:${vo.event_location}</div>
<div id="main">모임날짜:<fmt:formatDate value="${vo.event_date}" pattern="yyyy-MM-dd" /></div>
<div id="main" class="col-6" style="float:left;margin-left:200px; width:45%;">
<table>
            <tr class="post1">
            <td class="profile" rowspan="3"></td>
                <td class="bbswriter">글쓴이:${vo.event_id}</td>
            </tr>
            <tr>
                <td class="bbscon" colspan="2">
                	${vo.content}
	                	<br><br>
	                	<%-- <img src="../resources/upload/${bbsVO.img}" width="495"> --%>
                </td>
            </tr>
            <tr>
                <td class="bbsinfo" colspan="2">
                	<i class="fa-regular fa-eye"></i> <%-- ${bbsVO.hit} --%>
                	<span id="like">
                   		<i class="fa-regular fa-heart"></i>
	                </span>
                    <span id="like_cnt"><%-- ${bbsVO.like_cnt} --%></span>
                </td>
            </tr>
        </table>
        </div>         
        <div id="map" style="width:30%;height:300px; margin:0 auto;margin-right:100px;float:left;"></div>
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
        content: '<div style="width:150px;text-align:center;padding:0px 0; float:right;">Here </div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
}); 
</script>
</body>
</html>