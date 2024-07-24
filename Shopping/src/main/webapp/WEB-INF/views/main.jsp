<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>  
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Roboto', sans-serif;
    background-color: #f5f5dc; /* 베이지 배경색 */
}

.wrapper {
    width: 100%;
    max-width: 1080px;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    min-height: 100vh;
    padding: 20px;
}

.wrap {
    width: 1080px;
    padding: 20px;
    background: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    background-color: #e0f7e9; /* 배경색 */
    border: 2px solid #28a745; /* 녹색 테두리 */
    flex: 1;
}

.top_gnb_area {
    width: 100%;
    height: 50px;
    background-color: #f0f0f1;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    padding: 0 20px;
    border-bottom: 2px solid #28a745;
}

.top_gnb_area .list {
    display: flex;
    gap: 15px;
}

.top_gnb_area .list li {
    list-style: none;
    font-weight: 700;
}

.top_area {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 0;
}

.logo_area img {
    height: 150px; /* 로고 이미지 높이 조정 */
    width: auto; /* 너비 자동 조정 */
}

.search_area {
    flex-grow: 1;
    display: flex;
    justify-content: center;
    align-items: center;
}

.search_wrap {
    width: 100%;
    max-width: 500px;
    display: flex;
    gap: 10px;
    justify-content: center; /* 검색 영역 가운데 정렬 */
}

.search_wrap select, .search_wrap input, .search_wrap button {
    height: 40px;
    padding: 0 10px;
    border: 1px solid #ced4da;
    border-radius: 5px;
}

.search_wrap button {
    background-color: #28a745;
    color: white;
    font-weight: 600;
    cursor: pointer;
    transition: background-color 0.3s;
}

.search_wrap button:hover {
    background-color: #218838;
}

.login_area {
    display: flex;
    align-items: center;
    gap: 15px;
}

.login_button {
    padding: 10px 20px;
    background-color: #28a745;
    color: white;
    font-weight: 600;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.login_button:hover {
    background-color: #218838;
}

.login_success_area span {
    display: block;
}

.navi_bar_area {
    display: flex;
    gap: 20px;
    padding: 10px 0;
    border-top: 2px solid #28a745;
    border-bottom: 2px solid #28a745;
}

.dropdown {
    position: relative;
}

.dropbtn {
    padding: 10px 20px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: 600;
    transition: background-color 0.3s;
}

.dropbtn:hover {
    background-color: #218838;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    z-index: 1;
}

.dropdown-content a {
    padding: 12px 16px;
    display: block;
    text-decoration: none;
    color: black;
}

.dropdown-content a:hover {
    background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.content_area {
    padding: 20px 0;
    flex: 1;
}

.slide_div {
    display: flex;
    justify-content: center;
    align-items: center;
}

.slide_div div {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%; /* 필요에 따라 조정 */
}

.slide_div img {
    max-width: 100%; /* 이미지가 박스를 넘지 않도록 설정 */
    height: auto;
    display: block;
    margin: 0 auto; /* 이미지 가운데 정렬 */
}

.slide_div_wrap {
    margin-bottom: 30px;
    display: flex;
    justify-content: center; /* 슬라이드 전체를 가운데 정렬 */
}

.ls_wrap {
    margin-bottom: 30px;
}

.ls_div_subject {
    font-size: 24px;
    font-weight: 700;
    color: #28a745;
    margin-bottom: 10px;
}

.ls_div_content_wrap {
    border: 1px solid #ced4da;
    border-radius: 5px;
    padding: 10px;
    background-color: #ffffff;
    transition: transform 0.3s;
}

.ls_div_content_wrap:hover {
    transform: scale(1.05);
}

.footer_nav {
    background-color: #28a745;
    padding: 10px 0;
    width: 100%;
    max-width: 1080px; /* wrap 및 footer와 동일한 크기 */
    margin: 0 auto; /* 가운데 정렬 */
    display: flex;
    justify-content: center;
    align-items: center;
    box-sizing: border-box; /* 테두리를 포함한 박스 크기 */
}

.footer_nav_container {
    width: 100%;
    max-width: 1080px; /* wrap 및 footer와 동일한 크기 */
    display: flex;
    justify-content: center;
    align-items: center;
}

.footer_nav_container ul {
    display: flex;
    justify-content: center;
    gap: 20px;
    list-style: none;
    margin: 0;
    padding: 0;
}

.footer_nav_container ul li {
    color: white;
    font-weight: 600;
    padding: 0 5px;
}


.footer {
    width: 1080px;
    padding: 20px;
    background: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    background-color: #e0f7e9; /* 배경색 */
    border: 2px solid #28a745; /* 녹색 테두리 */
    flex: 1;
}

.footer_container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
}

.footer_left {
    margin-right: auto; /* 왼쪽 정렬 */
}

.footer_left img {
    height: 100px;
}

.footer_right {
    font-size: 14px;
    text-align: center;
    flex-grow: 1; /* 텍스트 영역 확장 */
}

.clearfix {
    clear: both;
}
</style>
</head>
<body>
<div class="wrapper">
    <div class="wrap">
        <div class="top_gnb_area">
            <ul class="list">
                <c:if test = "${member == null}">    <!-- 로그인 x -->    
                    <li >
                        <a href="/member/login">로그인</a>
                    </li>
                    <li>
                        <a href="/member/join">회원가입</a>
                    </li>
                </c:if>
                <c:if test="${member != null }">    <!-- 로그인 o -->        
                    <c:if test="${member.adminCk == 1 }">    <!-- 관리자 계정 -->
                        <li><a href="/admin/main">관리자 페이지</a></li>
                    </c:if>                            
                    <li>
                        <a id="gnb_logout_button">로그아웃</a>
                    </li>
                    <li>
                        마이룸
                    </li>
                    <li>
                        <a href="/cart/${member.memberId}">장바구니</a>
                    </li>
                </c:if>                
                <li>
                    고객센터
                </li>            
            </ul>            
        </div>
        <div class="top_area">
            <!-- 로고영역 -->
            <div class="logo_area">
                <a href="/main"><img src="resources/img/mLogo.png"></a>
            </div>
            <div class="search_area">
                    <div class="search_wrap">
                        <form id="searchForm" action="/search" method="get">
                            <div class="search_input">
                                <select name="type">
                                    <option value="T">책 제목</option>
                                    <option value="A">작가</option>
                                </select>
                                <input type="text" name="keyword">
                                <button class='btn search_btn'>검색</button>                                
                            </div>
                        </form>
                    </div>
            </div>
            <div class="login_area">
                <!-- 로그인 하지 않은 상태 -->
                <c:if test = "${member == null }">
                    <div class="login_button"><a href="/member/login">로그인</a></div>
                    <span><a href="/member/join">회원가입</a></span>                
                </c:if>                
                <!-- 로그인한 상태 -->
                <c:if test="${ member != null }">
                    <div class="login_success_area">
                        <span>회원 : ${member.memberName}</span>
                        <span>충전금액 : <fmt:formatNumber value="${member.money }" pattern="\#,###.##"/></span>
                        <span>포인트 : <fmt:formatNumber value="${member.point }" pattern="#,###" /></span>
                        <a href="/member/logout.do">로그아웃</a>
                    </div>
                </c:if>
            </div>
            <div class="clearfix"></div>            
        </div>
        <div class="navi_bar_area">
            <div class="dropdown">
                <button class="dropbtn">국내 
                  <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <c:forEach items="${cate1}" var="cate"> 
                        <a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a>
                    </c:forEach>                            
                </div>            
            </div>
            <div class="dropdown">
                <button class="dropbtn">국외 
                  <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <c:forEach items="${cate2}" var="cate"> 
                        <a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a>
                    </c:forEach>                            
                </div>            
            </div>
        </div>
        <div class="content_area">
            <div class="slide_div_wrap">
                <div class="slide_div">
                    <div>
                        <a>
                            <img src="../resources/img/images.jpg">
                        </a>
                    </div>
                    <div>
                        <a>
                            <img src="../resources/img/KakaoTalk.jpg">
                        </a>
                    </div>
                    <div>
                        <a>
                            <img src="../resources/img/IMG_6789.jpg">
                        </a>
                    </div>
                </div>    
            </div>
        </div>
                
        <div class="ls_wrap">
            <div class="ls_div_subject">
                평점순 상품
            </div>
            <div class="ls_div">
                <c:forEach items="${ls}" var="ls">
                    <a href="/goodsDetail/${ls.bookId}">
                        <div class="ls_div_content_wrap">
                            <div class="ls_div_content">
                                <div class="image_wrap" data-bookid="${ls.imageList[0].bookId}" data-path="${ls.imageList[0].uploadPath}" data-uuid="${ls.imageList[0].uuid}" data-filename="${ls.imageList[0].fileName}">
                                    <img>
                                </div>                
                                <div class="ls_category">
                                    ${ls.cateName}
                                </div>
                                <div class="ls_rating">
                                    ${ls.ratingAvg}
                                </div>
                                <div class="ls_bookName">
                                    ${ls.bookName}
                                </div>                            
                            </div>
                        </div>
                    </a>                    
                </c:forEach>                    
            </div>
        </div>            
    </div> <!-- wrap 끝 -->

    <div class="footer_nav">
    <div class="footer_nav_container">
        <ul>
            <li>회사소개</li>
            <span class="line">|</span>
            <li>이용약관</li>
            <span class="line">|</span>
            <li>고객센터</li>
            <span class="line">|</span>
            <li>광고문의</li>
            <span class="line">|</span>
            <li>채용정보</li>
            <span class="line">|</span>
        </ul>
    </div>
</div> <!-- class="footer_nav" -->

<div class="footer">
    <div class="footer_container">
        <div class="footer_left">
            <img src="resources/img/logo.png">
        </div>
        <div class="footer_right">
            (주) VamBook 대표이사 : 이나래
            <br>
            사업자등록번호 : 123-45-6789
            <br>
            대표전화 : 02)23-3425(발신자 부담전화)
            <br>
            <br>
            COPYRIGHT(C) <strong>kimvampa.tistory.com</strong> ALL RIGHTS RESERVED.
        </div>
    </div>
</div> <!-- class="footer" -->

</div> <!-- class="wrapper" -->

<script>
    $(document).ready(function(){
        $(".slide_div").slick({
            dots: true,
            autoplay: true,
            autoplaySpeed: 5000
        });    
        
        $(".ls_div").slick({
            slidesToShow: 4,
            slidesToScroll: 4,
            prevArrow: "<button type='button' class='ls_div_content_prev'>이전</button>", // 이전 화살표 모양 설정
            nextArrow: "<button type='button' class='ls_div_content_next'>다음</button>", // 다음 화살표 모양 설정    
        });        
        
        /* 이미지 삽입 */
        $(".image_wrap").each(function(i, obj){
            const bobj = $(obj);
            if(bobj.data("bookid")){
                const uploadPath = bobj.data("path");
                const uuid = bobj.data("uuid");
                const fileName = bobj.data("filename");
                const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
                $(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
            } else {
                $(this).find("img").attr('src', '/resources/img/goodsNoImage.png');
            }
        });            
    });

    /* gnb_area 로그아웃 버튼 작동 */
    $("#gnb_logout_button").click(function(){
        $.ajax({
            type: "POST",
            url: "/member/logout.do",
            success: function(data){
                alert("로그아웃 성공");
                document.location.reload();     
            } 
        }); // ajax 
    });
</script>
</body>
</html>
