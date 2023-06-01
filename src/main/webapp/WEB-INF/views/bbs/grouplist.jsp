<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$('#inputSearch').autocomplete({
			source : function(request, response) { //source: 입력시 보일 목록
			     $.ajax({
			         url : "autocomplete",   
			         type : "POST",
			         dataType: "JSON",
			         data : {value: request.term},	// 검색 키워드
			         success : function(data){ 	// 성공
			             response(
			                 $.map(data.resultList, function(item) {
			                 	return {
									label : item.group_name, // 목록에 표시되는 값
									value : item.group_name, // 선택 시 input창에 표시되는 값
			                        idx : item.group_no // index
								};
			                 })
			             );    //response
			         },
			         error : function(){ //실패
			             alert("오류가 발생했습니다.");
			         }
			     });
			},
			focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
					return false;
			},
			minLength: 1, // 최소 글자수
			autoFocus : true, // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
			delay: 100,	// autocomplete 딜레이 시간(ms)
			select : function(evt, ui) { 
		    	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
				console.log(ui.item.label);
				console.log(ui.item.idx);
				location.href = 'list?group_no=' + ui.item.idx + '&page=1';
			}
		});
	})
</script>
<style type="text/css">
.groupbtn:hover {
	color: white;
	background: #14870c;
}
</style>
</head>
<body>
	<%@ include file="../../../nav.jsp"%>
	<div class="row" style="width: 850px; margin: auto;">
		<jsp:include page="menu.jsp"></jsp:include>

		<div id="main" class="col-6">
			<div id="top">
				<div id="title2">게시판 목록</div>
			</div>
			<hr>
			<div style="padding: 5px 25px 15px;">
				<input class="form-control" placeholder="게시판 검색" id="inputSearch">
			</div>
			<div class="row">
				<div class="col group1">
					<c:forEach var="vo" items="${list}" step="2" varStatus="status">
						<a href="list?group_no=${vo.group_no}&page=1">
							<button class="btn groupbtn">${vo.group_name}</button>
						</a>
					</c:forEach>
				</div>
				<div class="col group2">
					<c:forEach var="vo" items="${list}" begin="1" step="2" varStatus="status">
						<a href="list?group_no=${vo.group_no}&page=1">
							<button class="btn groupbtn">${vo.group_name}</button>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>