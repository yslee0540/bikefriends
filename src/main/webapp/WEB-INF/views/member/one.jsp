<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
	<link rel="stylesheet" href="resources/css/bbsstyle.css">	
</head>
<body>
<center>
 	<jsp:include page="../../../nav.jsp"></jsp:include>
	<h3>마이 페이지</h3>
	<%
	if (session.getAttribute("id") != null) {
	%>
	<img src="../resources/img/${bag.sign_img}" width="250" height="250" alt="내 프로필 사진">
	<div>
		이름 : ${bag.sign_name}<br>
		성별 : ${bag.sign_gender}<br>
		나이 : ${bag.sign_age}<br>
		소갯말 : ${bag.sign_bio}<br>
		이메일 : ${bag.sign_email}<br>
		주소 : ${bag.sign_address}<br>
		전화번호 : ${bag.sign_phone}<br>
	</div>
	<a href="/bf/member/update?id=<%=session.getAttribute("id")%>">
		<button>수정하기</button>
	</a>
	<c:if test="${empty list}">
				<div style="text-align: center; padding: 0 0 20px;">게시물 없음</div>
	</c:if>
	<c:if test="${!empty list}">
				<c:forEach var="vo" items="${list}">
					<table>
						<tr class="post">
							<td class="profile" rowspan="3"><img
								src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
								class="img"></td>
							<td class="bbswriter"><b>${vo.writer}</b></td>
							<td class="bbsdate">${vo.date}</td>
						</tr>
						<tr>
							<td class="bbscon" colspan="2">
								<a href="one?bbs_no=${vo.bbs_no}">${vo.content}</a>
								<c:if test="${!empty vo.img}">
									<i class="fa-regular fa-image"></i>
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="bbsinfo" colspan="2">
								<i class="fa-regular fa-comment"></i> ${vo.cmt_cnt}
								<i class="fa-regular fa-heart"></i> ${vo.like_cnt}
							</td>
						</tr>
					</table>
					<hr>
				</c:forEach>
		</c:if>
	<%
		} else {
	%>
	<a href="login.jsp">
		<button>로그인 화면으로 go</button>
	</a>
	<%
		}
	%>
</center>
</body>
</html>