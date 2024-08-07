<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html>
<head>
<title>회원 포인트</title>
<link rel="stylesheet"
	href="${webappRoot}/resources/css/common/common.css">
</head>
<body>
	<!-- 헤더 영역 포함 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- 해당 페이지의 메인내용을 여기에 작성하세요. -->
	<main>
		<div class="admin-container">
			<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
		</div>




	</main>

	<!-- 푸터 영역 포함 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
