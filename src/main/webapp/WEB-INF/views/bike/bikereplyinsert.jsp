<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
	<table style="width: 100%; margin: 5px;">
		<tr>
			<td style="width: 15%; color: #FAD000;">${bag.bikereply_rating}</td>
			<td style="width: 60%; text-align: right;">${bag.bikereply_writer}</td>
			<td style="width: 25%; text-align: right; font-size: 6px">${bag.date}</td>
		</tr>
		<tr>
			<td colspan="3">${bag.bikereply_content}</td>
		</tr>
		<tr>
			<td colspan="3"><button style="float: right;">수정</button>
				<button style="float: right;" data-no="${bag.bikereply_no}">삭제</button></td>
		</tr>
	</table>
