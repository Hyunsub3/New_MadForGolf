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

@media only screen and (max-width: 414px) { /* 414*896  */
	.table th{
		font-size: 14px !important;
	}
	#deal_date{
		width: 180px;
	}
	#price{
		width: 20px !important;
	}
	#prod_name{
		width: 220px !important;
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
			
				<tr>
					<th id="deal_date">거래일시</th>
					<th style="width: 450px;" id="prod_name">상품이름</th>
					<th style="width: 200px;" id="price">가격</th>
				</tr>
			<c:forEach var="sell" items="${sellProductList }">
			
				<tr>
					<td id="date">${sell.prod_date }</td>
					<td><a href="/product/productDetail?prod_num=${sell.prod_num}">${sell.prod_name }</a></td>
					<td>
					&#8361;<fmt:formatNumber value="${sell.price }"  pattern="###,###" /> 
					</td>

<%-- 					<td>
						<a href="/board/boardRead?board_num=${vo.prod_num}">${vo.title }</a></td>
					<td>조인해오기</td>
					<td>
						<fmt:formatDate value="${vo.write_date }" pattern="yy-MM-dd HH:mm"/>
					</td>
					<td>${vo.readcount}</td> --%>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>	
	
	

<%-- 	${sessionScope.user_id} --%>
<%-- 	<c:if test="${!(empty sessionScope.user_id) }">
        <div class="col-12 writeBtn_box">
        	<a class="writeBtn" href="/board/insertBoard">글쓰기</a>
        </div>
	</c:if> --%>
	
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


	
