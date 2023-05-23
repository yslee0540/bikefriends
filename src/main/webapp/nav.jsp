<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
/* 	$(function() {
		id2 = '${id}'
		if (id2 != '') {
			$.ajax({
				url : "/bf/bbs/book",
				data : {
					id : id2
				},
				success : function(x) {
					$('#book').html(x)
				}
			})
		}
		$('.login').click(function() {
			var id = prompt("아이디");
			$.ajax({
				url : "/bf/bbs/login",
				data : {
					id : id
				},
				success : function() {
					location.reload()
				}
			})
		})
		$('.logout').click(function() {
			$.ajax({
				url : "/bf/bbs/logout",
				success : function() {
					location.reload()
				}
			})
		})
	}) */
</script>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark"
	style="margin-bottom: 30px; font-size: 18px;">
	<div class="container-fluid">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active" href="/bf"><b>Bike
						Friends</b></a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle id" role="button"
				data-bs-toggle="dropdown">커뮤니티</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/bf/bbs/grouplist">전체
							게시판 목록</a></li>
					<li><a class="dropdown-item" href="/bf/bbs/best">인기 게시판</a></li>
					<% if(session.getAttribute("id") != null) { %>
					<li><hr class="dropdown-divider"></li>
					<li id="book"></li>
					<% } %>
				</ul></li>
			<li class="nav-item"><a class="nav-link" href="#">가게</a></li>
			<li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
			<li class="nav-item"><a class="nav-link" href="#">이용권</a></li>
		</ul>
		<ul class="navbar-nav">
			<li class="nav-item" style="text-align: right;"><a
				class="nav-link login">로그인</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" role="button"
				data-bs-toggle="dropdown">${id}</a>
				<ul class="dropdown-menu dropdown-menu-end">
					<li><a class="dropdown-item" href="#">마이페이지</a></li>
					<li><a class="dropdown-item" href="#">쪽지</a></li>
					<li><a class="dropdown-item logout">로그아웃</a></li>
				</ul></li>
		</ul>
	</div>
</nav>