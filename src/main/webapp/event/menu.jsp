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
<div id="menu1" class="col-2">
	<div id="weather"></div>
    <div id="category1">
	    <ul class="list-group">
	        <a href="event/이벤트개설.jsp" id="item1"><li class="list-group-item">같이달려요</li></a>
	        <a href="event/이벤트개설2.jsp" id="item2">
	            <li class="list-group-item" style="border-bottom: 0px;">인증샷챌린지</li>
	        </a>
	    </ul>
    </div>
</div>