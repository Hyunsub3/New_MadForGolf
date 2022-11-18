<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->


    <!-- Title -->
    <title>Mad For Golf</title>

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath }/resources/img/core-img/golf_logo.png">




    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">
    
</head>

<body>
	
	

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">

        <!-- ***** Top Header Area ***** -->
        <div class="top-header-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="top-header-content d-flex align-items-center justify-content-between">
                            <!-- Top Header Content -->
                            <div class="top-header-meta">
                            <c:if test="${user_id != null }">
                                <a href="#" data-placement="bottom" title=""> <b id="user_id" >${sessionScope.user_name }</b>님 환영합니다.</a>
						        <a href="/member/logout"><i class="fa fa-user" aria-hidden="true"></i> <span>LogOut</span></a>         
                            </c:if>
                                
<!--                                 <a href="#" data-placement="bottom" title=""><i class="fa fa-phone" aria-hidden="true"></i> <span>Call Us: 051-803-0909</span></a> -->
                            </div>
		
							<!-- Top Header Content -->
                            <div class="top-header-meta d-flex">
                            
                            <!-- Login -->
                            <div class="login">
							    <!-- 로그인 X - 회원가입&로그인-->
								<c:if test="${user_id == null }">
	                               		<a href="/member/insert"><i class="fa fa-user" aria-hidden="true"></i> <span>Join</span></a>
							          	<a href="/member/login"><i class="fa fa-user" aria-hidden="true"></i> <span>Login</span></a>
							    </c:if>	
							    
							    <!-- 로그인 O - 마이페이지 -->
							    <c:if test="${user_id != null }">
							        <a href="/member/mypage"><i class="fa fa-user" aria-hidden="true"></i> <span>MyPage</span></a>
							    	<a href="/product/listProductAll?page=1"><i class="fa fa-user" aria-hidden="true"></i> <span>DealList</span></a>
							    </c:if>
							</div>
							    	
							
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <!-- ***** Navbar Area ***** -->
        <div class="alazea-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="alazeaNav">



<style>

	#header_title{
		color: white;
		padding-left: 10px;
		line-height: 1.4;
	}
	
	#logo_img{
		height: 30px;
	}
	
	#header_community{
		color: #C6EBC5;
	}
	
	#header_community:hover{
		color: #FA7070;
	}

</style>
                        <!-- Nav Brand -->
                        <a href="/" class="nav-brand"><img id="logo_img" src="${pageContext.request.contextPath }/resources/img/core-img/golf_logo.png" alt=""><span id="header_title">Mad For Golf</span></a>




                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler">
                            <span></span>
                            <span></span>
                            <span></span>
                            </span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

    
    
                            <!-- Navbar Start -->
                            <div class="classynav">
                                <ul>
<!--                                     <li><a href="/">Home</a></li> -->
<!--                                     <li><a href="#">About</a></li> -->
<!--                                     <li><a href="/product/listAll">Shop(Deal)</a> -->
<!--                                         <ul class="dropdown"> -->
                                            <li><a href="/product/listAll?category=Driver">Driver</a></li>
                                            <li><a href="/product/listAll?category=Iron">Iron</a></li>
                                            <li><a href="/product/listAll?category=Utility">Utility</a></li>
                                            <li><a href="/product/listAll?category=Wedge">Wedge</a></li>
<!-- 											<li><a href="/product/listAll?category=Putter">Putter</a></li> -->
<!-- 											<li><a href="/product/listAll?category=Etc">Etc</a></li> -->

                                            

<!--                                         </ul> -->
<!--                                     </li> -->
                                    <li><a href="/board/listBoardAll" id="header_community">Community</a></li>
                                </ul>




                            </div>
                            <!-- Navbar End -->
                        </div>
                    </nav>

                   
                    </div>
                </div>
            </div>
    </header>
     <!--##### Header Area End #####-->

	<!--챗봇 api-->
	<script>
	    var ht = null;
	    (function(id, scriptSrc, callback) {
	        var d = document,
	            tagName = 'script',
	            $script = d.createElement(tagName),
	            $element = d.getElementsByTagName(tagName)[0];
	
	        $script.id = id;
	        $script.async = true;
	        $script.src = scriptSrc;
	
	        if (callback) { $script.addEventListener('load', function (e) { callback(null, e); }, false); }
	        $element.parentNode.insertBefore($script, $element);
	    })('happytalkSDK', 'https://design.happytalkio.com/sdk/happytalk.chat.v2.min.js', function() {
	        ht = new Happytalk({
	          siteId: '1000226342',
	          siteName: 'madForGolf',
	          categoryId: '153106',
	          divisionId: '153107'
	      });
	    });
	</script>
	<!--챗봇 api-->
                  

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
	<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: block;"><i class="fa fa-angle-up"></i></a>
</body>

</html>
