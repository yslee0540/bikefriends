<%@page import="java.util.List"%>
<%@page import="com.spring.bf.eventchallenge.eventchallengeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
  table {
    width: 55%;
   /*  border: 1px solid #444444; */
    border-collapse: collapse;
  }
  </style>
  <style>
* {
font-family: 'Sunflower', sans-serif;
}
</style>


<%!int k=1; %>
<table class="table "style="margin-left:auto;margin-right:auto;">
	<tr  style="text-align:center;background-color: #b7d5ac;">
    	<td colspan="3 "><b>인증샷 챌린지</b></td>
    </tr>
	<c:forEach var="vo" items="${list}">
	<td class="down" style="text-align:center"><a href="../eventchallenge/imgone?img=${vo.img}">
	<img src="../resources/img/event/${vo.img}" width="230" height="230"></a></td>
	<%
	if(k++%3==0){
	%>
	<tr></tr>
	<% 
	} %>
	</c:forEach>
</table>
</html>