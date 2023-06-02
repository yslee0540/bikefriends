<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		var id = '${id}';
		if (id != '') {
			$.ajax({
				url : "/bf/bbs/book",
				data : {
					id : id
				},
				success : function(x) {
					$('#book').html(x)
				}
			})
		}
		
		let weatherIcon = {
	        '01' : 'fas fa-sun',
	        '02' : 'fas fa-cloud-sun',
	        '03' : 'fas fa-cloud',
	        '04' : 'fas fa-cloud-meatball',
	        '09' : 'fas fa-cloud-sun-rain',
	        '10' : 'fas fa-cloud-showers-heavy',
	        '11' : 'fas fa-poo-storm',
	        '13' : 'far fa-snowflake',
	        '50' : 'fas fa-smog'
	    };
		$.ajax({
			url:'http://api.openweathermap.org/data/2.5/weather?q=seoul&units=metric&lang=kr&appid=43238037f8f84c1b9d70369513a425e6',
			dataType: 'json',
			success: function(data){
				var $Icon = (data.weather[0].icon).substr(0,2);
				$('#weather').html('<i class="' + weatherIcon[$Icon] +'"></i> '+
						'<b>' + data.main.temp + 'º</b><br>' +
						'<span style=font-size:13px><font style=color:red>' + data.main.temp_max +
						'º</font> / <font style=color:blue>' + data.main.temp_min + 'º</font></span>')
			}
		})
	})
</script>
<div id="menu" class="col-2">
	<div id="weather"></div>
    <div id="category">
	    <ul class="list-group">
	        <a href="/bf/bbs/grouplist" id="item1"><li class="list-group-item">전체 게시판 목록</li></a>
	        <%
				if (session.getAttribute("id") != null) {
			%>
	        <div id="book"></div>
	        <% } %>
	        <a href="/bf/course/list?page=1" id="item2">
	            <li class="list-group-item" style="border-bottom: 0px;">코스 공유하기</li>
	        </a>
	    </ul>
    </div>
</div>