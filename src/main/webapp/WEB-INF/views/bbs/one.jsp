<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 내용</title>
<script type="text/javascript">
	function replylist() {
		$.ajax({
			url: "replylist",
			data: {
				bbs_no: ${bbsVO.bbs_no},
			},
			success: function(x) {
				$('#replylist').html(x);
			}
		})
	}
	replylist();
	
	$(function() {
		/* 댓글 새로고침 */
		$(document).on('click', '#refresh', function() {
			replylist();
		})
		
		/* 댓글 입력 */
		cmt_cnt = ${bbsVO.cmt_cnt}
		$('#b1').click(function() {
			content = $('#reinput').val();
			if (content != '') {
				$.ajax({
					url: "replyinsert",
					data: {
						bbs_no: ${bbsVO.bbs_no},
						writer: '${id}',
						content: content
					},
					success: function() {
						replylist();
						$('#reinput').val("");
						cmt_cnt = cmt_cnt + 1;
						$('.reply').html('댓글 ' + cmt_cnt + '개 <span id="refresh">새로고침</span>');
					}
				})
			} else {
				alert('내용을 입력하세요');
			}
		})
		
		/* 게시물 삭제 */
		$('#b3').click(function() {
			if (confirm('게시물 삭제하시겠습니까?')) {
				$.ajax({
					url: "delete",
					data: {
						bbs_no: ${bbsVO.bbs_no}
					},
					success: function() {
						location.href = 'list?group_no=' + ${bbsVO.group_no} + '&page=1';
					}
				})
			}
		})
		
		/* 댓글 삭제 */
		$(document).on('click', '.b5', function() {
			if (confirm('댓글 삭제하시겠습니까?')) {
				$.ajax({
					url: "replydelete",
					data: {
						reply_no: $(this).data('no')
					},
					success: function() {
						replylist();
						cmt_cnt = cmt_cnt - 1;
						$('.reply').html('댓글 ' + cmt_cnt + '개 <span id="refresh">새로고침</span>');
					}
				})
			}
		})
		
		/* 좋아요 */
		like = ${like};
		like_cnt = ${bbsVO.like_cnt};
		if(like >= 1) {
			$('#like').html('<i class="fa-solid fa-heart" style="color: red;"></i>');
		}
		
		id = '${id}';
		if (id != '') {
			$('#like').click(function() {
				if (like >= 1) {
					$.ajax({
						url: "likeDown",
						data: {
							bbs_no: ${bbsVO.bbs_no},
							member_id: '${id}'
						},
						success: function() {
							like = 0;
							$('#like').html('<i class="fa-regular fa-heart"></i>');
							like_cnt = like_cnt - 1;
							$('#like_cnt').html(like_cnt);
						}
					})
				} else {
					$.ajax({
						url: "likeUp",
						data: {
							bbs_no: ${bbsVO.bbs_no},
							member_id: '${id}'
						},
						success: function() {
							like = 1;
							$('#like').html('<i class="fa-solid fa-heart" style="color: red;"></i>');
							like_cnt = like_cnt + 1;
							$('#like_cnt').html(like_cnt);
						}
					})
				}
			})
		}
	})
</script>
</head>
<body>
<%@ include file="../../../nav.jsp" %>
<div class="row" style="width: 850px;margin: auto;">
	<jsp:include page="menu2.jsp"></jsp:include>
    
	<div id="main" class="col-6">
        <div id="top">
            <c:choose>
            	<c:when test="${id == bbsVO.writer}">
            		<div id="title">${bbsVO.group_name}</div>
		            <a href="update?bbs_no=${bbsVO.bbs_no}">
		            	<button class="btn btn-primary" id="b2">수정</button></a>
		            <button class="btn btn-danger" id="b3">삭제</button>
            	</c:when>
            	<c:otherwise>
            		<div id="title2">${bbsVO.group_name}</div>
            	</c:otherwise>
            </c:choose>
        </div>
        <hr>

        <table>
            <tr class="post1">
                <td class="profile" rowspan="3"><img src="${bbsVO.sign_img}" class="img" style="object-fit: cover;"></td>
                <td class="bbswriter"><b>${bbsVO.sign_name}</b></td>
                <td class="bbsdate"><fmt:formatDate value="${bbsVO.date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            </tr>
            <tr>
                <td class="bbscon" colspan="2">
                	${bbsVO.content}
                	<c:if test="${!empty bbsVO.img}">
	                	<br><br>
	                	<img src="../resources/upload/${bbsVO.img}" width="495">
                	</c:if>
                </td>
            </tr>
            <tr>
                <td class="bbsinfo" colspan="2">
                	<i class="fa-regular fa-eye"></i> ${bbsVO.hit}
                	<span id="like">
                   		<i class="fa-regular fa-heart"></i>
	                </span>
                    <span id="like_cnt">${bbsVO.like_cnt}</span>
                </td>
            </tr>
        </table>
        <hr>
        <c:if test="${id != null}">
	        <div id="reinsert">
				댓글 <input id="reinput" placeholder="내용 입력">
	            <button id="b1">작성</button>
	        </div>
	    </c:if>
        <table>
            <tr style="border-bottom: 1px solid #c1c1c1;">
                <td class="reply" colspan="3">
                	댓글 ${bbsVO.cmt_cnt}개 
                	<span id="refresh">새로고침</span>
                </td>
            </tr>
        </table>
        <div id="replylist"></div>
        <div style="padding: 20px 20px 0;">
            <a href="list?group_no=${bbsVO.group_no}&page=1">
                <button class="btn btn-dark">
                    <i class="fa-solid fa-list-ul"></i> 목록
                </button>
            </a>
        </div>
    </div>
</div>
</body>
</html>