<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.spring.bf.event.eventVO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<table style="background:white;">
	<tr align="center">
		<td class="top" width="150">id</td>
		<td class="top" width="150">장소</td>
		<td class="top" width="200">모임 날짜</td>
		<td class="top" width="150">참여 인원</td>
	</tr>

	<c:forEach var="eventVO" items="${list}">

		<tr align="center">
			<td class="down">${eventVO.event_id}</td>
			<td class="down"  ><a href="event/one?event_id=${eventVO.event_id}">${eventVO.event_location}</a></td>
			<td class="down">${eventVO.event_date}</td>
			<td class="down">${eventVO.event_size}</td>
		</tr>

	</c:forEach>
</table>