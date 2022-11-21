<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#main-footer-area{
/* 	border : 5px solid red; */
	padding-top:10px;
}

.bottom{
/* 	border : 5px solid yellow; */
	padding: 5px;
}
#single-footer-widget{
/* 	border : 5px solid blue; */
	margin : 0px;
}

</style>
    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area bg-img" style="background-image: url(${pageContext.request.contextPath }/resources/img/bg-img/2.jpg);">
        <!-- Main Footer Area -->
        <div class="main-footer-area" id="main-footer-area">
            <div class="container">
                <div class="row">

                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-lg-3 bottom">
                        <div class="single-footer-widget">
                            <div class="footer-logo mb-30">
                                <a href="/member/main"><img src="${pageContext.request.contextPath }/resources/img/core-img/logo.png" alt=""></a>
                            </div>
                            <p> 골프 용품 중고거래 1위 마켓  MadForGolf
                        </div>
                    </div>

                    
                    
                    <!-- Single Footer Widget -->
                    <div class="col-13 col-sm-6 col-lg-3 bottom">
                        <div class="single-footer-widget" id="single-footer-widget">
                            <div class="widget-title">
                                <h5>CONTACT</h5>
                            </div>

                            <div class="contact-information">
                                <p><span>- Address</span><br> 부산 부산진구 동천로 109, 7층 <br>(삼한골든게이트)</p><br>
<!--                                 <p><span>- Email</span><br>  MadForGolf@gmail.com</p> -->
                            </div>
                        </div>
                    </div>
                    
                      <!-- Single Footer Widget -->
                    <div class="col-13 col-sm-6 col-lg-3 bottom">
                        <div class="single-footer-widget">
                            <div class="widget-title">
                                <h5>　</h5>
                            </div>

                            <div class="contact-information">
                                <p><span>- Phone / Email</span><br>  051-803-0909 / MFG@gmail.com </p><br>
<!--                                 <p><span>- Open hours</span><br> 월 - 금 : 9 AM to 6 PM (공휴일,주말 휴무)</p><br> -->
<!--                                 <p><span>- Happy hour</span><br> 토 : 2 PM to 4 PM</p> -->
                            </div>
                        </div>
                    </div>
                      <!-- Single Footer Widget -->
                    <div class="col-13 col-sm-6 col-lg-3 bottom">
                        <div class="single-footer-widget">
                            <div class="widget-title">
                                <h5>　</h5>
                            </div>

                            <div class="contact-information">
<!--                                 <p><span>- Phone / Email</span><br>  051-803-0909 / MFG@gmail.com </p><br> -->
                                <p><span>- Open hours</span><br> 월 - 금 : 9 AM to 6 PM <br>(공휴일,주말 휴무)</p><br>
<!--                                 <p><span>- Happy hour</span><br> 토 : 2 PM to 4 PM</p> -->
                            </div>
                        </div>
                    </div>
                    
                    
<!--                      Single Footer Widget -->
<!--                     <div class="col-13 col-sm-6 col-lg-3 bottom"> -->
<!--                         <div class="single-footer-widget"> -->
<!--                             <div class="widget-title"> -->
<!--                                 <h5>SNS</h5> -->
<!--                             </div> -->
<!--                             <div class="social-info"> -->
<!--                                 <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a> -->
<!--                                 <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a> -->
<!--                                 <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a> -->
<!--                                 <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->

                   

                    
                </div>
            </div>
        </div>

        <!-- Footer Bottom Area -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="border-line"></div>
                    </div>
                    <!-- Copywrite Text -->
                    <div class="col-12 col-md-6">
                        <div class="copywrite-text">
                            <p>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
                        </div>
                    </div>
                    <!-- Footer Nav -->
                    <div class="col-12 col-md-6">
                        <div class="footer-nav">
                            <nav>
                                <ul>
                                    <li><a href="/product/listAll?category=Driver">Driver</a></li>
                                    <li><a href="/product/listAll?category=Iron">Iron</a></li>
                                    <li><a href="/product/listAll?category=Util">Util</a></li>
                                    <li><a href="/product/listAll?category=Wedge">Wedge</a></li>
                                    <li><a href="/board/listBoardAll">Community</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
         
        </div>
        
       
        
    </footer>
    <!-- ##### Footer Area End ##### -->
    
  

   
   
   </body>
</html> 
    