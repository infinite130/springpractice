<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style>
@charset "UTF-8";
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* 화면 전체 랩 */
.wrapper {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-color: #f5f5dc; /* 베이지 배경색 */
}

/* content 랩 */
.wrap {
    width: 400px;
    padding: 40px;
    background: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #e0f7e9; /* 회원가입 창 배경색 */
    border: 2px solid #28a745; /* 녹색 테두리 */
}

/* 페이지 로고 */
.logo_wrap {
    text-align: center;
    margin-bottom: 40px;
}
.logo_wrap > span {
    font-size: 36px;
    font-weight: 700;
    color: #28a745; /* 녹색 텍스트 */
}

/* 로그인 area */
.id_input_box, .pw_input_box {
    width: 100%;
    margin: 15px 0;
}
.id_input, .pw_input {
    width: 100%;
    padding: 15px;
    font-size: 18px;
    border: 1px solid #ced4da;
    border-radius: 5px;
    background-color: #f8fff9; /* 연한 녹색 배경 */
    outline: none;
}

/* 로그인 버튼 */
.login_button_wrap {
    margin-top: 30px;
    text-align: center;
}
.login_button {
    width: 100%;
    padding: 15px;
    font-size: 20px;
    font-weight: 600;
    color: white;
    background-color: #28a745; /* 녹색 배경 */
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
}
.login_button:hover {
    background-color: #218838;
}

/* 로그인 실패시 경고글 */
.login_warn {
    margin-top: 20px;
    text-align: center;
    color: red;
    font-size: 16px;
}

/* float 속성 해제 */
.clearfix {
    clear: both;
}


</style>
</head>
<body>

<div class="wrapper">
	
	<div class="wrap">
		<form id="login_form" method="post">
			<div class="logo_wrap">
				<span>Book Mall</span>
			</div>
			<div class="login_wrap"> 
				<div class="id_wrap">
					<div class="id_input_box">
						<input class="id_input" name="memberId">
					</div>
				</div>
				<div class="pw_wrap">
					<div class="pw_input_box">
						<input class="pw_input" name="memberPw">
					</div>
				</div>
				
				<c:if test="${result == 0}">
					<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
				</c:if>
				
				<div class="login_button_wrap">
					<input type="button" class="login_button" value="로그인">
				</div>			
			</div>
		</form>
		
	</div>

</div>

<script>
	/* 로그인 버튼 클릭 메서드 */
	$(".login_button").click(function(){
		//alert("로그인 버튼 작동");
		/* 로그인 메서드 서버 요청 */
		$("#login_form").attr("action", "/member/login.do");
		$("#login_form").submit();
	});
</script>

</body>
</html>
