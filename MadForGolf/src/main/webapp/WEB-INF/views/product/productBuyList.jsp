<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!-- header -->
<jsp:include page="../include/header.jsp" />
<!-- header -->
   
   
<style>
.container_box{
/* 	border: 5px solid black; */

}
.writeBtn_box{
/* 	border: 5px solid red; */
	display: flex;
	flex-flow: row nowrap;
	justify-content: right;	
	width: 100%;
	margin-bottom: 10px;
}

.writeBtn{
	width: 100px;
	height : 40px;
	border-radius: 3px;
	color: white;
	text-align: center;
	padding: 10px;
	background-color : #C6EBC5;
}

.writeBtn:hover{
	background-color : #FA7070;
	color: white;
	

}

.category_list{
/* 	border: 5px solid green; */
	display: flex;
	flex-flow: row wrap;
	justify-content: center;	
}

.category_btn{
	width: 100px;
	height : 40px;
	color: white;
	text-align: center;
	padding: 10px;
	background-color : #C6EBC5;

}

.category_btn:NTH-OF-TYPE(1){
	border-radius: 5px 0 0 5px; 

}

.category_btn:NTH-OF-TYPE(3){
	border-radius: 0 5px 5px 0;

}

.category_btn:hover{
	background-color : #91C788;
	color: white;

}

.category_btn div{
 	font-size: 15px;
 	font-weight: bold;
}


.table_box{
/* 		border: 5px solid yellow; */
		margin-top: 10px;
}

.page_box{
/* 	border: 5px solid blue; */
	margin-bottom: 20px;
}

#page-link_real:hover{
	background-color: #C6EBC5;
	boder-color: #C6EBC5;
}


@media only screen and (max-width: 767px){
	.pagination{
/* 			border: 5px solid blue; */
		
	}
	
	.page-item{
/* 			border: 5px solid red; */
	
	}
	#page-link_real{
/* 			border: 5px solid yellow; */
			font-size: 15px;
			width: 30px;
			height: 30px;
			padding: 0px;
			margin: 0 5px;
			border-radius: 3px;
			
	
	}
		
}

.btn{cursor: pointer; margin: 0 5px;}
.reviewBtnCancle{
 /* display: none; */
}
.reviewWrite {
background-color: #91C788;
color: #fff;
}

.myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}
.myform fieldset legend{
    text-align: left;
}
.myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
.myform label{
    font-size: 3em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
    cursor: pointer;
}
.myform label:hover{
    text-shadow: 0 0 0 #ffc107; /* 마우스 호버   ++ 색상 변경*/
}
.myform label:hover ~ label{
    text-shadow: 0 0 0 #ffc107; /* 마우스 호버 뒤에오는 이모지들 ++ 색상 변경 */
}
.myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #ffc107; /* 마우스 클릭 체크  ++ 색상 변경 */
}
.readonly{background: #ececec}

.btn-review-write{
background: #FA7070;
color: #fff;
}
.btn-review-write:hover{
 background: #cb3b2c;
 box-shadow: 5px 5px 5px rgba(0,0,0,0.3);
}
 .btn-review-info{
 	background: #91C788;
	color: #fff;
 }
 .btn-review-info:hover , .reviewWrite:hover{
 	background: #52734D;
 	box-shadow: 5px 5px 5px rgba(0,0,0,0.3);
 }
 
.reviewBtnCancle{
 	background: #343a40;
	color: #fff;
}
 
 .reviewBtnCancle:hover{
 	background: #000;
	box-shadow: 5px 5px 5px rgba(0,0,0,0.3);
}
 
 
.page-item.active .page-link {
    border-color: #91C788;
    background-color: #91C788;
    color: #ffffff;
}


@media only screen and (max-width: 414px) { /* 414*896  */
	.table th{
		font-size: 14px !important;
	}
	#prod_name{
		width: 130px !important;
	}
	#review{
		width: 100px !important;
	}

	.btn btn-review-write{
		width: 65px !important;
		height: 35px !important;
		font-size: 10px !important;
		text-align: center !important;
		margin-left: 5px !important;
	}
}
</style>
   
     <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url('/resources/img/bg-img/background-img (4).jpg');">            <h2>거래목록</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item"><a href="/member/mypage"> MyPage</a></li>
                            <li class="breadcrumb-item active" aria-current="page"> DealList</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

<div class="container container_box">


	

  	<!-- category 클릭 시 말머리별 게시글 리스트만 뜨도록 구현 -->
 	<div class="category_list">
 		<a class="category_btn" href="/product/listProductAll?page=1"><div>판매내역</div></a>
 		<a class="category_btn" href="/product/listProductBuy?page=1"><div>구매내역</div></a>
 		<a class="category_btn" href="/product/listProductDealing?page=1"><div>거래중</div></a>
	</div>
   
   
  <!--  #####  게시글 리스트 시작   ##### --> 
	<div class="table_box">
	
		<table class="table">
			<tbody>
			
				<tr class="text-center">
					<th>거래일시</th>
					<th id="prod_name">상품이름</th>
					<th>가격</th>
					<th id="review">리뷰</th>
				</tr>
			<c:forEach var="buy" items="${buyProductList }"> 
				<tr>
					<td>${buy.deal_date }</td>
					<td><a href="/product/productDetail?prod_num=${buy.product.prod_num}">${buy.product.prod_name }</a></td>
					<td >
					 &#8361;<fmt:formatNumber value="${buy.product.price }"  pattern="###,###" /> 
					</td>
					<td class="text-center">
				    <c:choose>
				    	<c:when test="${buy.review_count==0}">
				    		<button class="btn btn-review-write" id="reviewBtn-${buy.product.prod_num}" onclick="reviewBtn('${buy.product.prod_num}')">리뷰 작성</button>	
				    	</c:when>
				    	<c:otherwise>
				    		<button class="btn btn-review-info" id="getReview-${buy.product.prod_num}"
				    		 onclick="getReviewInfo('${buy.product.prod_num}')">리뷰보기</button>	
				    	</c:otherwise>
				    </c:choose>			
								
								
					</td>
<%-- 					<td>
						<a href="/board/boardRead?board_num=${vo.prod_num}">${vo.title }</a></td>
					<td>조인해오기</td>
					<td>
						<fmt:formatDate value="${vo.write_date }" pattern="yy-MM-dd HH:mm"/>
					</td>
					<td>${vo.readcount}</td> --%>
				</tr>
				<tr id="tr-${buy.product.prod_num}" style="display: none">
					<!--  리뷰 작성 하기 -->
					<td colspan="4" style="text-align: center; " class="myform">
					<fieldset>				     
				        <input type="radio" name="rating" value="5" id="rate1-${buy.product.prod_num}"><label for="rate1-${buy.product.prod_num}">⭐</label>
				        <input type="radio" name="rating" value="4" id="rate2-${buy.product.prod_num}"><label for="rate2-${buy.product.prod_num}">⭐</label>
				        <input type="radio" name="rating" value="3" id="rate3-${buy.product.prod_num}"><label for="rate3-${buy.product.prod_num}">⭐</label>
				        <input type="radio" name="rating" value="2" id="rate4-${buy.product.prod_num}"><label for="rate4-${buy.product.prod_num}">⭐</label>
				        <input type="radio" name="rating" value="1" id="rate5-${buy.product.prod_num}"><label for="rate5-${buy.product.prod_num}">⭐</label>
				    </fieldset>
						<input type="hidden" id="deal_num-${buy.product.prod_num}" value="${buy.deal_num}" >
						<textarea style="width: 100%; min-height:200px " id="content-${buy.product.prod_num}"></textarea>
						
						<button class="btn reviewBtnCancle" id="reviewBtnCancle-${buy.product.prod_num}"
						 onclick="reviewBtnCancle('${buy.product.prod_num}')">리뷰작성 취소</button>
						
						<button class="btn reviewWrite" id="reviewBtnCancle-${buy.product.prod_num}"
						 onclick="reviewWrite('${buy.product.prod_num}')">리뷰작성 하기</button>
					</td>
				</tr>
				
				<tr id="tr-getReview-${buy.product.prod_num}" style="display: none">
				<td colspan="4" style="text-align: center; " class="myform">	
					<!-- 작성한 리뷰 보기 -->
					<fieldset onclick="return false;">				     
				        <input type="radio" readonly name="rating" value="5" id="rate1-2-${buy.product.prod_num}"><label for="rate1-2-${buy.product.prod_num}">⭐</label>
				        <input type="radio" readonly name="rating" value="4" id="rate2-2-${buy.product.prod_num}"><label for="rate2-2-${buy.product.prod_num}">⭐</label>
				        <input type="radio" readonly name="rating" value="3" id="rate3-2-${buy.product.prod_num}"><label for="rate3-2-${buy.product.prod_num}">⭐</label>
				        <input type="radio" readonly name="rating" value="2" id="rate4-2-${buy.product.prod_num}"><label for="rate4-2-${buy.product.prod_num}">⭐</label>
				        <input type="radio" readonly name="rating" value="1" id="rate5-2-${buy.product.prod_num}"><label for="rate5-2-${buy.product.prod_num}">⭐</label>
				    </fieldset>						    			
												
					<textarea style="width: 100%; min-height:200px " readonly="readonly"  class="readonly"></textarea>				
					<button class="btn reviewClose btn-review-info"  onclick="getReviewClose('${buy.product.prod_num}')">닫기</button>
					</td>
				</tr>
				
				
			</c:forEach>
			</tbody>
		</table>
	</div>	
	
<script>

//열린 리뷰 보기 및 작성하기 모두 닫기
function allClose(){
	$(".reviewClose").click();
	$(".reviewBtnCancle").click();
}

//한개 리뷰 정보 불러오기
function getReviewInfo(prodNum){ 	
	allClose();
	
	const parmData={
		deal_num:$("#deal_num-"+prodNum).val(),
		prod_num :prodNum			
	}
	
	console.log(parmData);
	
	$.ajax({
		url :"/product/getReviewInfo",
		type:"POST",
		data:parmData,
		success:function(res){
			if(!res){
				alert("리뷰 가져오기에 실패 했습니다.");
				return;
			}
			console.log(res);
			$("#tr-getReview-"+prodNum + " textarea").val(res.content);
			console.log(res.score);
			const score=parseInt(res.score);
			if(score===1){
				$("#rate5-2-"+prodNum).prop("checked", true);
			}else if(score===2){
				$("#rate4-2-"+prodNum).prop("checked", true);
			}else if(score===3){
				$("#rate3-2-"+prodNum).prop("checked", true);		
			}else if(score===4){
				$("#rate2-2-"+prodNum).prop("checked", true);
			}else{
				$("#rate1-2-"+prodNum).prop("checked", true);
			}
			
			
				
		},
		error:function(error){
			console.log(" 에러 : ", error);
		}		
		
	})
	
	 $("#getReview-"+prodNum).hide();	
	 $("#tr-getReview-"+prodNum).slideDown(200);		 
}

function getReviewClose(prodNum){
	$("#tr-getReview-"+prodNum).hide();
	$("#getReview-"+prodNum).show();
}


function reviewBtn(prodNum){ 	
	 //$("#reviewBtn-"+prodNum).hide();
	 allClose();
	 $("#tr-"+prodNum + "  textarea").val("");
	 $("#tr-"+prodNum).slideDown(200);	
	 
}


function reviewBtnCancle(prodNum){
	$("#tr-"+prodNum).hide();
	$("#reviewBtn-"+prodNum).show();
}


function reviewWrite(prodNum){
	const content =$("#content-"+prodNum).val();
	
	const parmData={
			deal_num:$("#deal_num-"+prodNum).val(),
			prod_num :prodNum,			
			content:content,
			score:$("#tr-"+prodNum + " input[name=rating]:checked" ).val()
	}
	
	//console.log("parmData  " ,parmData); 
	

	if(!parmData.score|| parseInt(parmData.score)==0){
		alert("별점을 선택해 주세요.");
		return;
	}
	if(!content){
		alert("내용을 입력해 주세요.");
		return;
	}
	
	
	$.ajax({
		url :"/product/buyProductWrite",
		type:"POST",
		data:parmData,
		success:function(res){
			if(res=="success"){
				alert("리뷰가 등록 처리 되었습니다.");
				location.reload();
				//reviewBtnCancle(prodNum);
			}
		},
		error:function(error){
			console.log("에러  : ",error);
		}
	})
	
	
	
	
}

</script>


	<!-- ##### 페이징 처리 시작  ##### -->
	<div class="page_box">
	
	<nav aria-label="Page navigation">
    	<ul class="pagination">
    	
    		<c:if test="${pm.prev}"> 
	        	<li class="page-item">
	        		<a class="page-link" id="page-link_real" href="listProductAll?page=${pm.startPage-1}">
        				<i class="fa fa-angle-left"></i>
       				</a>
     			</li>
	        </c:if>
	        
	        <c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
	        	<li class="page-item" ${pm.vo.page == idx ? 'class=active' : '' }>
	        		<a class="page-link" id="page-link_real" href="listProductAll?page=${idx}">${idx}</a>
        		</li>
	        </c:forEach>
	        
	        <c:if test="${pm.next}">
	        	<li class="page-item">
	        		<a class="page-link" id="page-link_real" href="listProductAll?page=${pm.endPage+1 }">
	        			<i class="fa fa-angle-right"></i>
        			</a>
       			</li>
      		</c:if>
	    </ul>
	</nav>
	</div>
</div>
	<!-- #####  페이징 처리 종료 #####  -->

<!-- ##### 게시글 목록 종료 ##### -->

<!-- 푸터들어가는 곳 -->
<jsp:include page="../include/footer.jsp" />
<!-- 푸터들어가는 곳 -->	


	
