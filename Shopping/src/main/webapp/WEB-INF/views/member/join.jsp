<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f5f5dc; /* 베이지 배경색 */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .wrapper {
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .wrap {
        width: 700px;
        padding: 20px;
        background: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: #e0f7e9; /* 회원가입 창 배경색 */
        border: 2px solid #28a745; /* 녹색 테두리 */
    }

    .subjecet {
        width: 100%;
        text-align: center;
        margin-bottom: 20px;
    }
    .subjecet span {
        font-size: 32px;
        font-weight: 700;
        color: #28a745; /* 녹색 텍스트 */
    }

    /* 공통 입력 영역 스타일 */
    .input_wrap {
        width: 100%;
        margin-bottom: 20px;
    }
    .input_name {
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 5px;
        color: #28a745; /* 녹색 텍스트 */
    }
    .input_box {
        border: 1px solid #ddd;
        height: 40px;
        padding: 8px;
        border-radius: 5px;
        background-color: #f8fff9; /* 연한 녹색 배경 */
        display: flex;
        align-items: center;
        flex-grow: 1;
        margin-bottom: 10px; /* 입력 박스 간격 */
    }
    .input {
        width: 100%;
        height: 100%;
        border: none;
        font-size: 14px;
        background: transparent;
        outline: none;
    }

    .id_input_re_1, .id_input_re_2, .final_id_ck,
    .final_pw_ck, .final_pwck_ck, .final_name_ck, 
    .final_mail_ck, .final_addr_ck {
        font-size: 12px;
        color: red;
        display: none;
        margin-top: 5px;
    }

    /* 중복 아이디 검사 */
    .id_input_re_1 {
        color: green;
        display: none;
    }
    .id_input_re_2 {
        color: red;
        display: none;
    }

    /* 인증번호 확인 */
    .correct {
        color: green;
    }
    .incorrect {
        color: red;
    }

    /* 중복 확인 버튼 */
    .check_button {
        border: 1px solid #28a745; /* 녹색 테두리 */
        height: 40px;
        padding: 0 20px;
        margin-top: 5px;
        text-align: center;
        font-size: 14px;
        font-weight: 600;
        background-color: #28a745; /* 녹색 배경 */
        color: white;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;
        display: flex;
        justify-content: center; /* 수평 가운데 정렬 */
        align-items: center; /* 수직 가운데 정렬 */
    }
    .check_button:hover {
        background-color: #218838;
    }

    /* 비밀번호 확인 일치 유효성 검사 */
    .pwck_input_re_1 {
        color: green;
        display: none;
    }
    .pwck_input_re_2 {
        color: red;
        display: none;
    }

    /* 가입하기 버튼 */
    .join_button_wrap {
        margin-top: 2px;
        width: 100%;
    }
    .join_button {
        width: 100%;
        height: 50px;
        background-color: #28a745; /* 녹색 배경 */
        font-size: 16px;
        font-weight: 600;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        display: flex;
        justify-content: center; /* 수평 가운데 정렬 */
        align-items: center; /* 수직 가운데 정렬 */
    }
    .join_button:hover {
        background-color: #218838;
    }

    /* float 속성 해제 */
    .clearfix {
        clear: both;
    }

    /* 주소 찾기 버튼 */
    .address_input_with_button {
        display: flex;
        align-items: center;
    }
    .address_button {
        border: 1px solid #28a745; /* 녹색 테두리 */
        height: 40px;
        padding: 0 20px;
        margin-left: 10px;
        text-align: center;
        font-size: 14px;
        font-weight: 600;
        background-color: #28a745; /* 녹색 배경 */
        color: white;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;
        display: flex;
        justify-content: center; /* 수평 가운데 정렬 */
        align-items: center; /* 수직 가운데 정렬 */
    }
    .address_button:hover {
        background-color: #218838;
    }

    /* 이메일 인증 영역 */
    .mail_check_wrap {
        display: flex;
        align-items: center;
        margin-top: 10px;
    }
    .mail_check_input_box {
        flex-grow: 1;
        margin-right: 10px;
        position: relative;
    }
    #mail_check_input_box_false {
        background-color: #ebebe4;
    }
    #mail_check_input_box_true {
        background-color: #ffffff;
    }
    .mail_check_input {
        width: 100%;
        height: 100%;
        border: none;
        font-size: 14px;
        background: transparent;
        outline: none;
        padding: 10px;
        border-radius: 5px;
    }
    #mail_check_input_box_warn {
        font-size: 12px;
        color: red;
        display: block;
        margin-top: 5px;
    }

    .mail_input_box_warn {
        font-size: 12px;
        color: red;
        display: none;
    }
</style>
</head>
<body>

<div class="wrapper">
    <form id="join_form" method="post">
    <div class="wrap">
            <div class="subjecet">
                <span>회원가입</span>
            </div>
            <div class="id_wrap input_wrap">
                <div class="input_name">아이디</div>
                <div class="id_input_box input_box">
                    <input class="id_input input" name="memberId">
                </div>
                <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
                <span class="id_input_re_2">아이디가 이미 존재합니다.</span>    
                <span class="final_id_ck">아이디를 입력해주세요.</span>            
            </div>
            <div class="pw_wrap input_wrap">
                <div class="input_name">비밀번호</div>
                <div class="pw_input_box input_box">
                    <input class="pw_input input" name="memberPw">
                </div>
                <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
            </div>
            <div class="pwck_wrap input_wrap">
                <div class="input_name">비밀번호 확인</div>
                <div class="pwck_input_box input_box">
                    <input class="pwck_input input">
                </div>
                <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
                <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
            </div>
            <div class="user_wrap input_wrap">
                <div class="input_name">이름</div>
                <div class="input_box">
                    <input class="user_input input" name="memberName">
                </div>
                <span class="final_name_ck">이름을 입력해주세요.</span>
            </div>
            <div class="mail_wrap input_wrap">
                <div class="input_name">이메일</div> 
                <div class="input_box">
                    <input class="mail_input input" name="memberMail">
                </div>
                <span class="final_mail_ck">이메일을 입력해주세요.</span>
                <span class="mail_input_box_warn"></span>
                <div class="mail_check_wrap">
                    <div class="mail_check_input_box" id="mail_check_input_box_false">
                        <input class="mail_check_input" disabled="disabled">
                    </div>
                    <div class="check_button mail_check_button">
                        <span>인증번호 전송</span>
                    </div>
                    <div class="clearfix"></div>
                    <span id="mail_check_input_box_warn"></span>
                </div>
            </div>
            <div class="address_wrap input_wrap">
                <div class="input_name">주소</div>
                <div class="address_input_with_button">
                    <div class="input_box">
                        <input class="address_input_1 input" name="memberAddr1" readonly="readonly">
                    </div>
                    <div class="address_button" onclick="execution_daum_address()">
                        <span>주소 찾기</span>
                    </div>
                </div>
                <div class="input_box">
                    <input class="address_input_2 input" name="memberAddr2" readonly="readonly">
                </div>
                <div class="input_box">
                    <input class="address_input_3 input" name="memberAddr3" readonly="readonly">
                </div>
                <span class="final_addr_ck">주소를 입력해주세요.</span>
            </div>
            <div class="join_button_wrap">
                <input type="button" class="join_button" value="가입하기">
            </div>
        </div>
    </form>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

var code = "";                //이메일전송 인증번호 저장위한 코드

 /* 유효성 검사 통과유무 변수 */
 var idCheck = false;            // 아이디
 var idckCheck = false;            // 아이디 중복 검사
 var pwCheck = false;            // 비번
 var pwckCheck = false;            // 비번 확인
 var pwckcorCheck = false;        // 비번 확인 일치 확인
 var nameCheck = false;            // 이름
 var mailCheck = false;            // 이메일
 var mailnumCheck = false;        // 이메일 인증번호 확인
 var addressCheck = false         // 주소

$(document).ready(function(){
    //회원가입 버튼(회원가입 기능 작동)
    $(".join_button").click(function(){
        
        /* 입력값 변수 */
        var id = $('.id_input').val();                 // id 입력란
        var pw = $('.pw_input').val();                // 비밀번호 입력란
        var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
        var name = $('.user_input').val();            // 이름 입력란
        var mail = $('.mail_input').val();            // 이메일 입력란
        var addr = $('.address_input_3').val();        // 주소 입력란
        
        /* 아이디 유효성검사 */
        if(id == ""){
            $('.final_id_ck').css('display','block');
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
        
        /* 비밀번호 확인 유효성 검사 */
        if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
        
        /* 이름 유효성 검사 */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }        
        
        /* 이메일 유효성 검사 */
        if(mail == ""){
            $('.final_mail_ck').css('display','block');
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            mailCheck = true;
        }        
        
        /* 주소 유효성 검사 */
        if(addr == ""){
            $('.final_addr_ck').css('display','block');
            addressCheck = false;
        }else{
            $('.final_addr_ck').css('display', 'none');
            addressCheck = true;
        }        
        
        /* 최종 유효성 검사 */
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&addressCheck ){

            $("#join_form").attr("action", "/member/join");
            $("#join_form").submit();            
            
        }        
        
        return false;

    });
});

//아이디 중복검사
$('.id_input').on("propertychange change keyup paste input", function(){

    /* console.log("keyup 테스트"); */
    
    var memberId = $('.id_input').val();            // .id_input에 입력되는 값
    var data = {memberId : memberId}                // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
    
    $.ajax({
        type : "post",
        url : "/member/memberIdChk",
        data : data,
        success : function(result){
            // console.log("성공 여부" + result);
            if(result != 'fail'){
                $('.id_input_re_1').css("display","inline-block");
                $('.id_input_re_2').css("display", "none");    
                idckCheck = true;
            } else {
                $('.id_input_re_2').css("display","inline-block");
                $('.id_input_re_1').css("display", "none");
                idckCheck = false;
            }    
        }// success 종료
    }); // ajax 종료    

});// function 종료

/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
    
    var email = $(".mail_input").val();            // 입력한 이메일
    var cehckBox = $(".mail_check_input");        // 인증번호 입력란
    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
    var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
    
    /* 이메일 형식 유효성 검사 */
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
        success:function(data){
            
            //console.log("data : " + data);
            cehckBox.attr("disabled",false);
            boxWrap.attr("id", "mail_check_input_box_true");
            code = data;
            
        }
                
    });
    
});

/* 인증번호 비교 */
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

/* 다음 주소 연동 */
function execution_daum_address(){
    
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            
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
            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
            $(".address_input_3").attr("readonly",false);
            $(".address_input_3").focus();
            
        }
    }).open();   
    
}

/* 비밀번호 확인 일치 유효성 검사 */

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


 /* 입력 이메일 형식 유효성 검사 */
 function mailFormCheck(email){
    var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return form.test(email);
}

</script>

</body>
</html>
