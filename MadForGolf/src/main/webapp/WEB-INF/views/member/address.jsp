<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %> 
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.2/proj4.js" type="text/javascript"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9848c8896187625882fecd73a68b8c43&libraries=services">
</script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#address').submit(function(){ 
	// 주소 정보 제어
			if ($('#roadFullAddr').val() == '') {
				alert("주소 정보를 저장하세요.");
				return false;
			}
		}); 
}); 
</script>


<!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${pageContext.request.contextPath }/resources/img/bg-img/golf-2704608.jpg);">
            <h2>Address</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                        	<li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item"><a href="/member/mypage"> Mypage </a>
                            <li class="breadcrumb-item active" aria-current="page">Address</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->



<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->

</head>
<body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

// 카카오 주소api 호출
function goPopup(){
    new daum.Postcode({
        oncomplete: function(data) { //선택시 입력값 세팅
            document.getElementById("roadFullAddr").value = data.address; // 주소 넣기
        }
    }).open();
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
                  , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
   document.form.roadFullAddr.value = roadFullAddr;
}

</script>
<!--
<script>



$(document).ready(function() {

   
});
</script>   
   
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
      
//       document.write(lat);
//       document.write(lng);
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
 
 

// function onGeoOkay(position) {
//      console.log(position);
//    }

//    function onGeoError() {
//      alert("I can't find you. No weather for you.");
//    }

//    navigator.geolocation.getCurrentPosition(onGeoOkay, onGeoError);
   

   

// ---------------------------------------------------------------------------------------------


// ▼ address 페이지에 위도, 경도 값 출력되는 코드
//    $(document).ready(function(){
      
//       if ("geolocation" in navigator) {   /* geolocation 사용 가능 */
//          navigator.geolocation.getCurrentPosition(function(data) {
         
//             var latitude = data.coords.latitude;
//             var longitude = data.coords.longitude;
            
//             $('#latitude').text(latitude);
//             $('#longitude').text(longitude);
//          }, function(error) {
//             alert(error);
//          }, {
//             enableHighAccuracy: true,
//             timeout: Infinity,
//             maximumAge: 0
//          });
//       } else {   /* geolocation 사용 불가능 */
//          alert('geolocation 사용 불가능');
//       }
      
//    });


</script>
-->

<!-- <h3 id="target">location</h3> -->
   

   
   

   <!-- ##### Checkout Area Start ##### -->
   <div class="checkout_area mb-100">
      <div class="container">
         <div class="row justify-content-between">
            <div class="col-12 col-lg-7" style="margin: auto;">
               <div class="checkout_details_area clearfix">
               
                  <div>
                     <h2>Address Check</h2><br><br><br>
                  <form name="form" action="/member/address" id="address" name="address" class="totalform" method="post">
                     <div class="row">
                        <div class="col-12 mb-4">
                           <label for="email_address">우리동네(Town) *</label> 
                           <input type="hidden" id="confmKey" name="confmKey" value=""  >
                           <input type="text" class="form-control" id="roadFullAddr" name="roadFullAddr"  value="" placeholder="주소검색을 눌러 우리동네를 설정하세요." readonly="readonly"><br>
                           <button type="button" class="btn alazea-btn w-80" style="width:50pt;height:30pt;" onclick="goPopup();">주소검색</button> <br>
                           <br>
                           <button class="btn alazea-btn w-120" style="width:360pt;height:40pt;margin:auto;">저장하기</button>
                           </div><br><br><br>
                        </div>
                  	</form><br><br><br>
                     </div>                        
               </div>
            </div>
         </div>
      </div>
   </div>
</body>

<%@ include file="../include/footer.jsp" %>





   