<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- JSTL사용  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>

<style type="text/css">
#empty_box{
	height:800px; 
	color: 52734D;
	font-weight: bold;
	font-size: 20px;
}
#topMenu {
	height: 30px;
	width: 1100px;
}

#topMenu .women {
	margin-bottom: 0px;
}

#topMenu ul li {
	list-style: none;
	color: #FBF2CF;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	text-decoration: none;
	color: white;
	display: block;
	width: 150px;
	font-size: 16px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
	background-color: #C6EBC5;
}

#topMenu .menuLink1 {
	text-decoration: none;
	color: white;
	display: block;
	width: 150px;
	font-size: 16px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
	background-color: #A1C298;
}

#topMenu .menuLink3 {
	text-decoration: none;
	color: white;
	display: block;
	width: 150px;
	font-size: 16px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
	background-color: white;
}

#topMenu .menuLink:hover {
	color: #FBF2CF;
	background-color: #F8C4B4;
}

/*=======최신순 인기순 마우스오버=================  */
.date_like:hover {
	color: #F8C4B4 !important;
	font-weight: bolder;
	cursor: pointer;
}
/*=======최신순 인기순 마우스오버=================  */

/*===============상품올리기 버튼========================  */
@import
	url(https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700)
	;

* /


.fonts {
	font-family: 'Josefin Slab', serif;
}

/* 헤더도 연동되기 때문에 주석 */
/* body {
	font-family: 'Josefin Slab', serif;
	font-size: 20px;
	line-height: 24px;
	color: #333;
	background: #C6EBC5;
	overflow-y: scroll;
} */
p {
	margin-bottom: 0.5em;
}

a, a:visited {
	text-decoration: none;
	color: #F8C4B4;
}

.clear {
	clear: both;
}

.pageTitle {
	font-size: 2em;
	font-weight: 700;
	text-transform: uppercase;
	line-height: 1em;
	color: #C6EBC5;
}

.pageSubTitle {
	margin-bottom: 0.5em;
	font-size: 1.3em;
	font-weight: 700;
	line-height: 1em;
	color: #222;
}

.articleTitle {
	font-size: 1.15em;
	font-weight: 700;
	line-height: 1em;
	color: #222;
}

.wrapper {
	width: 600px;
	margin: 20px auto;
}

/* 헤더가 깨지기 때문에 주석 */
/* .container {
  padding-top: 1em;
  margin-top: 1em;
  border-top: 
    solid
    1px
    #CCC;
} */
a.button {
	display: block;
	position: relative;
	float: left;
	width: 120px;
	padding: 0;
	margin: 10px 20px 10px 0;
	font-weight: 600;
	text-align: center;
	line-height: 50px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
}

.btnBlueGreen {
	background: #C6EBC5;
}

.btnLightBlue {
	background: #5DC8CD;
}

.btnOrange {
	background: #FFAA40;
}

.btnPurple {
	background: #A74982;
}

/* FADE */
.btnFade.btnBlueGreen:hover {
	color: white;
	background: #F8C4B4;
	font-weight: bolder;
	cursor: pointer;
}

.btnFade.btnLightBlue:hover {
	background: #01939A;
}

.btnFade.btnOrange:hover {
	background: #FF8E00;
}

.btnFade.btnPurple:hover {
	background: #6D184B;
}

/* 3D */
.btnBlueGreen.btnPush {
	box-shadow: 0px 5px 0px 0px #007144;
}

.btnLightBlue.btnPush {
	box-shadow: 0px 5px 0px 0px #1E8185;
}

.btnOrange.btnPush {
	box-shadow: 0px 5px 0px 0px #A66615;
}

.btnPurple.btnPush {
	box-shadow: 0px 5px 0px 0px #6D184B;
}

.btnPush:hover {
	margin-top: 15px;
	margin-bottom: 5px;
}

.btnBlueGreen.btnPush:hover {
	box-shadow: 0px 0px 0px 0px #007144;
}

.btnLightBlue.btnPush:hover {
	box-shadow: 0px 0px 0px 0px #1E8185;
}

.btnOrange.btnPush:hover {
	box-shadow: 0px 0px 0px 0px #A66615;
}

.btnPurple.btnPush:hover {
	box-shadow: 0px 0px 0px 0px #6D184B;
}

/* BORDER */
.btnBlueGreen.btnBorder {
	box-shadow: 0px 0px 0px 0px #C6EBC5;
}

.btnBlueGreen.btnBorder:hover {
	box-shadow: 0px 0px 0px 5px #F8C4B4;
}

.btnLightBlue.btnBorder {
	box-shadow: 0px 0px 0px 0px #01939A;
}

.btnLightBlue.btnBorder:hover {
	box-shadow: 0px 0px 0px 5px #01939A;
}

.btnOrange.btnBorder {
	box-shadow: 0px 0px 0px 0px #A66615;
}

.btnOrange.btnBorder:hover {
	box-shadow: 0px 0px 0px 5px #A66615;
}

.btnPurple.btnBorder {
	box-shadow: 0px 0px 0px 0px #6D184B;
}

.btnPurple.btnBorder:hover {
	box-shadow: 0px 0px 0px 5px #6D184B;
}

/* FLOAT */
.btnFloat {
	background: none;
	box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.5);
}

.btnFloat:before {
	content: 'Float';
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 120px;
	height: 50px;
	border-radius: 5px;
	transition: all 0.2s;
}

.btnBlueGreen.btnFloat:before {
	background: #F8C4B4;
}

.btnLightBlue.btnFloat:before {
	background: #5DC8CD;
}

.btnOrange.btnFloat:before {
	background: #FFAA40;
}

.btnPurple.btnFloat:before {
	background: #8D336A;
}

.btnFloat:before {
	box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.4);
}

.btnFloat:hover:before {
	
}

.btnFloat:hover:before {
	margin-top: -2px;
	margin-left: 0px;
	transform: scale(1.1, 1.1);
	-ms-transform: scale(1.1, 1.1);
	-webkit-transform: scale(1.1, 1.1);
	box-shadow: 0px 5px 5px -2px rgba(0, 0, 0, 0.25);
}

/* SLIDE */
.btnSlide.btnBlueGreen {
	background: 0;
}

.btnSlide .top {
	position: absolute;
	top: 0px;
	left: 0;
	width: 120px;
	height: 50px;
	background: #C6EBC5;
	z-index: 10;
	transition: all 0.2s;
	border-radius: 5px;
}

.btnSlide.btnBlueGreen .top {
	background: #C6EBC5;
}

.btnSlide.btnLightBlue .top {
	background: #5DC8CD;
}

.btnSlide.btnOrange .top {
	background: #FFAA40;
}

.btnSlide.btnPurple .top {
	background: #A74982;
}

.btnSlide .bottom {
	position: absolute;
	top: 0;
	left: 0;
	width: 120px;
	height: 50px;
	color: #000;
	z-index: 5;
	border-radius: 5px;
}

.btnSlide:hover .top {
	top: 40px;
}
/*===============상품올리기 버튼========================  */

/*====================반응형 웹======================= */
@media only screen and (max-width: 767px) {
 	#topMenu #genderNav {
		width: 112px;
		height: 100%;
		float: left;
		margin: auto;
	}
 	#topMenu #genderNav2 {
		width: 112px;
		height: 100%;
		float: left;
		margin: auto;
	}
	
	#topMenu{
		width: 100%;
		text-align: center;
		margin: 0px;
		padding: 0px;
		
	}
	

	.col-12 #array {
		width: 100%;
		height: 100px;
		padding: 0px;
		margin: 0px;
		float: right;
	}
	#ProductArea {
		width: 150px;
	}
	#ProductAreaPage {
		width: 45px;
	}
	.product-img {
		width: 100px;
		text-align: center;
	}
	.single-product-area mb-50 {
		width: 100px;
		text-align: center;
	}
	.col-12 col-sm-6 col-lg-4 {
		width: 100px;
		text-align: center;
	}
	
	#topMenu11 {
		width: 40%;
	}
	
	.shop-page section-padding-0-100 .container{
		margin: 0px;
		padding: 0px;
	}
	
	.container {
		text-align: center;
	}
	
	.col-12 col-md-8 col-lg-9{
		width: 100%;
		text-align: center;
		margin: 0px auto;
	}
	
	 .col-12 col-md-8 col-lg-9 .row{

		display: inline;
	}
	
	.col-12 col-md-8 col-lg-9{
		text-align: center;
		margin: 0px auto;
	}
	
	.col-12 col-sm-6 col-lg-4 .single-product-area mb-50 {
		display: inline;
	}

	 
	 .product-info mt-15 text-center {
	 	display: flex;
	 }
	
	#row1028 {
		width: 630px !important; 
		margin: 0px auto !important;
	}
	
	#writeProduct {
		margin-left: 500px !important;
	}
	
	#container1{
		margin: 0px !important;
	}
	
	#container2{
		margin: 0px auto !important;
	}

@media only screen and (max-width: 414px) { /* 414*896  */
	#topMenu #genderNav {
		width: 59px !important;
		height: 100%;
		float: left;
		margin: auto;
	}
 	#topMenu #genderNav2 {
		width: 59px !important;
		height: 100%;
		float: left;
		margin: auto;
	}
	
	#row1028 {
		width: 330px !important; 
		margin: 0px auto !important;
	}
	
	#writeProduct {
		margin-left: 200px !important;
	}
	
	#container1{
		margin: 0px !important;
	}
	
	#container2{
		margin: 0px auto !important;
	}
	#img{
		margin-left:50px;
	}
	#ProductArea{
		margin-right:28px;
	}
	.ProductArea{
		margin-left:60px;
	}
	.pagination .page-item .page-link{
		width: 20px !important;
		height: 20px !important;
		border: none !important;
		font-size: 20px;`
	}
	#img1 {
		height: auto !important;
    	max-width: 100% !important;
    	margin-left: 55px !important;
	}
	

}
/*====================반응형 웹======================= */
</style>

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url('/resources/img/bg-img/background-img (4).jpg');">            <h2>Shop</h2>
        </div>

        <div class="container" style="margin: auto; width: 100%; border: 2px; red; " id="container1">
            <div class="row">
                <div class="col-12" style="margin: auto; width: 100%; ">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Shop</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
	<!-- ##### Breadcrumb Area End ##### -->
	
	<!-- =================================남성용/여성용 성별 구분 상품 카테고리=========================================== -->
	<div style="text-align: center; margin: 0px auto; height: 70px; width: 1050px;" id="topMenu11">
		<nav id="topMenu" style="margin: 0px auto;">
        	<ul>
        	<!-- 지역인증 완료되면 주솟값에 위도/경도 추가 -->
				<!-- 남성용  -->
                <li><a id="genderNav" class="menuLink1" style="border-top-left-radius: 5px;"> Men's </a></li>
                <li><a id="genderNav" class="menuLink" href="${pageContext.request.contextPath }/product/listAll?category=Driver&gender=1">Driver</a></li>
                <li><a id="genderNav" class="menuLink" href="${pageContext.request.contextPath }/product/listAll?category=Iron&gender=1">Iron</a></li>
                <li><a id="genderNav" class="menuLink" href="${pageContext.request.contextPath }/product/listAll?category=Utility&gender=1">Utility</a></li>
                <li><a id="genderNav" class="menuLink" href="${pageContext.request.contextPath }/product/listAll?category=Wedge&gender=1">Wedge</a></li>
                <li><a id="genderNav" class="menuLink" href="${pageContext.request.contextPath }/product/listAll?category=Putter&gender=1">Putter</a></li>
                <li><a id="genderNav" class="menuLink" style="border-top-right-radius: 5px;" href="${pageContext.request.contextPath }/product/listAll?category=Etc&gender=1">Etc</a></li>
			</ul>
		</nav>
		
		<nav id="topMenu" style="margin: 0px auto;">
			<ul>
               	<!-- 여성용 -->
               	<li><a id="genderNav2" class="menuLink1" style="border-bottom-left-radius: 5px;"> Women's </a></li>
                <li><a id="genderNav2" class="menuLink" href="${pageContext.request.contextPath }/product/listAll?category=Driver&gender=2">Driver</a></li>
                <li><a id="genderNav2" class="menuLink" href="${pageContext.request.contextPath }/product/listAll?category=Iron&gender=2">Iron</a></li>
                <li><a id="genderNav2" class="menuLink" href="${pageContext.request.contextPath }/product/listAll?category=Utility&gender=2">Utility</a></li>
                <li><a id="genderNav2" class="menuLink" href="${pageContext.request.contextPath }/product/listAll?category=Wedge&gender=2">Wedge</a></li>
                <li><a id="genderNav2" class="menuLink" href="${pageContext.request.contextPath }/product/listAll?category=Putter&gender=2">Putter</a></li>
                <li><a id="genderNav2" class="menuLink" style="border-bottom-right-radius: 5px;" href="${pageContext.request.contextPath }/product/listAll?category=Etc&gender=2">Etc</a></li>
                <li><a id="genderNav2" class="menuLink3">&nbsp;</a></li>
                <li><a id="genderNav2" class="menuLink3">&nbsp;</a></li>
			</ul>
        </nav>

   	</div>
	<!-- =================================남성용/여성용 성별 구분 상품 카테고리===========================================   -->
	
	<c:choose>
		<c:when test="${empty productList}">
			<div class="container" id="empty_box">해당 지역은 아직 등록된 상품이 없습니다.</div>
		</c:when>
		
		<c:when test="${!empty productList}">
		

	
	<!-- ##### Shop Area Start ##### -->
	<section class="shop-page section-padding-0-100" style="width: 80%; margin: auto;" id="container2">
        <div class="container" >
            <div class="row">
                <!-- Shop Sorting Data -->
                <div class="col-12"  style="width: 98%; margin: auto;">
					<div class="search_by_terms" style="float: right;">
						<!-- 인기순,최신순 선택바 div  -->
						<div id="array" style="float: right;"> 
							<form action="#" method="post" class="form-inline">
                                <a  class="date_like" style="color:#A1C298; font-size: 15px;" href="${pageContext.request.contextPath }/product/listAll?category=${category}&gender=${gender}">최신순</a>
                 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a  class="date_like" style="color:#A1C298; font-size: 15px;" href="${pageContext.request.contextPath }/product/listLike?category=${category}&gender=${gender}">인기순</a>
                            </form>
                        </div>    
					</div>
				</div>
			</div>
		</div>
		
        <!-- All Products Area -->
        <div class="col-md-8 col-lg-9" style="margin: auto;" id="products">
        	<div class="row" id="row1028" style="width: 910px; margin: 0px auto;">
				<!-- Single Product Area -->
				<!-- for문으로 상품 리스트 반복  -->
				<c:forEach var="vo" items="${productList }">
					<div class="col-sm-4 col-lg-4" style="border: 3px red;"> 
						<div class="single-product-area mb-50" style="margin-top: 25px;">
							<!-- Product Image -->
							<div class="product-img"> 
								<a id="ProductArea" href="${pageContext.request.contextPath }/product/productDetail?prod_num=${vo.prod_num}"><img style="width: 300px; height: 300px;" src="${pageContext.request.contextPath }/resources/product_img/${vo.prod_img}" id="img1"></a>
								<!-- Product Tag -->
								<div class="product-tag">
									<!-- <a href="#">Hot</a> -->
								</div>
								<!-- <div class="product-meta d-flex">
									<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
									<a href="cart.html" class="add-to-cart-btn">Add to cart</a>
									<a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
								</div> -->
							</div>
							<!-- Product Info -->
							<div class="product-info mt-15 text-center">
								<p style="width: 100%;"> 
								<a id="ProductArea" href="${pageContext.request.contextPath }/product/productDetail?prod_num=${vo.prod_num}" style="color: black;">
									${vo.prod_name }
								</a> 
								</p>
								<h6 id="ProductArea" class="ProductArea">
								&#8361;<fmt:formatNumber value="${vo.price }"  pattern="###,###" /> 
								</h6>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- for문으로 상품 리스트 반복  -->
				<!-- 상품 올리기 div  -->
				<c:if test="${user_id != null}">
                   <div style="float: right; margin-bottom: 60px; width: 100px; margin-left: 835px;" id="writeProduct">
<%-- 				<input type="button" title="Button fade blue/green" class="button btnFade btnBlueGreen" value="상품올리기" onclick="location.href='${pageContext.request.contextPath }/product/productInsert'"> --%>
				    <a title="Button fade blue/green" class="button btnFade btnBlueGreen" onclick="location.href='${pageContext.request.contextPath }/product/productInsert'">상품올리기</a>
					</div>        
				</c:if>
			</div>
<!-- ======================================== 페이징 네비바 ======================================== -->
			<!-- Pagination -->
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${pm.prev }">
						<!-- ${pm.prev }결과가 참(true)일 때 -->
						<li class="page-item"><a id="ProductAreaPage" class="page-link" href="listAll?page=${pm.startPage-1 }&category=${category }&gender=${gender}"><i class="fa fa-angle-left"></i></a></li>
						<!-- 현재 위치한 페이지 블럭의 첫번째 페이지보다 -1인 페이지로 이동  -->
							</c:if>
								<c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
								<li class="page-item" <c:out value="${pm.vo.page == idx?'class=active':'active' }"/>>
								<a id="ProductAreaPage" class="page-link" href="listAll?page=${idx }&category=${category }&gender=${gender}">${idx }</a></li>
							</c:forEach>
							
							<c:if test="${pm.next }">
								<!-- ${pm.next }결과가 참(true)일 때  -->
								<li class="page-item"><a id="ProductAreaPage" class="page-link" href="listAll?page=${pm.endPage+1 }&category=${category }&gender=${gender}"><i class="fa fa-angle-right"></i></a></li>
								<!-- 현재 위치한 페이징 블럭의 마지막 페이지보다 +1인 페이지로 이동  -->
							</c:if>
						</ul>
					</nav>
<!-- ======================================== 페이징 네비바 ======================================== -->
			</div>
<!-- 	</div> -->
<!-- </div> -->
</section>
		</c:when>
	</c:choose>
    <!-- ##### Shop Area End ##### -->
<%@ include file="../include/footer.jsp" %>