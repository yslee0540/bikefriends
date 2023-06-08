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

var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
    map: map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
    drawingMode: [ // Drawing Manager로 제공할 그리기 요소 모드입니다
        kakao.maps.drawing.OverlayType.POLYLINE
    ],
    // 사용자에게 제공할 그리기 가이드 툴팁입니다
    // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
    guideTooltip: ['draw', 'drag', 'edit'], 
    polylineOptions: { // 선 옵션입니다
        draggable: true, // 그린 후 드래그가 가능하도록 설정합니다
        removable: true, // 그린 후 삭제 할 수 있도록 x 버튼이 표시됩니다
        editable: true, // 그린 후 수정할 수 있도록 설정합니다 
        strokeColor: 'red', // 선 색
        strokeWeight: 3,
        hintStrokeStyle: 'dash', // 그리중 마우스를 따라다니는 보조선의 선 스타일
        hintStrokeOpacity: 0.5  // 그리중 마우스를 따라다니는 보조선의 투명도
    }
};

// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
var manager = new kakao.maps.drawing.DrawingManager(options);

// 버튼 클릭 시 호출되는 핸들러 입니다
function selectOverlay(type) {
    // 그리기 중이면 그리기를 취소합니다
    manager.cancel();

    // 클릭한 그리기 요소 타입을 선택합니다
    manager.select(kakao.maps.drawing.OverlayType[type]);
}

// 가져오기 버튼을 클릭하면 호출되는 핸들러 함수입니다
// Drawing Manager로 그려진 객체 데이터를 가져와 아래 지도에 표시합니다
function getDataFromDrawingMap() {
    // Drawing Manager에서 그려진 데이터 정보를 가져옵니다 
    var data = manager.getData();

    // 지도에 가져온 데이터로 도형들을 그립니다
    drawPolyline(data[kakao.maps.drawing.OverlayType.POLYLINE]);
}

// Drawing Manager에서 가져온 데이터 중 선을 아래 지도에 표시하는 함수입니다
function drawPolyline(lines) {
    var len = lines.length, i = 0;

    for (; i < len; i++) {
        var path = pointsToPath(lines[i].points);
        var polyline = new kakao.maps.Polyline({
            path: path
        });
    }
}

var lat = '';
var lng = '';

// Drawing Manager에서 가져온 데이터 중 
// 선의 꼭지점 정보를 kakao.maps.LatLng객체로 생성하고 배열로 반환하는 함수입니다 
function pointsToPath(points) {
    var len = points.length, 
        path = [], 
        i = 0;
    
	lat = ''
	lng = ''
    for (; i < len; i++) { 
        var latlng = new kakao.maps.LatLng(points[i].y, points[i].x);
        path.push(latlng); 
        lat += points[i].y.toFixed(5) + '/'
        lng += points[i].x.toFixed(5) + '/'
    }
}

</script>
