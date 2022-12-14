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

.category_btn1{
	width: 60px;
	height : 30px;
	font-size: 14px;
	color: white;
	text-align: center;
	padding: 0px;
	background-color : #C6EBC5;
	border: none;
	border-radius: 3px;

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


@media only screen and (max-width: 414px) { /* 414*896  */
	.table th{
		font-size: 14px !important;
	}
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.category_btn1').click(function(){
			
			var deal2 = $(this).next().val();
			//alert(deal2);
			
			var answer = window.confirm("?????? ???????????? ???????????????????\n???????????? ????????? ????????? ??????????????????.");
			
			if (answer == true){
				location.href ="${pageContext.request.contextPath }/product/dealDone?deal_num="+deal2
			}
			else{ 
				alert("?????????????????????!"); 
			}
		});
		
	});

</script>
   
     <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url('/resources/img/bg-img/background-img (4).jpg');">            <h2>????????????</h2>
         <%--    <a style="color: white;">${DealingProductList }</a> --%>
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


	

  	<!-- category ?????? ??? ???????????? ????????? ???????????? ????????? ?????? -->
 	<div class="category_list">
 		<a class="category_btn" href="/product/listProductAll?page=1"><div>????????????</div></a>
 		<a class="category_btn" href="/product/listProductBuy?page=1"><div>????????????</div></a>
 		<a class="category_btn" href="/product/listProductDealing?page=1"><div>?????????</div></a>
 	</div>
   
   
  <!--  #####  ????????? ????????? ??????   ##### --> 
	<div class="table_box">
	
		<table class="table">
			<tbody>
			
				<tr>
					<th>????????????</th>
					<th>????????????</th>
					<th>??????</th>
					<th>?????????</th>
				</tr>
			<c:forEach var="dealing" items="${DealingProductList }"> 
				<tr>
					<td>${dealing.deal_date }</td>
					<td><a href="/product/productDetail?prod_num=${dealing.deal_num}">${dealing.product.prod_name }</a></td>
					<td>
					&#8361;<fmt:formatNumber value="${dealing.product.price }"  pattern="###,###" /> 
					</td>
					<td>
					<input class="category_btn1" type="button" id="deal${dealing.deal_num }" value="${dealing.state }">
 					<input type="hidden" value="${dealing.deal_num }" name="deal2" id="deal2">
 					</td>

				</tr>
			</c:forEach>


			</tbody>
		</table>
	</div>	
	
	

<%-- 	${sessionScope.user_id} --%>
<%-- 	<c:if test="${!(empty sessionScope.user_id) }">
        <div class="col-12 writeBtn_box">
        	<a class="writeBtn" href="/board/insertBoard">?????????</a>
        </div>
	</c:if> --%>
	
	<!-- ##### ????????? ?????? ??????  ##### -->
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
	<!-- #####  ????????? ?????? ?????? #####  -->

<!-- ##### ????????? ?????? ?????? ##### -->

<!-- ?????????????????? ??? -->
<jsp:include page="../include/footer.jsp" />
<!-- ?????????????????? ??? -->	


	
