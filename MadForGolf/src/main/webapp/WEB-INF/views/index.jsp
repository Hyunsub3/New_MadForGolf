<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./include/header.jsp"%>



<!-- ##### Hero Area Start ##### -->
    <section class="hero-area" style="margin-bottom: 100px;">
        <div class="hero-post-slides owl-carousel">

            <!-- Single Hero Post -->
            <div class="single-hero-post bg-overlay">
                <!-- Post Image -->
                <div class="slide-img bg-img" style="background-image: url('/resources/img/bg-img/background-img (4).jpg');"></div>
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <!-- Post Content -->
                            <div class="hero-slides-content text-center">
                                <h2>인기 상품 보러 가기</h2>
                                <p>실시간으로 가장 주목 받고 있는 인기 상품을 확인할 수 있습니다.</p>
                                <div class="welcome-btn-group">
                                    <a href="/product/listLike2" class="btn alazea-btn mr-30">인기상품 보러가기</a>
                                    <a href="/product/listAll2" class="btn alazea-btn active">최신상품 보러가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Hero Post -->
            <div class="single-hero-post bg-overlay">
                <!-- Post Image -->
                <div class="slide-img bg-img" style="background-image: url('/resources/img/bg-img/background-img (2).jpg');"></div>
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <!-- Post Content -->
                            <div class="hero-slides-content text-center">
                                <h2>우리 동네 인증하기</h2>
                                <p>지금 내가 있는 곳을 인증해서 우리 동네의 중고 물품을 거래해보세요.</p>
                                <div class="welcome-btn-group">
                                    <a href="/member/address" class="btn alazea-btn mr-30">동네 인증하기</a>
                                    <a href="#screen_golf" class="btn alazea-btn active">동네 스크린 골프장 확인하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- ##### Hero Area End ##### -->



<!--============================메인화면 상품리스트 Area==========================  -->
     <div class="section-heading text-center">
         <h2>Best Deals</h2>
         <p>실시간으로 가장 인기있는 골프용품을 바로 즐겨보세요.</p>
     </div>

	
	<!-- ##### Shop Area Start ##### -->
<section class="shop-page section-padding-0-100" style="width: 80%; margin: auto;">


	<!-- All Products Area -->
	<div class="col-12 col-md-8 col-lg-9" style="margin: auto;"
		id="products">
		<div class="shop-products-area">
			<div class="row">
				<!-- Single Product Area -->
				<!-- for문으로 상품 리스트 반복  -->
				<c:forEach var="vo" items="${productList }" begin="0" end="5">
					<div class="col-12 col-sm-6 col-lg-4">
						<div class="single-product-area mb-50">
							<!-- Product Image -->
							<div class="product-img">
								<a href="${pageContext.request.contextPath }/product/productDetail?prod_num=${vo.prod_num}">
									<img src="${pageContext.request.contextPath }/resources/product_img/${vo.prod_img}">
								</a>
								<!-- Product Tag -->
								<div class="product-tag">
									<!-- <a href="#">Hot</a> -->
								</div>
<!-- 								<div class="product-meta d-flex"> -->
<!-- 									<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a> -->
<!-- 									<a href="cart.html" class="add-to-cart-btn">Add to cart</a> <a -->
<!-- 										href="#" class="compare-btn"><i -->
<!-- 										class="arrow_left-right_alt"></i></a> -->
<!-- 								</div> -->
							</div>
							<!-- Product Info -->
							<div class="product-info mt-15 text-center">
								<a href="${pageContext.request.contextPath }/product/productDetail?prod_num=${vo.prod_num}">
									<p>${vo.prod_name }</p>

								</a>
								<h6>${vo.price }원</h6>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- for문으로 상품 리스트 반복  -->


			</div>
		</div>
	</div>
	<!-- 		</div> -->
	<!-- 	</div> -->
</section>


<!--============================메인화면 상품리스트 Area==========================  -->
  <!-- ##### 나의 위치 정보 버튼 영역 ##### -->
    <section class="subscribe-newsletter-area" style="background-image: url(${pageContext.request.contextPath }/resources/img/bg-img/subscribe.png);">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-12 col-lg-5">
                    <!-- Section Heading -->
                    <div class="section-heading mb-0">
                        <h2>My Current Location</h2>
                        <p>나의 위치를 설정하세요.</p>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="subscribe-form">
                       
                       
                       <button class="idCheck btn alazea-btn w-80" id="address" value="N" style="width:360pt;height:40pt; margin:auto;" onclick="clickBtn()">my location</button>
                       
                       
                    </div>
                </div>
            </div>
        </div>

        
    </section>
    <!-- ##### 나의 위치 정보 버튼 영역 ##### -->

    <a name="screen_golf"></a>
  
    <!-- ##### 스크린 골프장 찾기 ##### -->
    <section class="contact-area section-padding-100-0">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-12 col-lg-5">
                    <!-- Section Heading -->
                    <div class="section-heading">
                        <h2>내 주변 스크린 골프장 찾기</h2>
                        <p>주변에 위치한 스크린 골프장을 찾아 보세요.</p>
                    </div>
                    <!-- Contact Form Area -->
                    <div class="contact-form-area mb-100">
                        <form action="#" method="post">
                            <div class="row">
                               
                                <div class="col-12">
                                </div>
                                <input type="hidden" id="latVal" value="1">
                                <input type="hidden" id="lngVal" value="1">
                                <input type="hidden" id="centerAddr" value="1">
                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-12 col-lg-6">
                    <!-- Google Maps -->
                    <div class="map-area mb-100">
                     <div id="map" style="width:100%;height:350px;"></div>

							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9848c8896187625882fecd73a68b8c43&libraries=services"></script>
							<script>
							$(window).on('load', function() {
								// 주소명 가져오기
								function getAddr(lat, lng){

								     let geocoder = new kakao.maps.services.Geocoder();

								     let coord = new kakao.maps.LatLng(lat, lng);
								     let callback = function(result, status) {
								         if (status === kakao.maps.services.Status.OK) {
								        	 	$('#centerAddr').val(result[0].address.address_name);
								        	 	var addr = result[0].address.address_name;
								        	 	console.log(addr);
								        	 	$.ajax({
								        	 		url: "./product/address",
								        	 		data: {"address":result[0].address.address_name},
								        	 		success: function(){
								        	 			alert("성공");
								        	 		},
								        	 		error: function(e){
								        	 			console.log(e);
								        	 		}
								        	 	});
								        	 	
												return result[0].address.address_name;
								        	 	
								         } else {
											alert('위도 경도를 불러오는데 실패하였습니다.');
										 }
								     }
								     geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
								}
								
								function getCurrentPlace(){
									window.navigator.geolocation.getCurrentPosition(function(position){
										
										var lat = position.coords.latitude;
										var lng = position.coords.longitude;
										
										$('#latVal').val(lat);
										$('#lngVal').val(lng);
										getAddr(lat, lng);
								},
								function(error){
										switch(error.code){
										case error.PERMISSION_DENIED:
											str="사용자 거부";
											break;
										case error.POSITION_UNAVAILABLE:
											str="지리정보 없음";
											break;
										case error.TIMEOUT:
											str="시간 초과";
											break;
										}
									});
								}
								getCurrentPlace();
								
								function interval() {
									
									if($('#latVal').val() != 1 && $('#centerAddr').val() != 1) {
										stop();
										var lat = $('#latVal').val();
										var lng = $('#lngVal').val();
										var centerAddr = $('#centerAddr').val();
										// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
										var infowindow = new kakao.maps.InfoWindow({zIndex:1});
										
										var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										    mapOption = {
										        center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };  
										
										// 도로명 주소 가져오기
										
										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption); 
										
										// 장소 검색 객체를 생성합니다
										var ps = new kakao.maps.services.Places(); 
										
										// 키워드로 장소를 검색합니다
										ps.keywordSearch(centerAddr + ' 근처 스크린골프', placesSearchCB); 
										
										// 키워드 검색 완료 시 호출되는 콜백함수 입니다
										function placesSearchCB (data, status, pagination) {
										    if (status === kakao.maps.services.Status.OK) {
										        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
										        // LatLngBounds 객체에 좌표를 추가합니다
										        var bounds = new kakao.maps.LatLngBounds();
										
										        for (var i=0; i<data.length; i++) {
										            displayMarker(data[i]);    
										            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
										        }       
										
										        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
										        map.setBounds(bounds);
										    } 
										}
										
										// 지도에 마커를 표시하는 함수입니다
										function displayMarker(place) {
										    
										    // 마커를 생성하고 지도에 표시합니다
										    var marker = new kakao.maps.Marker({
										        map: map,
										        position: new kakao.maps.LatLng(place.y, place.x) 
										    });
										
										    // 마커에 클릭이벤트를 등록합니다
										    kakao.maps.event.addListener(marker, 'click', function() {
										        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
										        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
										        infowindow.open(map, marker);
										    });
										}	
									}
								}
								
								function stop(){
									clearInterval(interval);
								}
								
								var interval = setInterval(interval, 300);
								
							});
							

							</script>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### 스크린 골프장 찾기 ############################################################### -->
    
    <!--############################ 나의 위치 정보 함수영역 ########################## -->
    <script>

	

function clickBtn(){
	window.navigator.geolocation.getCurrentPosition(function(position){
		
		var lat = position.coords.latitude;
		var lng = position.coords.longitude;
		
		console.log('address.jsp clickBtn');
		
		
		// 카카오 api test
		getAddr(lat,lng);
		
		//document.getElementById('target').innerHTML=lat+","+lng;
		console.log(lat+","+lng);
		console.log(position);
		// document.write(lat +","+ lng);

	},
	function(error){
		switch(error.code){
		case error.PERMISSION_DENIED:
			str="사용자 거부";
			break;
		case error.POSITION_UNAVAILABLE:
			str="지리정보 없음";
			break;
		case error.TIMEOUT:
			str="시간 초과";
			break;
		}
		document.getElementById('target').innerHTML=str;
		
// 		document.write(lat);
// 		document.write(lng);
	});
}

function getAddr(lat,lng){
     let geocoder = new kakao.maps.services.Geocoder();

     let coord = new kakao.maps.LatLng(lat, lng);
     let callback = function(result, status) {
         if (status === kakao.maps.services.Status.OK) {
				console.log(result[0].address.address_name);
				sendAddr(result[0].address.address_name);
         }else {
			//console.log('통신 실패');
			alert('위도 경도를 불러오는데 실패하였습니다.');
		 }
     }
     geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
 }
 
function sendAddr(address) {
	console.log('sendAddrfunction in');
	 $.ajax({
		 type: "POST",
		 url: "/member/sendAddr",
		 data: {
			 "address" : address
		 },
		 success: function(result) {
			 console.log(result);
			 if(result == 1) {
				 alert("위치 정보를 저장하였습니다.");
				 location.href('/member/mypage');
				 // location.href='/member/mypage
			 }
			 
			 if(result == 2) {
				 alert("로그인이 필요합니다.");
				 location.href('/member/login');
			 }
		 },
		 error : function(request, status, error) {
			 alert('서버 에러 발생');
		 }
	 })
	 
	 
 }
 
 

</script>


<!-- <h3 id="target">location</h3> -->
	


	
    
    <!--############################ 나의 위치 정보 함수 영역########################## -->
    
    
    
    
   
<%@ include file="./include/footer.jsp" %>


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
</body>

</html>