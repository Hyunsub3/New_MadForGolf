<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<style type="text/css">
#button, #button2 {
	width: 150px; height: 46px;
	font-weight: 600;
	border: none;
	margin-left: 15px;
	cursor: pointer;
}

#button2:hover {
	background-color: white;
	color: #70C745;
	border-color: #70C745;
	cursor: pointer;
	border: 1px solid;
}


      
/* ==================================미디어쿼리===================================== */
@media only screen and (max-width: 767px) {
	#contextBox{
		margin: 0px auto !important;
		width: 380px !important;
	}
	
	#span{
		margin-right:30px !important; margin-left:34px !important;
		font-size: 60px !important;
		color: black !important;
		
	}
	
	#kakaoImg{
		margin-left: 35px !important;
	}
	
	#deal{
		margin-left:25px !important;
	}
	
	#title{
		text-align:center;
		margin-right: 10px;
	}
	
	#price{
		text-align:center;
	}
	
	#short_overview{
		text-align:center;
	}
	
}

@media only screen and (max-width: 414px) { /* 414*896  */
	#button2{
		width:100px !important;
		margin: 8px auto;
	}
	
	#span{
		margin-left: 30px !important;
		margin-right: 0px !important;
		
	}
	#kakaoImg{
		margin-left: 25px !important;
	}

}
/* ==================================미디어쿼리===================================== */
	#p{
		font-size: 20px !important;
		color: black !important;
	}

	
	#span{
		font-size: 20px !important;
 		color: black !important;
/* 		color: black !important; */
	}
	
	#deal{
		background-color: #91C788 !important;
		color: white !important;
		font-weight: bold;
		width: 70px;
	
	}

	

</style>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
  integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script>
  
<script>
  Kakao.init('8bac8b97f338b46658e0afc74127913e'); // 사용하려는 앱의 JavaScript 키 입력
</script>


<script>
function shareMessage() {
/*     var like_count = ${product.like_count}; */
/*     const like = parseInt(like_count); */
   
   	var like_count = ${deal.product.like_count};
   	const like = parseInt(like_count);
	//like_count int로 변환해야 나와서 바꿈 
	
	//alert(like);
    
	Kakao.Share.sendDefault({
      objectType: 'feed',
      content: {
        title: '${deal.product.prod_name}',
        description: '${deal.product.detail}',
        imageUrl: 'https://cdn.pixabay.com/photo/2017/01/07/17/25/golfer-1960998_960_720.jpg',
        //대표 이미지 주소 넣을 예정 -> 상품별 이미지 불러오기 어려브..
        link: {
          mobileWebUrl: 'http://itwillbs7.cafe24.com',
          webUrl: 'http://itwillbs7.cafe24.com',
          //http://itwillbs7.cafe24.com/MadForGolf 
          //최종 호스팅하고 주소 넣을 예정 
        },
      },
      social: {
        likeCount: like,
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
      ],
    });
  }
</script>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


        //================= 찜하기 

	$(document).ready(function() {



		 $(".like").on("click", function(){
			
		 	$.ajax({
		 		url : "/product/like",
		 		type: 'GET',
		 		data: {'prod_num':'${deal.product.prod_num}', 'buyer_id':'${user_id}'},
		 		success:function(data){
				
		 			if(data==1){
		 				like2 = true;
		 				alert("상품 찜 하셨습니다.");
		 				$('#like').attr("src","${pageContext.request.contextPath }/resources/img/core-img/heart-fill.svg");
		 				var result = confirm('찜목록으로 이동하시겠습니까?');
		 				if (result) {
		 					//yes
		 	 				//찜 리스트 페이지 생성 후 -> 찜리스트 페이지 이동으로 변경 
		 					location.href='/mypage/likeListAll '; 
		 					
		 	 			} 
		 				
		 			}
		 			else if(data == -1){
		 				alert("로그인이 필요한 서비스입니다. ");
		 				
		 				
		 			} 		 			
		 			else {
		 				like2 =false;
		 				alert("상품 찜 취소하셨습니다. ");
		 				$('#like').attr("src","${pageContext.request.contextPath }/resources/img/core-img/heart.svg");
		 			}
		 			
		 		},
		 		error:function(error){
		 			console.log(error);
		 		}
				
				
		 	});
		 });
	}); 
        
</script>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
        
//=======================================거래전중 변경버튼================================================
$(document).ready(function() {


		 $('#deal').click(function(){
			 var result = confirm('거래상태를 변경하시겠습니까?');
				if (result) {
					
					
			 
		 	 $.ajax({
			 		url : "/product/BeforeAndDealing",
			 		type: 'POST',
			 		data: {'state':'${deal.state}','deal_num':'${deal.deal_num}'},
			 		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			 		success:function(data){
			 			

			 			alert("거래상태 변경완료!");
			 			//alert("성공"+data); 
/* 			 			$('#deal').val() = data;
 */	
 
 						//버튼 
 			 			$('#test').html('<input type="button" id="deal" value="'+data+
								'" onclick=""  style="background:#f2f4f5; border-color: #f2f4f5; color: black;">');
 
 						//문구
 						$('#test2').html('<input type="button" id="highlight" value="'+data+
 								'" style="border: none; background-color: #FA7070; font-size: small; font-weight: bold;">');
 					
 						if(data == "거래전"){
 							$('#button').attr("disabled",false);
	 						$('#addtocart').attr("disabled",false);
 						}
 						else{
 							$('#button').attr("disabled","disabled");
	 						$('#addtocart').attr("disabled","disabled");
 						}
 						
			 		},
		 	 		error:function(data){
			 			
			 			alert("실패"+data); 
			 		}
		 	});
		 	 
		 	 
	 		} 
		 });
});

//=======================================거래전중 변경버튼================================================


//=================== 구매하기 버튼 안내창 제어 시작 ========================//


$(document).ready(function(){
	
	sessionStorage.setItem("price", ${deal.product.price });
	//alert(${product.seller_id});
	
	$("#addtocart").click(function(){
 		//alert("test");
		
		var answer = confirm('거래를 위한 본인인증 및 계좌 출금/조회 동의가 필요합니다.\n본인인증 페이지로 이동하시겠습니까?');
		
		if(answer){
			var form = $(this).parents('form');
			    form.submit();
			    $.ajax({
			    	type:'post',
			    	url:'/deal/updateDeal',
					dataType:'json',
					data:{
						'deal_num':'${deal.deal_num}'
					},
					success:function(data){
						alert("거래 데이터 구매자 정보 입력 성공");	
						$("#test").val(data);
						
					},
				error: function(){
						alert("거래 데이터 구매자 정보 입력 성공");
					}
			    });
		}else{
			return false;
		}
	});
});
	


	

	//============================== 채팅창 활성화 ==============================//
$(document).ready(function(){

		$('#button').click(function(){
	 		if("${sessionScope.user_id }" == "") {
				alert("로그인이 필요한 서비스입니다.");
			} else {
				var userid1 = "${sessionScope.user_id }";
				var text1 = userid1.substring(0, userid1.indexOf('@'));
				var text2 = userid1.substring(userid1.indexOf("@")+1, userid1.indexOf("."));
				var text3 = userid1.substring(userid1.lastIndexOf('.') + 1);
				var talker1_id = text1 + text2 + text3;
				
				var userid2 = "${deal.product.seller_id }";
				var text4 = userid2.substring(0, userid2.indexOf('@'));
				var text5 = userid2.substring(userid2.indexOf("@")+1, userid2.indexOf("."));
				var text6 = userid2.substring(userid2.lastIndexOf('.') + 1);
				var talker2_id = text4 + text5 + text6;
				var chattingNum = "";
				if(talker1_id > talker2_id) {
					chattingNum = "Chatting-" + talker1_id + "-" + talker2_id
				} else if(talker1_id < talker2_id) {
					chattingNum = "Chatting-" + talker2_id + "-" + talker1_id
				} else {
					alert("본인입니다.")
					return null;
				}
		
				$.ajax({
					url: "/product/chattingNum",
			        async: false,
					data: {"chattingNum":chattingNum, "talker1_id":userid1, "talker2_id":userid2},
					success: function(chattingNum){
// 						alert("성공");
// 						alert(chattingNum);
						window.open("/product/chatting?chattingNum="+chattingNum+"", "Mad for Golf", "menubar=no, toolbar=no, location=no, resizable=no, scrollbars=no, width=200");
						},
					error: function(){
						alert("실패");
						}
				}); // Ajax
			} // if	
		}); // 채팅하기
	//============================== 채팅창 활성화 ==============================//
	
	
});


//=================== 구매하기 버튼 안내창 제어 종료 ========================//


</script>


    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${pageContext.request.contextPath }/resources/img/bg-img/24.jpg);">
            <h2>SHOP DETAILS</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Shop</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Shop Details</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Single Product Details Area Start ##### -->
    <section class="single_product_details_area mb-50">
        <div class="produts-details--content mb-50">
            <div class="container">
                <div class="row justify-content-between">

<%--                     <div class="col-12 col-md-6 col-lg-5">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="product-img" href="${pageContext.request.contextPath }/resources/product_img/${product.prod_img }" title="Product Image">
                                        <img src="${pageContext.request.contextPath }/resources/product_img/${product.prod_img }" alt="1" style="height: 440px; width: 308px; margin-left: 80px;">
                                    </a>
                                    </div>
                                    <!-- 이미지 여러개 넣을 시 주석 풀고 사용 -->
<!--                                     <div class="carousel-item"> -->
                                        <a class="product-img" href="${pageContext.request.contextPath }/resources/img/bg-img/49.jpg" title="Product Image">
                                        <img class="d-block w-100" src="${pageContext.request.contextPath }/resources/img/bg-img/49.jpg" alt="1">
<!--                                     </a> -->
<!--                                     </div> -->
<!--                                     <div class="carousel-item"> -->
                                        <a class="product-img" href="${pageContext.request.contextPath }/resources/img/bg-img/49.jpg" title="Product Image">
                                        <img class="d-block w-100" src="${pageContext.request.contextPath }/resources/img/bg-img/49.jpg" alt="1">
<!--                                     </a> -->
<!--                                     </div> -->
                                </div>
<!--                                 <ol class="carousel-indicators"> -->
                                    <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(${pageContext.request.contextPath }/resources/img/bg-img/49.jpg);">
<!--                                     </li> -->
                                    <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(${pageContext.request.contextPath }/resources/img/bg-img/49.jpg);">
<!--                                     </li> -->
                                    <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(${pageContext.request.contextPath }/resources/img/bg-img/49.jpg);">
<!--                                     </li> -->
<!--                                 </ol> -->
                            </div>
                        </div>
                    </div> --%>
                    

                    <div class="col-12 col-md-6 col-lg-5" >
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                    	<img class="d-block w-100" src="${pageContext.request.contextPath }/resources/product_img/${deal.product.prod_img }" alt="1" style="width: 445px; height: 445px;">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="${pageContext.request.contextPath }/resources/product_img/${deal.product.prod_img2 }" alt="1" style="width: 445px; height: 445px;">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="${pageContext.request.contextPath }/resources/product_img/${deal.product.prod_img3 }" alt="1" style="width: 445px; height: 445px;">
                                    </div>
                                </div>
                                <ol class="carousel-indicators">
                                    <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(${pageContext.request.contextPath }/resources/product_img/${deal.product.prod_img });"></li>
                                    <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(${pageContext.request.contextPath }/resources/product_img/${deal.product.prod_img2 });"></li>
                                    <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(${pageContext.request.contextPath }/resources/product_img/${deal.product.prod_img3 });"></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    



					
					
					
                    <div class="col-12 col-md-6">
                        <div class="single_product_desc" style="width: 410px;" id="contextBox">
                            <h4 class="title" id="title">${deal.product.prod_name }
                            
                            <!-- 상품명 옆에 거래전/거래중 표시 문구 버튼   -->
							<span id=test2>
							<c:choose>
								<c:when test="${deal.state eq '거래전'}">
									<input type="button" id="highlight" value="거래전"
										style="border: none; background-color: #FA7070; font-size: small; font-weight: bold;">
										</c:when>
								<c:when test="${deal.state eq '거래중'}">
									<input type="button" id="highlight" value="거래중"
										style="border: none; background-color: #FA7070; font-size: small; font-weight: bold;">
								</c:when>
							</c:choose>
							</span>
						</h4>
                            <!-- 상품명 옆에 거래전/거래중 표시 문구 버튼   -->
                            
                            <h4 class="price" id="price"><fmt:formatNumber value="${deal.product.price }"/>원</h4>

                            <div class="short_overview" id="short_overview">
                            					<!-- 판매자 아이디 = 세션 로그인 아이디 같을 시에만 거래전버튼 활성화 -->
                                <p id="p">${deal.product.detail }</p>
                            </div>
   

                            <div class="cart--area d-flex flex-wrap align-items-center">
                                <!-- Add to Cart Form -->
<!--                                 <form class="cart clearfix d-flex align-items-center" action="/account/" method="post" > -->
								
								
								<!-- 인증 요청 작업 수행 form -->
								<form action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" method="get">
                                
                                <!-- Wishlist & Compare -->
                                          <div class="wishlist-compare d-flex flex-wrap align-items-center">


									<c:if test="${result != null}">
<!-- 									11111111111111 -->
										<a class="like"> <c:if test="${result.check == 0}">
												<img id="like" class="l1"
													src="${pageContext.request.contextPath }/resources/img/core-img/heart.svg">
											</c:if> <c:if test="${result.check == 1}">
												<img id="like" class="l1"
													src="${pageContext.request.contextPath }/resources/img/core-img/heart-fill.svg">
											</c:if>
										</a>
									</c:if>
									<c:if test="${result == null}">
<!-- 									22222222222 -->
										<a class="like">
										<img id="like" class="l1"
											src="${pageContext.request.contextPath }/resources/img/core-img/heart.svg">
											</a>	
									</c:if>



                                    <input type="hidden" id="state" value="${deal.state }">
                                    <input type="hidden" id="prod_img" value="${deal.product.prod_img }">
                                    <input type="hidden" id="like_count" value="${deal.product.like_count }">
                                    <input type="hidden" id="deal_num" value="${deal.deal_num }">
                                    
                                    <!-- 구매를 위해서 상품 정보(이름, 가격) 보내기 -->
                                    <input type="hidden" name="prod_num" value="${deal.product.prod_num }">
                                    <input type="hidden" name="prod_name" value="${deal.product.prod_name }">
                                    <input type="hidden" name="price" value="${deal.product.price }">
                                    
                              

                                   	<!-- 오픈뱅킹 본인인증을 위해 필요한 정보 시작 -->
                                   
									<input type="hidden" name="client_id" value="6f948a13-11af-4892-b746-ee67d358abf2">
									<input type="hidden" name="response_type" value="code">
<!-- 									<input type="hidden" name="redirect_uri" value="http://localhost:8088/openbanking/callback"> -->
									<input type="hidden" name="redirect_uri" value="https://madforgolf.tk/openbanking/callback">
									<input type="hidden" name="scope" value="login inquiry transfer oob">
									<input type="hidden" name="state" value="12345678123456781234567812345678">
									<input type="hidden" name="auth_type" value="0">

                                   	<!-- 오픈뱅킹 본인인증을 위해 필요한 정보 종료 -->



									<c:choose>
										<c:when test="${deal.state eq '거래전'}">
											<input type="button" id="button" value="채팅하기" onclick="" >
											<input type="button" id="addtocart" value="구매하기" class="btn alazea-btn ml-15" >
										</c:when>
										<c:when test="${deal.state eq '거래중'}">
											<input type="button" id="button" value="채팅하기" onclick="" disabled="disabled">
											<input type="button" id="addtocart" value="구매하기" class="btn alazea-btn ml-15" disabled="disabled">
										</c:when>
									</c:choose>


<!-- 									<input type="button" id="button" value="채팅하기" onclick="">

                                    <input type="button" id="deal" value="거래전" onclick="changeBtnName();">

                                    <input type="submit" id="addtocart" value="구매하기" class="btn alazea-btn ml-15"> -->

                                </div>                                  
                                </form>

                                
                                
                            </div>

                            <div class="products--meta">
                                <!--판매자 정보 페이지 연결 -->
                                <p id="p" class="seller"><span id="span">Seller:</span> <span ><a class="seller" href="${pageContext.request.contextPath }/product/seller?prod_num=${deal.product.prod_num } " id="span">${deal.product.seller_id }</a></span></p>
<!--                                 <div id="seller-text"> 판매자를 클릭하면 상세 판매 정보를 보실 수 있습니다. </div> -->
                                <!--판매자 정보 페이지 연결 -->
                                <p id="p"><span id="span">Condition:</span> <span id="span">${deal.product.condition }</span></p>
                                <p id="p"><span id="span">Gender:</span> <span id="span"><c:if test="${deal.product.gender eq 1}">남</c:if><c:if test="${deal.product.gender eq 2}">여</c:if></span></p>
                                <p id="p"><span id="span">Category:</span> <span id="span">${deal.product.category }</span></p>
                                <p id="p">
                                    <span id="span">Share on:</span>
                                    <span>
                                   <!--  <a href="#"><i class="fa fa-facebook" onclick="shareMessage();"></i></a> -->
                                    <a href="#" onclick="shareMessage();"><img id="kakaoImg" style="width: 35px; height: 35x;" src="${pageContext.request.contextPath }/resources/product_img/kakao.png"></a>
                                </span>
                                </p>

							<p>
								<c:if test="${deal.product.seller_id == user_id }">
									<span id="span"> Deal State: </span>
									<!--나중에 마이페이지에 버튼 옮길 때, 마이페이지에도 productVO값 전달하고 세션 user_id랑 비교하기  -->
									<span id="test"> <input type="button" id="deal"
										value="${deal.state }" onclick=""
										style="background: #f2f4f5; border-color: #f2f4f5; color: black;">
									</span>
								</c:if>
								<!-- 판매자 아이디 = 세션 로그인 아이디 같을 시에만 거래전버튼 활성화 -->
							</p>
						</div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="product_details_tab clearfix" style="border-bottom: none;">
                    	<!-- 탭 사용 시 주석풀고 사용 -->
                        <!-- Tabs -->
<!--                         <ul class="nav nav-tabs" role="tablist" id="product-details-tab"> -->
<!--                             <li class="nav-item"> -->
<!--                                 <a href="#description" class="nav-link active" data-toggle="tab" role="tab">Description</a> -->
<!--                             </li> -->
<!--                             <li class="nav-item"> -->
<!--                                 <a href="#addi-info" class="nav-link" data-toggle="tab" role="tab">Additional Information</a> -->
<!--                             </li> -->
<!--                             <li class="nav-item"> -->
<!--                                 <a href="#reviews" class="nav-link" data-toggle="tab" role="tab">Reviews <span class="text-muted">(1)</span></a> -->
<!--                             </li> -->
<!--                         </ul> -->
                        <!-- Tab Content -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="description"  style="text-align: center;">
                                <div class="description_area">
                                    <input type="button" id="button2" value="목록으로" onclick="history.back();">

								<c:if test="${deal.product.seller_id == user_id }"> <!-- 작성자일때만 수정/삭제하기 보이게 -->

									<!-- 수정하기 get  -->
									<input type="button" id="button2" value="수정하기"
										onclick="location.href='${pageContext.request.contextPath }/product/modify?prod_num=${deal.product.prod_num}'">
									<!-- 수정하기 get  -->



									<input type="button" id="button2" value="삭제하기"
										onclick="location.href='${pageContext.request.contextPath }/product/remove?prod_num=${deal.product.prod_num}&category=${deal.product.category }'">
								</c:if>

								<%--                                     <!-- 삭제하기 post  -->
                                    <form action="${pageContext.request.contextPath }/product/remove" method="post">
                                    <input type="hidden" value="${product.prod_num }">
                                    <input type="submit" value="삭제하기">
                         			</form>
                                    <!-- 삭제하기 post  --> --%>
                         			
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="addi-info">
                                <div class="additional_info_area">
                                    <p>What should I do if I receive a damaged parcel?
                                        <br> <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit impedit similique qui, itaque delectus labore.</span></p>
                                    <p>I have received my order but the wrong item was delivered to me.
                                        <br> <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis quam voluptatum beatae harum tempore, ab?</span></p>
                                    <p>Product Receipt and Acceptance Confirmation Process
                                        <br> <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum ducimus, temporibus soluta impedit minus rerum?</span></p>
                                    <p>How do I cancel my order?
                                        <br> <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum eius eum, minima!</span></p>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="reviews">
                                <div class="reviews_area">
                                    <ul>
                                        <li>
                                            <div class="single_user_review mb-15">
                                                <div class="review-rating">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <span>for Quality</span>
                                                </div>
                                                <div class="review-details">
                                                    <p>by <a href="#">Colorlib</a> on <span>12 Sep 2018</span></p>
                                                </div>
                                            </div>
                                            <div class="single_user_review mb-15">
                                                <div class="review-rating">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <span>for Design</span>
                                                </div>
                                                <div class="review-details">
                                                    <p>by <a href="#">Colorlib</a> on <span>12 Sep 2018</span></p>
                                                </div>
                                            </div>
                                            <div class="single_user_review">
                                                <div class="review-rating">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <span>for Value</span>
                                                </div>
                                                <div class="review-details">
                                                    <p>by <a href="#">Colorlib</a> on <span>12 Sep 2018</span></p>
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
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ##### Single Product Details Area End ##### -->

    <!-- ##### Related Product Area Start ##### -->
<!--     <div class="related-products-area"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-12"> -->
<!--                     Section Heading -->
<!--                     <div class="section-heading text-center"> -->
<!--                         <h2>Related Products</h2> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->

<!--             <div class="row"> -->

<!--                 Single Product Area -->
<!--                 <div class="col-12 col-sm-6 col-lg-3"> -->
<!--                     <div class="single-product-area mb-100"> -->
<!--                         Product Image -->
<!--                         <div class="product-img"> -->
<%--                             <a href="shop-details.html"><img src="${pageContext.request.contextPath }/resources/img/bg-img/40.png" alt=""></a> --%>
<!--                             Product Tag -->
<!--                             <div class="product-tag"> -->
<!--                                 <a href="#">Hot</a> -->
<!--                             </div> -->
<!--                             <div class="product-meta d-flex"> -->
<!--                                 <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a> -->
<!--                                 <a href="cart.html" class="add-to-cart-btn">Add to cart</a> -->
<!--                                 <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         Product Info -->
<!--                         <div class="product-info mt-15 text-center"> -->
<!--                             <a href="shop-details.html"> -->
<!--                                 <p>Cactus Flower</p> -->
<!--                             </a> -->
<!--                             <h6>$10.99</h6> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

<!--                 Single Product Area -->
<!--                 <div class="col-12 col-sm-6 col-lg-3"> -->
<!--                     <div class="single-product-area mb-100"> -->
<!--                         Product Image -->
<!--                         <div class="product-img"> -->
<%--                             <a href="shop-details.html"><img src="${pageContext.request.contextPath }/resources/img/bg-img/41.png" alt=""></a> --%>
<!--                             <div class="product-meta d-flex"> -->
<!--                                 <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a> -->
<!--                                 <a href="cart.html" class="add-to-cart-btn">Add to cart</a> -->
<!--                                 <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         Product Info -->
<!--                         <div class="product-info mt-15 text-center"> -->
<!--                             <a href="shop-details.html"> -->
<!--                                 <p>Cactus Flower</p> -->
<!--                             </a> -->
<!--                             <h6>$10.99</h6> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

<!--                 Single Product Area -->
<!--                 <div class="col-12 col-sm-6 col-lg-3"> -->
<!--                     <div class="single-product-area mb-100"> -->
<!--                         Product Image -->
<!--                         <div class="product-img"> -->
<%--                             <a href="shop-details.html"><img src="${pageContext.request.contextPath }/resources/img/bg-img/42.png" alt=""></a> --%>
<!--                             <div class="product-meta d-flex"> -->
<!--                                 <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a> -->
<!--                                 <a href="cart.html" class="add-to-cart-btn">Add to cart</a> -->
<!--                                 <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         Product Info -->
<!--                         <div class="product-info mt-15 text-center"> -->
<!--                             <a href="shop-details.html"> -->
<!--                                 <p>Cactus Flower</p> -->
<!--                             </a> -->
<!--                             <h6>$10.99</h6> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

<!--                 Single Product Area -->
<!--                 <div class="col-12 col-sm-6 col-lg-3"> -->
<!--                     <div class="single-product-area mb-100"> -->
<!--                         Product Image -->
<!--                         <div class="product-img"> -->
<%--                             <a href="shop-details.html"><img src="${pageContext.request.contextPath }/resources/img/bg-img/43.png" alt=""></a> --%>
<!--                             Product Tag -->
<!--                             <div class="product-tag sale-tag"> -->
<!--                                 <a href="#">Hot</a> -->
<!--                             </div> -->
<!--                             <div class="product-meta d-flex"> -->
<!--                                 <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a> -->
<!--                                 <a href="cart.html" class="add-to-cart-btn">Add to cart</a> -->
<!--                                 <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         Product Info -->
<!--                         <div class="product-info mt-15 text-center"> -->
<!--                             <a href="shop-details.html"> -->
<!--                                 <p>Cactus Flower</p> -->
<!--                             </a> -->
<!--                             <h6>$10.99</h6> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    <!-- ##### Related Product Area End ##### -->
<div id = "test2"></div>
<%@ include file="../include/footer.jsp" %>