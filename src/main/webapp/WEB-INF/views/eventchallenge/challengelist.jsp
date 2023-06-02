<%@page import="java.util.List"%>
<%@page import="com.spring.bf.eventchallenge.eventchallengeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%!int k=1; %>
<table class="table ">
	<tr class="table-warning " style="text-align:center">
    	<th colspan="3 ">인증샷 챌린지</th>
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
