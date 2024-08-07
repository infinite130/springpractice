<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<link rel="stylesheet" href="/resources/css/member/join.css">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

	<!-- 헤더 영역 포함 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<main>
	<div class="wrapper">
		<form id="join_form" method="post">
			<div class="wrap">
				<div class="subjecet">
					<span>회원가입</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input class="id_input" name="memId">
					</div>
					<span class="id_input_re_1">사용 가능한 아이디입니다.</span> 
					<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
					<span class="final_id_ck">아이디를 입력해주세요.</span>
				</div>
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<div class="pw_input_box">
						<input class="pw_input" name="memPw">
					</div>
					<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
				</div>
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
					<div class="pwck_input_box">
						<input class="pwck_input">
					</div>
					<span class="final_pwck_ck">비밀번호를 입력해주세요.</span>
					<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                	<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				</div>
				<div class="user_wrap">
					<div class="user_name">이름</div>
					<div class="user_input_box">
						<input class="user_input" name="memName">
					</div>
					<span class="final_name_ck">이름을 입력해주세요.</span>
				</div>
				<div class="birth_wrap">
					<div class="user_birth">생년월일</div>
				<!-- 
				<select class="box" id="birth-year">
    				<option disabled selected>출생 연도</option>
  				</select>
  				<select class="box" id="birth-month">
    				<option disabled selected>월</option>
				 </select>
				 <select class="box" id="birth-day">
    				<option disabled selected>일</option>
  				</select>
				-->
				 
					<div class="com_input_box">
						<input type=date class="com_input" name="memBirth" max="9999-12-31">
					</div>
				

 
				</div>
				<div class="mail_wrap">
					<div class="user_mail">이메일</div>
					<div class="mail_input_box">
						<input class="mail_input" name="memMail">
						<!--  
						<select class="mail_box" id="domain-list">
						  <option value="naver.com">naver.com</option>
						  <option value="google.com">google.com</option>
						  <option value="hanmail.net">hanmail.net</option>
						  <option value="nate.com">nate.com</option>
						  <option value="kakao.com">kakao.com</option>
						</select>
						-->
					</div>
					<span class="final_mail_ck">이메일을 입력해주세요.</span>
					<sapn class="mail_input_box_warn"></sapn>
					<div class="mail_check_wrap">
						<div class="mail_check_input_box" id="mail_check_input_box_false">
							<input class="mail_check_input" disabled="disabled">
						</div>
						<div class="mail_check_button">
							<span>인증번호 전송</span>
						</div>
						<div class="clearfix"></div>
						<span id="mail_check_input_box_warn" />
					</div>
				<div class="phone_wrap">
					<div class="user_phone">연락처</div>
					<div class="phone_input_box">
						<input class="phone_input" name="memPhone">
					</div>
					<span class="final_phone_ck">연락처를 입력해주세요.</span> 	
					
				</div>
				<div class="emerphone_wrap">
					<div class="user_emerphone">비상연락처</div>
					<div class="emerphone_input_box">
						<input class="emerphone_input" name="memEmerPhone">
					</div>
					<span class="final_emerphone_ck">비상연락처를 입력해주세요.</span>
				</div>
				<div class="address_wrap">
					<div class="address_name">주소</div>
					<div class="address_input_1_wrap">
						<div class="address_input_1_box">
							<input class="address_input_1" name="memAddr1" readonly="readonly">
						</div>
						<div class="address_button" onclick="execution_daum_address()">
							<span>주소 찾기</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="address_input_2_wrap">
						<div class="address_input_2_box">
							<input class="address_input_2" name="memAddr2" readonly="readonly">
						</div>
					</div>
					<div class="address_input_3_wrap">
						<div class="address_input_3_box">
							<input class="address_input_3" name="memAddr3" readonly="readonly">
						</div>
					</div>
					<span class="final_addr_ck">주소를 입력해주세요.</span>
				</div>
				<div class="join_button_wrap">
					<input type="button" class="join_button" value="가입하기">
				</div>
			</div>
		</form>
	</div>
	</main>
	
	<!-- 푸터 영역 포함 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script>
	// 인증번호 저장
	var code = ""; //이메일 전송 인증번호 저장위한 코드 
	
	/* 유효성 검사 통과유무 변수 */	
	 var idCheck = false;            
	 var idckCheck = false;            
	 var pwCheck = false;            
	 var pwckCheck = false;            
	 var pwckcorCheck = false;        
	 var nameCheck = false;            
	 var mailCheck = false;            
	 var mailnumCheck = false;        
	 var addressCheck = false 
	
	$(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
		$(".join_button").click(function(){
			//$("#join_form").attr("action", "/member/join");
			//$("#join_form").submit();
			
			//입력란 변수
			var id = $('.id_input').val();                 
	        var pw = $('.pw_input').val();                
	        var pwck = $('.pwck_input').val();            
	        var name = $('.user_input').val();            
	        var mail = $('.mail_input').val();            
	        var addr = $('.address_input_3').val(); 
	        
	      //아이디 유효성검사 //
	        if(id == ""){
	            $('.final_id_ck').css('display','block');
	            idCheck = false;
	        }else{
	            $('.final_id_ck').css('display', 'none');
	            idCheck = true;
	        }
	      
	     // 비밀번호 유효성 검사
	    	if(pw == ""){
	        	$('.final_pw_ck').css('display','block');
	            pwCheck = false;
	        }else{
	            $('.final_pw_ck').css('display', 'none');
	            pwCheck = true;
	         }
	     
	    // 비밀번호 확인 유효성 검사
	    	if(pwck == ""){
	            $('.final_pwck_ck').css('display','block');
	            pwckCheck = false;
	        }else{
	        	$('.final_pwck_ck').css('display', 'none');
	            pwckCheck = true;
	        }
	    
	    //이름 유효성 검사 //
	        if(name == ""){
	            $('.final_name_ck').css('display','block');
	            nameCheck = false;
	        }else{
	            $('.final_name_ck').css('display', 'none');
	            nameCheck = true;
	        }
	    
	    //이메일 유효성 검사 //
	        if(mail == ""){
	            $('.final_mail_ck').css('display','block');
	            mailCheck = false;
	        }else{
	            $('.final_mail_ck').css('display', 'none');
	            mailCheck = true;
	        }
	        // 주소 유효성 검사 //
	        if(addr == ""){
	            $('.final_addr_ck').css('display','block');
	            addressCheck = false;
	        }else{
	            $('.final_addr_ck').css('display', 'none');
	            addressCheck = true;
	        }
	        
	       // 최종 유효성 검사 //
	       if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&addressCheck ){
	        	$("#join_form").attr("action", "/member/join");
	    		$("#join_form").submit();
	       }  
	        
	        return false;
	    
		});
	});
	
	//아이디 중복 검사
	$('.id_input').on("propertychange change keyup paste input",function(){
		console.log("아이디중복검사테스트")
		
		var memId = $('.id_input').val();
		var data = {memId : memId}
		
		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			success : function(result){
				//console.log("성공여부" + result);
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");
					//아이디 중복이 없는 경우
					idckCheck = true;			
				}else{
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");
					//아이디 중복된 경우
					idckCheck = false;
				}				
			}//success 종료
		}); //ajax 종료
	}); //function 종료
     
	
	
	
	 /*
	$(document).ready(function(){
		
		$(".join_button").click(function(){
			
		    var year = $('.birth-year').val();
		    var month = $('.birth-month').val();
		    var day = $('.birth-day').val();

		    var birthDate = '${year}-${month}-${day}';
		    birthDate.val(birthDate);			
			
			
	        
	        
	     	
	    	
	    
		});
	});
	*/		
	
	
	// 입력 이메일 형식 유효성 검사 //
	 function mailFormCheck(email){
	    var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	    return form.test(email);
	}
	 
	
	// 인증번호 이메일 전송 //
	$(".mail_check_button").click(function(){
	    
	    var email = $(".mail_input").val();        // 입력한 이메일
	    var checkBox = $(".mail_check_input");
	    var boxWrap = $(".mail_check_input_box");  
	    var warnMsg = $(".mail_input_box_warn");
	    
	    
	    //이메일 형식 유효성 검사 //
	    if(mailFormCheck(email)){
	        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
	        warnMsg.css("display", "inline-block");
	    } else {
	        warnMsg.html("올바르지 못한 이메일 형식입니다.");
	        warnMsg.css("display", "inline-block");
	        return false;
	    }
	    
	    
	    $.ajax({
	        
	        type:"GET",
	        url:"mailCheck?email=" + email,
	        success : function(data){
	        	// console.log("data : " +data);
	        	checkBox.attr("disabled", false);
	        	boxWrap.attr("id", "mail_check_input_box_true");
	        	code = data;
	        }
	                
	    });
	    
	});
	// 인증번호 비교 //
	$(".mail_check_input").blur(function(){
	    
	    var inputCode = $(".mail_check_input").val();        // 입력코드    
	    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과    
	    
	    if(inputCode == code){                            // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");
	        mailnumCheck = true; 
	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	        mailnumCheck = false;
	    } 
	        
	});
	
	// 다음 주소 연동 //
	function execution_daum_address(){
	 
	    new daum.Postcode({
	        oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 주소변수 문자열과 참고항목 문자열 합치기
                    addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address_input_1").val(data.zonecode);
            	//$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            	$(".address_input_2").val(addr);
            	//$("[name=memberAddr2]").val(addr);            // 대체가능
                // 커서를 상세주소 필드로 이동한다.
            	$(".address_input_3").attr("readonly",false);
                $(".address_input_3").focus();

	        	}
	    	}).open();    
	 
		}
	
	// 비밀번호 확인 일치 유효성 검사 //
	$('.pwck_input').on("propertychange change keyup paste input", function(){
		var pw = $('.pw_input').val();
	    var pwck = $('.pwck_input').val();
	    $('.final_pwck_ck').css('display', 'none'); 
	    
	    if(pw == pwck){
	        $('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
	    }else{
	        $('.pwck_input_re_1').css('display','none');
	        $('.pwck_input_re_2').css('display','block');
	        pwckcorCheck = false;
	    } 
	
	}); 
	 
	 /* 생년월일 */
/*
	 $(document).ready(function() {
	        // 현재 연도 구하기
	        var today = new Date();
	        var currentYear = today.getFullYear();

	        // 연도 옵션 추가
	        for (var year = currentYear; year >= 1900; year--) {
	            $('#birth-year').append(new Option(year, year));
	        }

	        // 월 옵션 추가
	        for (var month = 1; month <= 12; month++) {
	            $('#birth-month').append(new Option(month, month));
	        }

	        // 일 옵션 추가 (기본: 31일까지)
	        for (var day = 1; day <= 31; day++) {
	            $('#birth-day').append(new Option(day, day));
	        }

	        // 월 선택 시 일 옵션 변경
	        $('#birth-month').change(function() {
	            var selectedYear = $('#birth-year').val();
	            var selectedMonth = $('#birth-month').val();
	            $('#birth-day').empty().append('<option disabled selected>일</option>');

	            // 선택한 월의 마지막 날짜 구하기
	            if (selectedYear && selectedMonth) {
	                var lastDay = new Date(selectedYear, selectedMonth, 0).getDate();

	                for (var day = 1; day <= lastDay; day++) {
	                    $('#birth-day').append(new Option(day, day));
	                }
	            }
	        });

	        // 연도 선택 시 일 옵션 변경 (윤년 체크)
	        $('#birth-year').change(function() {
	            $('#birth-month').trigger('change');
	        });
	    }); 
	 */
	</script>

</body>
</html>