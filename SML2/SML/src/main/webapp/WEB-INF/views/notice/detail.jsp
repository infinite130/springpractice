<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세조회페이지</title>

<!-- common.css 로드 -->
<link rel="stylesheet" href="${webappRoot}/resources/css/common/common.css">

<link rel="stylesheet" href="${webappRoot}/resources/css/notice/detail.css">
	
</head>
<body>
<!-- common.css 로드 -->

	<!-- 헤더 영역 포함 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main>
		<div class="detail-container">
			<div class="header">
			<div class="fix">
				<label>작성일 2024.00.00 |</label>
					<label>수정일 2024.00.00 |</label> 
					<label>작성자: 관리자</label>
					 <label>| 조회수 1 </label>
					<lable>| 좋아요 2</lable>
				</div>
				<button class="like">♥</button>
		
			</div>

			<div class="title">사이트 이용안내</div>
			<div class="content">
				사이트 이용안내에 대한 내용입니다. 사이트 이용안내에 대한 내용입니다. 사이트 이용안내에 대한 내용입니다.
				사이트 이용안내에 대한 내용입니다. 사이트 이용안내에 대한 내용입니다. 사이트 이용안내에 대한 내용입니다.
				
				<br>
				사이트 이용안내에 대한 내용입니다. 사이트 이용안내에 대한 내용입니다. 사이트 이용안내에 대한 내용입니다.<br>
				사이트 이용안내에 대한 내용입니다. 사이트 이용안내에 대한 내용입니다. 사이트 이용안내에 대한 내용입니다.<br>
				사이트 이용안내에 대한 내용입니다. 사이트 이용안내에 대한 내용입니다. 사이트 이용안내에 대한 내용입니다.
			</div>
			<div class="line"></div>
			<div class="btn-container">
				<button class="list">목록</button>
				<button class="modify">수정</button>
				<button class="delete">삭제</button>
			</div>
		</div>
	 <div class="pagination">
            <button class="page-btn active">1</button>
            <button class="page-btn">2</button>
            <button class="page-btn">3</button>
        </div>
        <script>
        document.querySelectorAll('.page-btn').forEach(button => {
            button.addEventListener('click', function () {
                document.querySelectorAll('.page-btn').forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');
            });
        });
    </script>
	</main>
	
		<script>
        document.querySelector('.like').addEventListener('click', function() {
            this.classList.toggle('active');
        });
    </script>
    
    	<!-- 푸터 영역 포함 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
</body>
</html>