<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세조회페이지</title>

<!-- common.css 로드 -->
<link rel="stylesheet"
	href="${webappRoot}/resources/css/common/common.css">

<link rel="stylesheet"
	href="${webappRoot}/resources/css/notice/detail.css">

<!-- jQuery 로드 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!-- common.css 로드 -->

	<!-- 헤더 영역 포함 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main>
		<div class="detail-container">


			<div class="header">
				<div class="fix">
					
					 <fmt:formatDate
							value="${noticeDetail.noticeEnroll}" pattern="yyyy-MM-dd" /> 
					<label>작성일|</label>
					 <label>수정일 <fmt:formatDate value="${noticeDetail.noticeModify}" pattern="yyyy-MM-dd" /> |
					</label> <label >작성자: <c:out value= "${noticeDetail.memName}"/></label>
					 <label>| 조회수 <c:out value="${noticeDetail.noticeCount}" /></label> 
					 <label>| 좋아요 <span id="likeCount"> <c:out value="${noticeDetail.noticeLike}" /></span></label>
				</div>
				<button id="like" class="like">♥</button>
				<script>
					document.querySelector('.like').addEventListener('click',
							function() {
								this.classList.toggle('active');
							});
				</script>
			</div>

			<!-- 글제목 -->
			<div class="title">
				<c:out value="${noticeDetail.noticeTitle}" />
			</div>

			<!-- 글내용 -->
			<div class="content">
				<c:out value="${noticeDetail.noticeBody}" />

			</div>
			<div class="line"></div>
			<div class="btn-container">
				<button id="listbtn" class="list">목록</button>
				<c:if test="${isLoggedIn && isAdmin}">
				<button id="modifybtn" class="modify">수정</button>
				<button id="deletebtn" class="delete">삭제</button>
				</c:if>
			</div>

		</div>
		<div class="pagination">
			<button class="page-btn active">1</button>
			<button class="page-btn">2</button>
			<button class="page-btn">3</button>
		</div>

		<form id="moveForm" method="get">
			<input type="hidden" name="noticeCode"
				value="<c:out value='${noticeDetail.noticeCode}'/>">
		</form>
        
	</main>
   
   	<!-- 푸터 영역 포함 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
   
	<script>
	
	$(document).ready(function() {
	    var noticeCode = '${noticeDetail.noticeCode}';
	    
	    // 페이지 로드 시 AJAX 요청으로 조회수 증가
	    $.ajax({
	        url: '/notice/Count',
	        type: 'POST',
	        data: { noticeCode: noticeCode },
	        success: function(response) {
	            console.log("조회수 증가 성공");
	            // 조회수를 다시 가져와 화면에 표시
	            updateViewCount();
	        },
	        error: function(xhr, status, error) {
	            console.error("조회수 증가 실패", error);
	        }
	    });
       
	        $("#like").on("click", function() {
	            var noticeCode = '${noticeDetail.noticeCode}';
	            
	            $.ajax({
	                url: '/notice/Like',
	                type: 'POST',
	                data: { noticeCode: noticeCode },
	                success: function(response) {
	                    var likeCount = parseInt($("#likeCount").text());
	                    $("#likeCount").text(likeCount + 1);
	                    console.log("좋아요 증가 성공");
	                },
	                error: function(xhr, status, error) {
	                    console.error("좋아요 증가 실패", error);
	                }
	            });
	        });

	    
	    
	    let moveForm = $("#moveForm");
	    /* 공지사항 조회 페이지 이동 */
	    $("#listbtn").on("click", function(e) {
	        e.preventDefault();
	        $("input[name=noticeCode]").remove();
	        moveForm.attr("action", "/notice/list");
	        moveForm.submit();
	    });

	    /* 공지사항 수정 페이지 이동 */
	    $("#modifybtn").on("click", function(e) {
	        e.preventDefault();
	        moveForm.attr("action", "/notice/modify");
	        moveForm.submit();
	    });

	    /* 공지사항 삭제 버튼 */
	    $("#deletebtn").on("click", function(e){
	        e.preventDefault();
	        if(confirm("정말로 이 공지사항을 삭제하시겠습니까?")) {
	            moveForm.find("input").remove();
	            moveForm.append('<input type="hidden" name="noticeCode" value="' + noticeCode + '">');
	            moveForm.attr("action", "/notice/delete");
	            moveForm.attr("method", "post");
	            moveForm.submit();
	        }
	    });
	});

	</script>

	<!-- 푸터 영역 포함 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>