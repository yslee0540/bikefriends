<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ë°ë¦ì´ ëì¬ì ì§ëì íìíê¸°</title>
</head>

<body>
	<div id="map" style="width: 100%; height: 700px;"></div>

	<!-- kakao Map Api -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15f705da222625307144938e873224ed"></script>
	<script src="bikeAndMap.js"></script>
	<script type="text/javascript">
	const kakaoMapMarker = obj => {
		  // ì§ë íì ìì­
		  let mapContainer = document.querySelector('#map') 

		  // ì§ë ìµì
		  let mapOption = {
		    // ì§ë ì¤ì¬ì¢í
		    center: new kakao.maps.LatLng(37.51037979, 126.8667984),

		    // ì§ë íë ë ë²¨
		    level: 3,
		  }

		  // ì§ëë¥¼ íìí  divì ì§ë ìµìì¼ë¡ ì§ëë¥¼ ìì±
		  let map = new kakao.maps.Map(mapContainer, mapOption)

		  // ìì¹ ì ë³´ ì ì¥
		  let positions = obj.map(item => ({
		    title: item.RENT_NM,
		    latlng: new kakao.maps.LatLng(item.STA_LAT, item.STA_LONG),
		  }))

		  // ì´ë¯¸ì§ ë§ì»¤ ê²½ë¡
		   let imageSrc = `https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png`
		  // ì´ë¯¸ì§ ë§ì»¤ íì
		  positions.forEach(position => {
		   let imageSize = new kakao.maps.Size(24, 35)

		    let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize) 

		    // ë§ì»¤ ìì±
		    let marker = new kakao.maps.Marker({
		      map: map,
		      position: position.latlng,
		      title: position.title,
 		      image: markerImage
		    })
		    })
		}

		// ë°ë¦ì´ ëì¬ì ë°ì´í° ë°ê¸°
		const getData = async () => {
		  let res = await fetch(`http://openapi.seoul.go.kr:8088/49747167436369633836706f6a5367/json/tbCycleStationInfo/1/999/`)
		  let data = await res.json()
		  console.log(data)
		  let rows = data.stationInfo.row

		  kakaoMapMarker(rows) // ëì¬ì ìì¹ë°ì´í°ë¥¼ ì¹´ì¹´ì¤ ë§ì»¤ë¥¼ ë³´ì¬ì£¼ë í¨ìì ì ë¬
		 

		getData()
		
		const getData1 = async () => {
		  let res1 = await fetch(`http://openapi.seoul.go.kr:8088/49747167436369633836706f6a5367/json/tbCycleStationInfo/1000/1999/`)
		  let data1 = await res1.json()
		  console.log(data1)
		  let rows1 = data1.stationInfo.row

		  kakaoMapMarker(rows1) // ëì¬ì ìì¹ë°ì´í°ë¥¼ ì¹´ì¹´ì¤ ë§ì»¤ë¥¼ ë³´ì¬ì£¼ë í¨ìì ì ë¬
		 

		getData1()
		
		const getData2 = async () => {
		  let res2 = await fetch(`http://openapi.seoul.go.kr:8088/49747167436369633836706f6a5367/json/tbCycleStationInfo/2000/2999/`)
		  let data2 = await res2.json()
		  console.log(data2)
		  let rows2 = data2.stationInfo.row

		  kakaoMapMarker(rows2) // ëì¬ì ìì¹ë°ì´í°ë¥¼ ì¹´ì¹´ì¤ ë§ì»¤ë¥¼ ë³´ì¬ì£¼ë í¨ìì ì ë¬
		

		getData2()
	
	</script>
</body>
</html>