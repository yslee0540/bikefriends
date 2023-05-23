<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

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
	
	function search() {
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();
	
		var address = document.getElementById('csearch').value;
	
		// 키워드로 장소를 검색합니다
		ps.keywordSearch(address, placesSearchCB);
	}
	
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {
	
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			var bounds = new kakao.maps.LatLngBounds();
	
			for (var i = 0; i < data.length; i++) {
				bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			}
	
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
	}
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	infowindow = new kakao.maps.InfoWindow({
		zindex : 1
	}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

	var startEvent = function(mouseEvent) {
		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var detailAddr = '<div>' + result[0].address.address_name
						+ '</div>';

				var content = '<div class="bAddr">' + detailAddr + '</div>';

				// 마커를 클릭한 위치에 표시합니다 
				marker.setPosition(mouseEvent.latLng);
				marker.setMap(map);

				// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
				infowindow.setContent(content);
				infowindow.open(map, marker);

				startaddr = result[0].address.address_name;
				start2 = document.getElementById('start')
				start2.innerHTML = startaddr

				// 클릭한 위도, 경도 정보를 가져옵니다 
				var latlng = mouseEvent.latLng;

				// 마커 위치를 클릭한 위치로 옮깁니다
				marker.setPosition(latlng);

				startLat = latlng.getLat().toFixed(5);
				startLng = latlng.getLng().toFixed(5);
			}
		});
	}

	function start() {
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', startEvent);
		const target = document.getElementById('endbtn');
		target.disabled = true;
	}

	var endEvent = function(mouseEvent) {
		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var detailAddr = '<div>' + result[0].address.address_name
						+ '</div>';

				var content = '<div class="bAddr">' + detailAddr + '</div>';

				// 마커를 클릭한 위치에 표시합니다 
				marker.setPosition(mouseEvent.latLng);
				marker.setMap(map);

				// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
				infowindow.setContent(content);
				infowindow.open(map, marker);

				endaddr = result[0].address.address_name;
				end2 = document.getElementById('end')
				end2.innerHTML = endaddr

				// 클릭한 위도, 경도 정보를 가져옵니다 
				var latlng = mouseEvent.latLng;

				// 마커 위치를 클릭한 위치로 옮깁니다
				marker.setPosition(latlng);

				endLat = latlng.getLat().toFixed(5);
				endLng = latlng.getLng().toFixed(5);
			}
		});
	}
	function end() {
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', endEvent);
		const target = document.getElementById('startbtn');
		target.disabled = true;
	}

	function finish() {
		kakao.maps.event.removeListener(map, 'click', startEvent);
		kakao.maps.event.removeListener(map, 'click', endEvent);
		
		const target = document.getElementById('startbtn');
		target.disabled = false;
		const target2 = document.getElementById('endbtn');
		target2.disabled = false;
	}

	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
</script>
