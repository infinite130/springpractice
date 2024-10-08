<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>SML_Admin(관리자정보 수정)</title>
<link rel="stylesheet"
	href="${webappRoot}/resources/css/common/common.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

	<!-- 헤더 영역 포함 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main>
		<div class="admin-container">
			<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
			<div class="admin-main-content">
				<h2>회원 목록</h2>
				<div class="form_wrap">
					<form id="modifyInfo_form" method="post">
						<div class="id_wrap">
							<div class="label">아이디</div>
							<div class="input_box">
								<input class="id_input" name="memId"
									value="${sessionScope.member.memId}" readonly>
							</div>
						</div>
						<div class="ex_pw_wrap">
							<div class="label">기존 비밀번호</div>
							<div class="input_box">
								<input class="pw_input" name="memPw">
							</div>
							<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
						</div>
						<div class="pw_wrap">
							<div class="label">새로운 비밀번호</div>
							<div class="input_box">
								<input class="pw_input" name="memPw">
							</div>
							<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
						</div>
						<div class="pwck_wrap">
							<div class="label">새로운 비밀번호 확인</div>
							<div class="input_box">
								<input class="pwck_input">
							</div>
							<span class="final_pwck_ck">비밀번호를 입력해주세요.</span> <span
								class="pwck_input_re_1">비밀번호가 일치합니다.</span> <span
								class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
						</div>
						<div class="user_wrap">
							<div class="label">이름</div>
							<div class="input_box">
								<input class="user_input" name="memName"
									value="${sessionScope.member.memName}" readonly>
							</div>
						</div>
						<div class="mail_wrap">
							<div class="label">이메일</div>
							<div class="input_box">
								<input class="mail_input" name="memMail"
									value="${sessionScope.member.memMail}">
							</div>
							<span class="final_mail_ck">이메일을 입력해주세요.</span>
							<sapn class="mail_input_box_warn"></sapn>
							<div class="mail_check_wrap">
								<div class="mail_check_input_box"
									id="mail_check_input_box_false">
									<input class="mail_check_input" disabled="disabled">
								</div>
								<div class="mail_check_button">
									<span>인증번호 전송</span>
								</div>
								<span id="mail_check_input_box_warn"></span>
							</div>
						</div>

						<div class="clearfix"></div>
						<span id="mail_check_input_box_warn" />

						<div class="phone_wrap">
							<div class="label">연락처</div>
							<div class="input_box">
								<input class="phone_input" name="memPhone"
									value="${sessionScope.member.memPhone}">
							</div>
							<span class="final_phone_ck">연락처를 입력해주세요.</span>

						</div>
						<div class="emerphone_wrap">
							<div class="label">비상연락처</div>
							<div class="input_box">
								<input class="emerphone_input" name="memEmerPhone"
									value="${sessionScope.member.memEmerPhone}">
							</div>
							<span class="final_emerphone_ck">비상연락처를 입력해주세요.</span>
						</div>
						<div class="address_wrap">
							<div class="label">주소</div>
							<div class="input_box">
								<div class="address_input_1_box">
									<input class="address_input_1" name="memAddr1"
										value="${sessionScope.member.memAddr1}" readonly="readonly">
									<div class="address_button" onclick="execution_daum_address()">
										<span>주소 찾기</span>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="address_input_2_wrap">
								<div class="input_box">
									<input class="address_input_2" name="memAddr2"
										value="${sessionScope.member.memAddr2}" readonly="readonly">
								</div>
							</div>
							<div class="address_input_3_wrap">
								<div class="input_box">
									<input class="address_input_3" name="memAddr3"
										value="${sessionScope.member.memAddr3}" readonly="readonly">
								</div>
							</div>
							<span class="final_addr_ck">주소를 입력해주세요.</span>
						</div>
						<div class="mypage_button_wrap">
							<input type="button" class="save_button" value="저장"> <input
								type="button" class="cancel_button" value="취소">
					</form>
				</div>
			</div>
		</div>
		</div>
	</main>

	<!-- 푸터 영역 포함 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script>
		// 인증번호 저장
		var code = ""; //이메일 전송 인증번호 저장위한 코드 

		/* 유효성 검사 통과유무 변수 */
		var pwCheck = false;
		var pwckCheck = false;
		var pwckcorCheck = false;
		var mailCheck = false;
		var mailnumCheck = false;
		var addressCheck = false

		$(document)
				.ready(
						function() {
							//정보 수정 저장 버튼
							$(".save_button")
									.click(
											function() {
												//입력란 변수
												var id = $('.id_input').val();
												var pw = $('.pw_input').val();
												var pwck = $('.pwck_input')
														.val();
												var name = $('.user_input')
														.val();
												var mail = $('.mail_input')
														.val();
												var addr = $('.address_input_3')
														.val();

												// 비밀번호 유효성 검사
												if (pw == "") {
													$('.final_pw_ck').css(
															'display', 'block');
													pwCheck = false;
												} else {
													$('.final_pw_ck').css(
															'display', 'none');
													pwCheck = true;
												}

												// 비밀번호 확인 유효성 검사
												if (pwck == "") {
													$('.final_pwck_ck').css(
															'display', 'block');
													pwckCheck = false;
												} else {
													$('.final_pwck_ck').css(
															'display', 'none');
													pwckCheck = true;
												}

												//이메일 유효성 검사 //
												if (mail == "") {
													$('.final_mail_ck').css(
															'display', 'block');
													mailCheck = false;
												} else {
													$('.final_mail_ck').css(
															'display', 'none');
													mailCheck = true;
												}
												// 주소 유효성 검사 //
												if (addr == "") {
													$('.final_addr_ck').css(
															'display', 'block');
													addressCheck = false;
												} else {
													$('.final_addr_ck').css(
															'display', 'none');
													addressCheck = true;
												}

												// 최종 유효성 검사 //
												if (pwCheck && pwckCheck
														&& pwckcorCheck
														&& mailCheck
														&& mailnumCheck
														&& addressCheck) {
													$("#modifyInfo_form").attr(
															"action",
															"/member/modify");
													$("#modifyInfo_form")
															.submit();
												}

												return false;

											});
						});

		// 입력 이메일 형식 유효성 검사 //
		function mailFormCheck(email) {
			var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return form.test(email);
		}

		// 인증번호 이메일 전송 //
		$(".mail_check_button").click(function() {

			var email = $(".mail_input").val(); // 입력한 이메일
			var checkBox = $(".mail_check_input");
			var boxWrap = $(".mail_check_input_box");
			var warnMsg = $(".mail_input_box_warn");

			//이메일 형식 유효성 검사 //
			if (mailFormCheck(email)) {
				warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
				warnMsg.css("display", "inline-block");
			} else {
				warnMsg.html("올바르지 못한 이메일 형식입니다.");
				warnMsg.css("display", "inline-block");
				return false;
			}

			$.ajax({

				type : "GET",
				url : "mailCheck?email=" + email,
				success : function(data) {
					// console.log("data : " +data);
					checkBox.attr("disabled", false);
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;
				}

			});

		});
		// 인증번호 비교 //
		$(".mail_check_input").blur(function() {

			var inputCode = $(".mail_check_input").val(); // 입력코드    
			var checkResult = $("#mail_check_input_box_warn"); // 비교 결과    

			if (inputCode == code) { // 일치할 경우
				checkResult.html("인증번호가 일치합니다.");
				checkResult.attr("class", "correct");
				mailnumCheck = true;
			} else { // 일치하지 않을 경우
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("class", "incorrect");
				mailnumCheck = false;
			}

		});

		// 다음 주소 연동 //
		function execution_daum_address() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 주소변수 문자열과 참고항목 문자열 합치기
								addr += extraAddr;

							} else {
								addr += ' ';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							$(".address_input_1").val(data.zonecode);
							$(".address_input_2").val(addr);
							// 커서를 상세주소 필드로 이동한다.
							$(".address_input_3").attr("readonly", false);
							$(".address_input_3").focus();
						}
					}).open();
		}

		// 비밀번호 확인 일치 유효성 검사 //
		$('.pwck_input').on("propertychange change keyup paste input",
				function() {
					var pw = $('.pw_input').val();
					var pwck = $('.pwck_input').val();
					$('.final_pwck_ck').css('display', 'none');

					if (pw == pwck) {
						$('.pwck_input_re_1').css('display', 'block');
						$('.pwck_input_re_2').css('display', 'none');
						pwckcorCheck = true;
					} else {
						$('.pwck_input_re_1').css('display', 'none');
						$('.pwck_input_re_2').css('display', 'block');
						pwckcorCheck = false;
					}

				});
	</script>