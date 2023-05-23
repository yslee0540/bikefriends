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
				bbs_no: ${vo.bbs_no},
			},
			success: function(x) {
				$('#replylist').html(x)
			}
		})
	}
	replylist();
	
	$(function() {
		/* 댓글 새로고침 */
		$('#refresh').click(function() {
			replylist();
		})
		
		/* 댓글 입력 */
		cmt_cnt = ${vo.cmt_cnt}
		$('#b1').click(function() {
			content = $('#reinput').val()
			if (content != '') {
				$.ajax({
					url: "replyinsert",
					data: {
						bbs_no: ${vo.bbs_no},
						writer: '${id}',
						content: content
					},
					success: function() {
						replylist();
						$('#reinput').val("")
						cmt_cnt = cmt_cnt + 1
						$('.reply').html('댓글 ' + cmt_cnt + '개')
					}
				})
			} else {
				alert('내용을 입력하세요')
			}
		})
		
		/* 게시물 삭제 */
		$('#b3').click(function() {
			if (confirm('게시물 삭제하시겠습니까?')) {
				$.ajax({
					url: "delete",
					data: {
						bbs_no: ${vo.bbs_no}
					},
					success: function() {
						location.href = 'list?group_no=' + ${vo.group_no} + '&page=1'
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
						cmt_cnt = cmt_cnt - 1
						$('.reply').html('댓글 ' + cmt_cnt + '개')
					}
				})
			}
		})
		
		/* 좋아요 */
		like = ${like}
		like_cnt = ${vo.like_cnt}
		if(like >= 1) {
			$('#like').html('<i class="fa-solid fa-heart" style="color: red;"></i>')
		}
		
		id = '${id}'
		if (id != '') {
			$('#like').click(function() {
				if (like >= 1) {
					$.ajax({
						url: "likeDown",
						data: {
							bbs_no: ${vo.bbs_no},
							member_id: '${id}'
						},
						success: function() {
							like = 0
							$('#like').html('<i class="fa-regular fa-heart"></i>')
							like_cnt = like_cnt - 1
							$('#like_cnt').html(like_cnt)
						}
					})
				} else {
					$.ajax({
						url: "likeUp",
						data: {
							bbs_no: ${vo.bbs_no},
							member_id: '${id}'
						},
						success: function() {
							like = 1
							$('#like').html('<i class="fa-solid fa-heart" style="color: red;"></i>')
							like_cnt = like_cnt + 1
							$('#like_cnt').html(like_cnt)
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

	<div id="main">

        <div id="top">
            <c:choose>
            	<c:when test="${id == vo.writer}">
            		<div id="title">${group.group_name}</div>
		            <a href="update?bbs_no=${vo.bbs_no}">
		            	<button class="btn btn-primary" id="b2">수정</button></a>
		            <button class="btn btn-danger" id="b3">삭제</button>
            	</c:when>
            	<c:otherwise>
            		<div id="title2">${group.group_name}</div>
            	</c:otherwise>
            </c:choose>
        </div>
        <hr>

        <table>
            <tr class="post1">
                <td class="profile" rowspan="3"><img
                        src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
                        class="img"></td>
                <td class="bbswriter"><b>${vo.writer}</b></td>
                <td class="bbsdate">${vo.date}</td>
            </tr>
            <tr>
                <td class="bbscon" colspan="2">
                	${vo.content}
                	<c:if test="${!empty vo.img}">
	                	<br><br>
	                	<img src="../resources/upload/${vo.img}" width="495">
                	</c:if>
                </td>
            </tr>
            <tr>
                <td class="bbsinfo" colspan="2">
                	<i class="fa-regular fa-eye"></i> ${vo.hit}
                	<span id="like">
                   		<i class="fa-regular fa-heart"></i>
	                </span>
                    <span id="like_cnt">${vo.like_cnt}</span>
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
                	댓글 ${vo.cmt_cnt}개 
                	<span id="refresh">새로고침</span>
                </td>
            </tr>
        </table>
        <div id="replylist"></div>
        <div style="padding: 20px 20px 0;">
            <a href="list?group_no=${group.group_no}&page=1">
                <button class="btn btn-dark">
                    <i class="fa-solid fa-list-ul"></i> 목록
                </button>
            </a>
        </div>
    </div>
</body>
</html>