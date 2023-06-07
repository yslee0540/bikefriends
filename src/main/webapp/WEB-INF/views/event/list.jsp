<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.spring.bf.event.eventVO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script     
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/out.css">
<style>
  table {
    width: 100%;
   /*  border: 1px solid #444444; */
    border-collapse: collapse;
  }
  </style>
  <style>
  th, td {
   /*  border: 1px solid #444444; */
  }
</style>
<style>
a {
	text-decoration: none;
	color: blue;
}
</style>
<div id="main" class="col-6">
<div id="top">
<table class="table style=width:650px;">
	<tr style="text-align:center;background-color: #b7d5ac;">
    	<th colspan="4 ">번개 모임</th>
    </tr>
	<tr align="center">
		<td class="top" width="150"></td>
		<td class="top" width="150">제목</td>
		<td class="top" width="150">장소</td>
		<td class="top" width="200">모임 날짜</td>
		<td class="top" width="150">참여 인원</td>
		<td class="top" width="150">id</td>
	</tr>

	<c:forEach var="eventVO" items="${list}">

		<tr align="center">
		<td class="down">${eventVO.no}</td>
		<td class="down">${eventVO.title}</td>
			<td class="down">${eventVO.event_id}</td>
			<td class="down"  ><a href="event/one?event_id=${eventVO.event_id}">${eventVO.event_location}</a></td>
			<td class="down">${eventVO.event_date}</td>
			<td class="down">${eventVO.event_size}</td>
		</tr>

	</c:forEach>
</table>
</div>
</div>
