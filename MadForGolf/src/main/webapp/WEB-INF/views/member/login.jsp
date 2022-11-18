<%@page import="com.madforgolf.persistence.MemberDAO"%>
<%@page import="com.madforgolf.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../include/header.jsp" %>

<style type="text/css">
.loginButton{
	display:grid;
	margin:0px auto;
}

@media only screen and (max-width: 767px){
	.container {
	width:70%;
	}
}
</style>

<!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${pageContext.request.contextPath }/resources/img/bg-img/tree-3127803.jpg);">
            <h2>Login</h2>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Login</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
<!-- ##### Breadcrumb Area End ##### --> 

   <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	
	// 아이디 틀렸을 경우
    $(document).ready(function() {
       //alert('팝업!');
       $('#login').submit(function(){
	//	alert("테스트");
	//	alert($('#loginid').val());
       if ($('#loginid').val()=="") {
          alert('입력하신 정보가 틀립니다.');
          return false;
          }

    // 비밀번호 틀렸을 경우
       if($('#loginpw').val()=="") {
          alert('입력하신 정보가 틀립니다.');
          return false;
          }
    
    // 아이디, 비밀번호 일치하는 경우
//     	if($('#loginid').val()==$('id'.val()) && $('#loginpw').val()==$('pw'.val() {
//     		alert('환영합니다!');
//     		return false;
//    			}
    	});
          });
		
	</script>
	
    
<!-- 본문 -->

       <!-- ##### Checkout Area Start ##### -->
    <div class="checkout_area mb-100">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-12 col-lg-7" style="margin: auto;">
                    <div class="checkout_details_area clearfix">
                        <h5>Login</h5>
                        <br><br>
                        <form action="/member/login" id="login" method="post">
                            <div class="row">
                               
                                <div class="col-md-6 mb-4">
                                
                                    <label for="first_name">ID</label>
                                    <input type="text" class="form-control" id="loginid" name="user_id" style="width:360pt;height:40pt; margin:auto;">
																		
                                    <label for="last_name">PW</label>
                                    <input type="password" class="form-control" id="loginpw" name="user_pw" style="width:360pt;height:40pt; margin:auto;">
                                	<br>
                                	
                                	<div class="loginButton">
                         			<button type="submit" class="idCheck btn alazea-btn w-80" id="login" value="N" style="width:360pt;height:40pt; margin:auto;">Login</button>
                         			<br><br><br><br>
                         			<!-- 카카오 로그인 -->
                         			<%-- <div>
										<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=a1e9c36223914cdc6e0edf2ff5f92f81&redirect_uri=http://localhost:8088/member/kakaoLogin&response_type=code">
										<img src="${pageContext.request.contextPath }/resources/icon/kakao_login_medium_wide.png" style="height:40px;margin:auto;">
								    </a>                           
                         			</div> --%>
                         			<!-- 네이버 -->
								    <a class="naverLogin" href="${naverURL }">
								  		 <img src="${pageContext.request.contextPath }/resources/icon/naverlogin.PNG" style="width:500pt;height:50pt;margin:auto;">
								  		 <br><br>
								    </a>
                         			 <!-- 카카오 -->
								    <a class="kakaoLogin" href="${kakaoURL }">
								  		 <img src="${pageContext.request.contextPath }/resources/icon/kakaologin.PNG" style="width:500pt;height:50pt;margin:auto;">
								    </a>
                                	</div>
                     		  	</div>
                     		  	
                     		  	<div>                     		  	
                     		  		<a class="action remind" href="${pageContext.request.contextPath }/member/findId"><span>Forgot Your ID?</span></a><br>
                     		  	</div>
                     		  	<div>
	                     		  	<a class="action remind" href="${pageContext.request.contextPath }/member/findPw"><span>　Forgot Your Password?</span></a><br>
                     		  	</div>
                        </div>
                        </form>
                        </div>
                        </div>
                        </div>
                        </div>
                        </div>
 
    <!-- ##### Checkout Area End ##### -->

    <!-- 본문 -->
    
    
    <%@ include file="../include/footer.jsp" %>