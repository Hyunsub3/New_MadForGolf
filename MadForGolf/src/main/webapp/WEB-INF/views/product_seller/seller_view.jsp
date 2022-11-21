<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">

<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

/*-------------------------------------------------------------------------*/
/*  skill bar style
/*-------------------------------------------------------------------------*/

    .zt-skill-bar {
        color: #fff;
        font-size: 11px;
        line-height: 15px;
        height: 15px;
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
        padding-left: 25px;
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
        background-color: #1a1a1a;

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
        background-color: #1a1a1a;

        -webkit-transform: rotate(45deg);
           -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
                transform: rotate(45deg);
    }




</style>

<script type="text/javascript">
	
	function hide_numbers(s){
	var result = "";
	var sLength = s.length;
	for(var i = 0; i < sLength; i++){
		result += i < sLength - 4 ? "*" : s.charAt(i);
	}
	return result;
}
	
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


    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" 
        	style="background-image: url('https://igp.brightspotcdn.com/dims4/default/42109d2/2147483647/strip/true/crop/1920x933+0+73/resize/1926x936!/quality/90/?url=http%3A%2F%2Findigogolf-brightspot.s3.amazonaws.com%2Fclubs%2F0f%2F0f%2Ffe62828f4d1591e4e038cf161087%2Fsydney-marovitz-pano-1.jpg');">
            <h2 style="font-family: 'Jua', sans-serif;">판매자 상세페이지</h2>
            
         
        </div>
              
        
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                            	Seller Details</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->
	
	
    <!-- ##### Checkout Area Start ##### -->
    
                        	
    <div class="checkout_area mb-100">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-12 col-lg-7">
                    <div class="checkout_details_area clearfix">
                        	<h2 class="text-center mb-5" style="font-family: 'Jua', sans-serif;">'${sellerInfo.user_id}'님의 매너점수는 ${sellerInfo.score}P     입니다.</h2>
                        <!-- 막대 그래프 -->
                        <div class="zt-span6 last">
						<h4><strong>매너점수 등급안내</strong></h4>
							<div class="zt-skill-bar"><div data-width="20" style="">파<span>0~20p</span></div></div>
							<div class="zt-skill-bar"><div data-width="40" style="">버디<span>21~40p</span></div></div>
							<div class="zt-skill-bar"><div data-width="60" style=";">이글<span>41~60p</span></div></div>
							<div class="zt-skill-bar"><div data-width="80" style=";">알바트로스<span>61~80p</span></div></div>
							<div class="zt-skill-bar"><div data-width="100" style=";">홀인원<span>81~100p</span></div></div>
						</div>
                        
						<div>
							<span class="blue" data-val='20%'></span>
							<span class="red" data-val='40%'></span>
							<span class="green" data-val='60%'></span>
							<span class="yellow" data-val='80%'></span>
							<span class="black" data-val='100%'></span>				
						</div>
						<p>&nbsp;</p>
						<h4><strong>현재 보고 계시는 상품</strong></h4>
                                               
                        
                        <input type="hidden" name="prodNum" id="prodNum" value=" ${sellerInfo.prod_num}">
                        <input type="hidden" name="home" id="home" value="${pageContext.request.contextPath}" >
                              <img src="${pageContext.request.contextPath}/resources/product_img/${sellerInfo.prod_img}" 
                              style="width:150px  ; height: auto"> <br>
                        
                         <%-- ${sellerInfo} --%>                        
                         <form action="${pageContext.request.contextPath }/product/listAll" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="seller_Id">
                                     <h4 style="font-family: 'Jua', sans-serif;"> ${sellerInfo.prod_name}</h4></label>
                                    <input type="hidden" class="form-control" id="sellerId" name="sellerId" value="${sellerInfo.user_id}" required>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="seller_name"> <h5> 판매가 : &#8361; <fmt:formatNumber  value="${sellerInfo.price}"  pattern="###,###" /></h5> </label>
                                    <input type="hidden" class="form-control" id="seller_name" name="seller_name" value=VeryGood required>
                                </div>                                
                            </div>
                        </form> 
                    </div>
                </div>
        

                <div class="col-12 col-lg-4">
                    <div class="checkout-content">
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <h5 class="title--"><strong>${sellerInfo.user_id}님의 정보</h5>
                        <div class="subtotal d-flex justify-content-between align-items-center">
                            <h5>Name</h5>
                            <h5>${sellerInfo.user_name}</h5>
                        </div>
                        <div class="subtotal d-flex justify-content-between align-items-center">
                            <h5>Contact number</h5>
                            <h5>${ hide_number}</h5>
                        </div>
                        <div class="shipping d-flex justify-content-between align-items-center">
                            <h5 style="font-family: 'Jua', sans-serif;">가입한 날짜</h5>
                            <h5>${sellerInfo.reg_date}</h5>
                        </div>
                        <div class="order-total d-flex justify-content-between align-items-center">
                            <h5>Manner Score</h5>
                            <h5>${sellerInfo.score}P</h5>
                        </div>
                        <div class="checkout-btn mt-30">
<%--                             <a href="http://localhost:8088/product/productDetail?prod_num=${sellerInfo.prod_num}" class="btn alazea-btn w-100">상품으로 돌아가기</a>
 --%>                            <a class="btn alazea-btn w-100" onclick="history.back();">상품으로 돌아가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Checkout Area End ##### -->

	<!-- 템플릿 폼 시작 -->
<section class="single_product_details_area mb-50">
        <div class="produts-details--content mb-50">
            <div class="container">

            </div>
        </div>

	    <div class="container">
	        <div class="row">
	            <div class="col-12">
	                <div class="product_details_tab clearfix">
	                    <!-- Tabs -->
	                    <ul class="nav nav-tabs" role="tablist" id="product-details-tab">
	                        <li class="nav-item">
	                            <a href="#description" class="nav-link active" 
	                            data-toggle="tab" role="tab" style="font-family: 'Jua', sans-serif;" id="sellerTotalCount"></a>
	                            
	                        </li>
	                        <li class="nav-item">
	                            <a style="font-family: 'Jua', sans-serif;" href="#addi-info" class="nav-link" data-toggle="tab" role="tab">&#127948;FAQ&#127948;</a>
	                        </li>
	                        <li class="nav-item">
	                            <a style="font-family: 'Jua', sans-serif;" href="#reviews"
	                             class="nav-link" data-toggle="tab" role="tab">거래후기 <span class="text-muted" id="review-totcnt"></span></a>
	                        </li>
	                    </ul>
	                    <!-- Tab 시작  -->
	                    <div class="tab-content">
	                        <div role="tabpanel" class="tab-pane fade show active" id="description">
	                            <div class="description_area">
	                               	<!-- tap 1 내용 : 판매자 상품 스크롤 -->
	                               	<div class="related-products-area">
					        <div class="container">
					            <div class="row">
					                <div class="col-12">
				                
				                
				     <!-- Section Heading -->
				                     <div class="section-heading text-center">
				                        <h2 class="text-left"></h2>
				                    </div>
				                </div>
				            </div>
				
				            <div class="row" id="sellerProductList">
				             </div>
				        </div>
				   	 </div> 
	                           </div>
	                        </div>
	                        <div role="tabpanel" class="tab-pane fade" id="addi-info">
	                            <div style="font-family: 'Jua', sans-serif;" class="additional_info_area">
	                                <p align="center"> 판매자가 직거래 도중 위협을 가하면 어떻게 해야하나요?
	                                    <br> <span>MadForGolf 사건신고 부서로 연락주시기 바랍니다.</span></p>
	                                <p align="center"> 판매자가 판매한 상품이 사진 및 설명과 많이 다릅니다.
	                                    <br> <span> 증빙가능한 자료를 첨부하여 온라인 고객센터 접수 부탁드립니다.</span></p>
	                                <p align="center"> 구매한 상품이 마음에 들지 않습니다. 환불이 되나요?
	                                    <br> <span>구매확정을 누르시면 환불이 불가합니다. 구매확정은 신중하게! </span></p>
	                                <p align="center"> 판매자와 만나서 현금결제가 가능한가요?
	                                    <br> <span> 규정상 문제는 없으나 사전결제 모듈 이용을 권장 드립니다.</span></p>
	                                <p align="center"> MAD FOR GOLF를 이용해주신 모든 고객님께 진심으로 감사드립니다. &#128578; 
	                                    <br> <span> 소중한 후기 하나하나가 국내 1위 MadForGolf를 만듭니다.</span></p>
	                            </div>
	                        </div>
	                        
<%-- 	                        <c:if test="${empty }">아직 작성된 리뷰가 없습니다.</c:if> --%>
	                        <!-- tab3 (리뷰/후기) 시작 -->
	                        <div role="tabpanel" class="tab-pane fade" id="reviews">
	                        
	                        
	                      <!-- Comment Area Start -->
                        <div class="comment_area clearfix">
                            <h4 class="headline">2 Comments</h4>
                            <ol>
       
								<!-- 리뷰란 -->
                                
                            </ol>
                        </div>
	                        
                  <div class="page_box" >

	<nav aria-label="Page navigation" id="review-pagination">
<!--     	<ul class="pagination"  >
    	    	        
	        	<li class="page-item">
	        		<a class="page-link" id="page-link_real" href="listBoardAll?page=1">1</a>
        		</li>
	        	
      		
	    </ul> -->
	</nav>
	</div>    
										                     
	                        
	                        
	                          
	
<!-- 			 <div class="reviews_area">
	                                <ul>
	                                    <li>
	                                        <div class="single_user_review mb-15">
	                                           
	                                            <div class="review-details">
	                                                <a style="font-family: 'Jua', sans-serif;">리뷰테스트다 리뷰테스트다</a>
	                                                <p>by <a href="#">itwill01@naver.com</a> on <span>10 Nov 2022</span></p>
	                                            </div>
	                                        </div>
	                                        <div class="single_user_review mb-15">
	                                            <div class="review-details">
	                                                <a style="font-family: 'Jua', sans-serif;">아직 에이잭스 제대로 뿌려지지 못하는 상태</a>
	                                                <p>by <a href="#">itwill02@naver.com</a> on <span>10 Nov 2022</span></p>
	                                            </div>
	                                        </div>
	                                         <div class="single_user_review mb-15">
	                                            <div class="review-details">
	                                                <a style="font-family: 'Jua', sans-serif;">this page opening soon</a>
	                                                <p>by <a href="#">itwill03@naver.com</a> on <span>10 Nov 2022</span></p>
	                                            </div>
	                                        </div>
	                                        <div class="single_user_review mb-15">
	                                            <div class="review-details">
	                                                <a style="font-family: 'Jua', sans-serif;">this page opening soon</a>
	                                                <p>by <a href="#">itwill03@naver.com</a> on <span>10 Nov 2022</span></p>
	                                            </div>
	                                        </div>
	                                        <div class="single_user_review mb-15">
	                                            <div class="review-details">
	                                                <a style="font-family: 'Jua', sans-serif;">this page opening soon</a>
	                                                <p>by <a href="#">itwill03@naver.com</a> on <span>10 Nov 2022</span></p>
	                                            </div>
	                                        </div>
	                                        <div class="single_user_review mb-15">
	                                            <div class="review-details">
	                                                <a style="font-family: 'Jua', sans-serif;">this page opening soon</a>
	                                                <p>by <a href="#">itwill03@naver.com</a> on <span>10 Nov 2022</span></p>
	                                            </div>
	                                        </div>
	                                        <div class="single_user_review mb-15">
	                                            <div class="review-details">
	                                                <a style="font-family: 'Jua', sans-serif;">this page opening soon</a>
	                                                <p>by <a href="#">itwill03@naver.com</a> on <span>10 Nov 2022</span></p>
	                                            </div>
	                                        </div>
	                                        
	                                    </li>
	                                </ul>
	                            </div>
	
	                            <div class="submit_a_review_area mt-50">
	                                <h4>Submit A Review</h4>
	                                <form action="#" method="post">
	                                    <div class="row">
	                                        <div class="col-12">
	                                            <div class="form-group d-flex align-items-center">
	                                                <span class="mr-15">Your Ratings:</span>
	                                                <div class="stars">
	                                                    <input type="radio" name="star" class="star-1" id="star-1">
	                                                    <label class="star-1" for="star-1">1</label>
	                                                    <input type="radio" name="star" class="star-2" id="star-2">
	                                                    <label class="star-2" for="star-2">2</label>
	                                                    <input type="radio" name="star" class="star-3" id="star-3">
	                                                    <label class="star-3" for="star-3">3</label>
	                                                    <input type="radio" name="star" class="star-4" id="star-4">
	                                                    <label class="star-4" for="star-4">4</label>
	                                                    <input type="radio" name="star" class="star-5" id="star-5">
	                                                    <label class="star-5" for="star-5">5</label>
	                                                    <span></span>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="col-12 col-md-6">
	                                            <div class="form-group">
	                                                <label for="name">Nickname</label>
	                                                <input type="email" class="form-control" id="name" placeholder="Nazrul">
	                                            </div>
	                                        </div>
	                                        <div class="col-12 col-md-6">
	                                            <div class="form-group">
	                                                <label for="options">Reason for your rating</label>
	                                                <select class="form-control" id="options">
	                                                      <option>Quality</option>
	                                                      <option>Value</option>
	                                                      <option>Design</option>
	                                                      <option>Price</option>
	                                                      <option>Others</option>
	                                                </select>
	                                            </div>
	                                        </div>
	                                        <div class="col-12">
	                                            <div class="form-group">
	                                                <label for="comments">Comments</label>
	                                                <textarea class="form-control" id="comments" rows="5" data-max-length="150"></textarea>
	                                            </div>
	                                        </div>
	                                        <div class="col-12">
	                                            <button type="submit" class="btn alazea-btn">Submit Your Review</button>
	                                        </div>
	                                    </div>
	                                </form>
	                            </div> -->
	                       
	                        
	                        
	                        </div>
	
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>	
 	<!-- 템플릿 폼 끝 -->
   


<%-- 	<!-- @@@ tap menu area start @@@ -->
	<div style='width:800px;margin:0 auto;margin-top:50px;'>
		<ul class="nav nav-tabs">
			<li class='active'><a href="#tabmenu_01" data-toggle="tab">판매자의 다른상품</a></li>
			<li><a href="#tabmenu_02" data-toggle="tab">판매자의 거래후기</a></li>			
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="tabmenu_01">
			 	<div class="related-products-area">
        			<div class="container">
           				<div class="row">
                			<div class="col-12">
                               
                    <!-- 탭메뉴1 내용 -->
                    <div class="section-heading text-center">
                        <h2 class="text-left">${sellerInfo.user_id}님이 판매중인 다른 상품</h2>
                    </div>
                </div>
            </div>

            <div class="row" id="sellerProductList">
              
            </div>
        </div>
    </div>
			</div>
			<div class="tab-pane fade" id="tabmenu_02"></div>
				
				<!-- <p>탭메뉴2 내용 </p> -->
				    	 
				   <!-- Comment Area Start -->
				    	<div class="comment_area clearfix">
                            <h4 class="headline"> 리뷰 출력</h4>

                            <ol id="sellerReviewList">
                                <li class="single_comment_area">
                                    <div class="comment-wrapper d-flex">
                                        Comment Meta
                                        <div class="comment-author">
                                            <img src="https://cdn-icons-png.flaticon.com/128/5264/5264565.png" alt="">
                                        </div>
                                        Comment Content
                                        <div class="comment-content">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h5>홍길동</h5>
                                                <span class="comment-date">02:20 PM,  20 Jun 2018</span>
                                            </div>
                                            <p>Hello</p>
                                            <a class="active" href="#">리뷰</a>
                                        </div>
                                    </div>
                                </li>
                                                      
                            </ol>
                        </div>			
				
				<!-- <p>탭메뉴2 내용 끝 </p> -->			
						
		</div>
	</div>		
	<!-- @@@ tap menu area end @@@ --> --%>

<!-- 	<div class="related-products-area">
	        <div class="container">
	            <div class="row">
	                <div class="col-12">
                          
     Section Heading
                     <div class="section-heading text-center">
                        <h2 class="text-left"></h2>
                    </div>
                </div>
            </div>

            <div class="row" id="sellerProductList">
             </div>
        </div>
    </div> 

     <section class="blog-content-area section-padding-0-100">
        <div class="container">
            <div class="row justify-content-center">
                Blog Posts Area
                <div class="col-12 col-md-12">
                    <div class="blog-posts-area">  
 
                    </div>
                </div>
        
            </div>
        </div>
    </section> -->
   
    <%@ include file="../include/footer.jsp" %>
              

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${pageContext.request.contextPath}/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/resources/js/active.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/seller-review.js"></script>
    
    
</body>

</html>