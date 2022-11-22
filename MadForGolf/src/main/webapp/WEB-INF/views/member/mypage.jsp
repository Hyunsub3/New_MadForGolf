<%@page import="com.madforgolf.persistence.MemberDAO"%>
<%@page import="com.madforgolf.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../include/header.jsp" %>
 	<!-- session값이 없을 경우 login 페이지 이동 -->
 	<c:if test="${user_id == null }">
		<c:redirect url="/member/login"/>
	</c:if>
	
<style type="text/css">

.container{
	display:grid;
}

.score1{
	font-size: 30px;
	border-bottom: 2px solid #91C788;
}

.manner{
	color:#91C788;
}

/* .score{
	color:#FEFFDE;
} */


/* 	 skill bar style */

    .zt-skill-bar {
        color: #52734D;
        font-size: 15px;
        line-height: 30px;
        height: 30px;
        margin-bottom: 5px;
        background-color: rgba(0,0,0,0.1);
        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
            -ms-border-radius: 2px;
                border-radius: 2px;
    }
    .zt-skill-bar * {
        webkit-transition: all 0.5s ease;
          -moz-transition: all 0.5s ease;
           -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
               transition: all 0.5s ease;
    }
    .zt-skill-bar div {
        background-color: #91C788;
        position: relative;
        padding-left: 7px;
        width: 0;
        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
           -ms- border-radius: 2px;
                border-radius: 2px;
    }
    .zt-skill-bar span {
        display: block;
        position: absolute;
        right: 0;
        top: 0;
        height: 100%;
        padding: 0 5px 0 10px;
        background-color: #DEDEDE;
        -webkit-border-radius: 0 2px 2px 0;
           -moz-border-radius: 0 2px 2px 0;
            -ms-border-radius: 0 2px 2px 0;
                border-radius: 0 2px 2px 0;
    }
    .zt-skill-bar span:before {
        content: "";
        position: absolute;
        width: 6px;
        height: 6px;
        top: 50%;
        left: -3px;
        margin-top: -3px;
        background-color: #DEDEDE;
        -webkit-transform: rotate(45deg);
           -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
                transform: rotate(45deg);
    }

</style>


    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${pageContext.request.contextPath }/resources/img/bg-img/shiny-golf-clubs-arranged-on-the-green-grassy-field-4409204.jpg);">
            <h2>MyPage</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">MyPage</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### About Area Start ##### -->
    <!-- 본문 -->

    <section class="about-us-area">
        <div class="container">
            <!-- <div class="row justify-content-between"> -->
                <div class="col-12 col-lg-12">
                    <!-- Section Heading -->
                    <div class="row">
	                    <div class="section-heading col-12 col-lg-12">
	                        <h2>${user_name } 님의 마이페이지</h2><br><br><br>
							<!-- 매너스코어 -->
							<div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
								<div class="cf-icon">
									<img src="/resources/img/core-img/cf3.png" alt=""> 
								
								</div>
								
								<div class="text">
								
								<div class="score1">
									<c:set var="score" scope="session" value="${loginVO.score }" />
								  	<c:out value="${user_name }"/>님의 매너 점수는
								  	
								  	<c:choose>
								  		<c:when test="${score <=20 }">
								  			"파"입니다.
								  		</c:when>
								  		<c:when test="${score <=40 }">
								  			"버디"입니다.
								  		</c:when>
								  		<c:when test="${score <=60 }">
								  			"이글"입니다.
								  		</c:when>
								  		<c:when test="${score <=80 }">
								  			"알바트로스"입니다.
								  		</c:when>
								  		<c:when test="${score <=100 }">
								  			"홀인원"입니다.
								  		</c:when>
								  	</c:choose>
								  	
								</div>
								
								<!-- 막대 그래프 -->
	                        <div class="zt-span6 last">
	                        <br><br>
								<h4><span class="manner"><strong>매너점수 등급 구분</strong></span></h4>
									<div class="zt-skill-bar"><div data-width="20" style="">파<span>0~20p</span></div></div>
									<div class="zt-skill-bar"><div data-width="40" style="">버디<span>21~40p</span></div></div>
									<div class="zt-skill-bar"><div data-width="60" style=";">이글<span>41~60p</span></div></div>
									<div class="zt-skill-bar"><div data-width="80" style=";">알바트로스<span>61~80p</span></div></div>
									<div class="zt-skill-bar"><div data-width="100" style=";">홀인원<span>81~100p</span></div></div>
							</div>
								
<!-- 									<p style="text-align: center;"> 점수구분 : 파 0~20, 버디 21~40, 이글 41~60, 알바트로스 61~80, 홀인원 81~100</p> -->
								</div>
								
			 				</div>
							<!-- 매너스코어 -->
						</div>
						</div>
					
                        <br>
                    <!-- <button type="button" class="btn alazea-btn w-80" onClick="location.href='#'">채팅목록</button> <br>
                    <button type="button" class="btn alazea-btn w-80" onClick="location.href='#'">지역인증</button> <br>
                    <button type="button" class="btn alazea-btn w-80" onClick="location.href='#'">내가 쓴 리뷰</button> <br>
                    <button type="button" class="btn alazea-btn w-80" onClick="location.href='/product/productInsert'">상품등록</button> <br>
                    </div> -->

                <div class="col-20 col-lg-20">
                    <div class="alazea-benefits-area">
                        <div class="row">
                            <!-- 회원 정보 수정 -->
                            <div class="col-md-6 mb-4">
<!--                            <div class="col-13 col-sm-6 col-lg-3"> -->
                                <div class="single-benefits-area" onClick="location.href='/member/update'">
                                    <a href="/member/update"><img src="${pageContext.request.contextPath }/resources/img/core-img/b1.png" alt=""></a>
                                     <a href="/member/update"><h5>회원정보수정</h5></a>
                                     <a href="/member/update"><p>회원정보를 관리하는 공간입니다. </p></a>
                                </div>
                            </div>

                            <!-- 매너 스코어 -->
                        <div class="col-md-6 mb-4">
                                <div class="single-benefits-area" onClick="location.href='/mypage/mannerScore'">
                                    <a href="/mypage/mannerScore"><img src="${pageContext.request.contextPath }/resources/img/core-img/b2.png" alt=""></a>
                                     <a href="/mypage/mannerScore"><h5>매너스코어</h5></a>
                                     <a href="/mypage/mannerScore"><p>나의 매너스코어와 나에게 쓴 리뷰 내역을 확인할 수 있는 공간입니다. </p></a>
                                </div>
                            </div>
                            
                            <!-- 가계부 -->
                        <div class="col-md-6 mb-4">
                                <div class="single-benefits-area" onClick="location.href='/mypage/accountbookMonth'">
                                    <a href="/mypage/accountbookMonth"><img src="${pageContext.request.contextPath }/resources/img/core-img/b3.png" alt=""></a>
                                    <a href="/mypage/accountbookMonth"><h5>골프 지갑</h5></a>
                                    <a href="/mypage/accountbookMonth"><p>월 별 구매, 판매 내역을 확인할 수 있는 공간입니다.</p></a>
                                </div>
                            </div>

                            <!-- 거래 목록 -->
                         <div class="col-md-6 mb-4">
                                <div class="single-benefits-area" onClick="location.href='/product/listProductAll'">
                                    <a href="/product/listProductAll"><img src="${pageContext.request.contextPath }/resources/img/core-img/b4.png" alt=""></a>
                                    <a href="/product/listProductAll"><h5>거래 목록</h5></a>
                                    <a href="/product/listProductAll"><p>판매내역 및 구매내역을 확인할 수 있는 공간입니다. </p></a>
                                </div>
                            </div>
                            
                            <!-- 찜 목록 -->
                         <div class="col-md-6 mb-4">
                                <div class="single-benefits-area" onClick="location.href='/mypage/likeListAll'">
                                    <a href="/mypage/likeListAll"><img src="${pageContext.request.contextPath }/resources/img/core-img/b1.png" alt=""></a>
                                     <a href="/mypage/likeListAll"><h5>찜 목록</h5></a>
                                     <a href="/mypage/likeListAll"><p>내가 찜한 상품을 확인할 수 있는 공간입니다. </p></a>
                                </div>
                            </div>
                            
                            <!-- 채팅 목록 -->
                           <div class="col-md-6 mb-4">
                                <div class="single-benefits-area" onClick="location.href='/product/chattingList'">
                                    <a href="/product/chattingList"><img src="${pageContext.request.contextPath }/resources/img/core-img/b2.png" alt=""></a>
                                     <a href="/product/chattingList"><h5>채팅 목록</h5></a>
                                     <a href="/product/chattingList"><p>나의 채팅 목록을 확인할 수 있는 공간입니다. </p></a>
                                </div>
                            </div>
                            
                            
                            <!-- 지역 인증 -->
                         <div class="col-md-6 mb-4">
                                <div class="single-benefits-area" onClick="location.href='/member/address'">
                                    <a href="/member/address"><img src="${pageContext.request.contextPath }/resources/img/core-img/b3.png" alt=""></a>
                                     <a href="/member/address"><h5>지역 인증</h5></a>
                                     <a href="/member/address"><p>나의 지역을 인증할 수 있는 공간입니다. </p></a>
                                </div>
                            </div>
                            
                            <!-- 상품 등록 -->
                           <div class="col-md-6 mb-4">
                                <div class="single-benefits-area" onClick="location.href='/product/productInsert'">
                                    <a href="/product/productInsert"><img src="${pageContext.request.contextPath }/resources/img/core-img/b4.png" alt=""></a>
                                     <a href="/product/productInsert"><h5>상품 등록</h5></a>
                                     <a href="/product/productInsert"><p>상품을 등록할 수 있는 공간입니다. </p></a>
                                </div>
                            </div>
                            
                            <!-- 회원 탈퇴 -->
                           <div class="col-md-6 mb-4">
                                <div class="single-benefits-area" onClick="location.href='/member/delete'">
                                    <a href="/member/delete"><img src="${pageContext.request.contextPath }/resources/img/core-img/b1.png" alt=""></a>
                                     <a href="/member/delete"><h5>회원 탈퇴</h5></a>
                                     <a href="/member/delete"><p>정말 탈퇴하시겠습니까? </p></a>
                                </div>
                            </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
  
        
        
        
        
<!-- ##################################Out Service Start ####################################### -->
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="border-line"></div>
                </div>
            </div>
        </div>
    </section>
    
    
    
    
    <section class="our-services-area bg-gray section-padding-100-0">
        <div class="container">
            <div class="row">



	<!-- 서비스 소개 -->
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                        <h2>OUR SERVICES</h2>
                        <p>We provide the perfect service for you.</p>
                    </div>
                </div>

                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
                        <!-- Icon -->
						 <div class="service-icon mr-30">
						 <img src="${pageContext.request.contextPath }/resources/icon/golf-bag.png" style="width:60pt;height:50pt; alt="">
						 </div>
                         <div class="service-content">
                            <h5>Golf Club Trade</h5>
                            <h6>전국 골프용품<br>중고마켓 1위</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
                        <!-- Icon -->
						 <div class="service-icon mr-30">
						  <img src="${pageContext.request.contextPath }/resources/icon/golf-course.png" style="width:60pt;height:50pt; alt="">
						 </div>
                         <div class="service-content">
                            <h5>Community</h5>
                            <h6>지역 기반 골프<br>커뮤니티</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
                        <!-- Icon -->
						 <div class="service-icon mr-30">
						 <img src="${pageContext.request.contextPath }/resources/icon/annual-report.png" style="width:60pt;height:50pt; alt="">
						 </div>
                         <div class="service-content">
                            <h5>Golf Wallet</h5>
                            <h6>월별 거래 현황을 한 눈에</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
                        <!-- Icon -->
						 <div class="service-icon mr-30">
						 <img src="${pageContext.request.contextPath }/resources/icon/technical-support.png" style="width:60pt;height:50pt; alt="">
						 </div>
                         <div class="service-content">
                            <h5>F&Q</h5>
                            <h6>상담원 실시간<br>응답 서비스</h6>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- Side Image -->
        <div class="side-img wow fadeInUp" data-wow-delay="500ms" style="visibility: visible; animation-delay: 500ms; animation-name: fadeInUp;">
            <img src="img/core-img/pot.png" alt="">
        </div>
    </section>
    
    
    
    
  

       
    <!-- ##### Service Area End ##### -->
    <!-- 서비스 소개 -->
    
    <script>

	(function( $ ) {
	    "use strict";
	    $(function() {
	        function animated_contents() {
	            $(".zt-skill-bar > div ").each(function (i) {
	                var $this  = $(this),
	                    skills = $this.data('width');
	                $this.css({'width' : skills + '%'});
	            });
	        }
	       
	        if(jQuery().appear) {
	            $('.zt-skill-bar').appear().on('appear', function() {
	                animated_contents();
	            });
	        } else {
	            animated_contents();
	        }
	    });
	}(jQuery));
   
    </script>

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${pageContext.request.contextPath }/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath }/resources/js/active.js"></script>



<%@ include file="../include/footer.jsp" %>