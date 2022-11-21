<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@ include file="../include/header.jsp" %>

<style type="text/css">
.container{
	display:grid;
}

.main-container{
	display:grid;
	grid-template-columns:500px 500px;
	padding-bottom:100px;
}

.main-item{
	display:grid;
	justify-content: center;
}

.chart-container{
	width:500px;
	height:700px;
	margin:0 auto;
	positon:realtive;
}

.content-container{
	padding-left:200px;
	padding-top:100px;
}

.table-box{
	padding-top:200px;
	padding-bottom:100px;
	padding-left:100px;
	font-size:18px;
	text-align:center;
}

.img-container {
	
	width:500px; 
	height:500px; 
	margin:0px auto;
	
}

.btn alazea-btn w-120 {
	width:360pt;
	height:40pt;
	margin:auto;
	
}

.account{
	color:#A1C298;
}

@media only screen and (max-width: 767px){
	.container {
	
		width:70%;
	
	}
	.main-container{
		width:90%;
		display: flex;
		flex-flow: row wrap;
		justify-content: center;
		
	
	}
	#purchaseMonth{
		width: 90%;
	}
	.table-box{
		width:80%;
		padding-top:0px;
		padding-left:0px;
	}
	.col-12{

	
	}
	.img-container{
		width:80%;
	}
	.chart-container{
		width:80vw;
		height:80vh;
		margin:0 auto;
		positon:realtive;
	}

}

</style>

	<!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${pageContext.request.contextPath }/resources/img/bg-img/24.jpg);">
            <h2>My Golf Wallet</h2>
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">My Golf Wallet</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
	<!-- ##### Breadcrumb Area End ##### -->
	
	
	<section class="about-us-area">
		<div class="container">
			<div class="section-heading text-center">
			   <h2>My Golf Wallet</h2>
			   <p>${user_name }님의 Golf Wallet</p>
			</div>
		
			<!-- 선 -->
	        <div class="col-12">
	            <div class="border-line"></div>
	            <br><br><br>
			</div>
			<!-- 선 -->
			
			<!-- JSTL -->
			<c:choose>
				<c:when test="${saleCnt eq 0}">
					<div class="main-item">
						<div class="img-container">
							<img src="${pageContext.request.contextPath }/resources/img/geoji4.jpg">
							<br><br><br><br>
						</div>
						<button class="btn alazea-btn w-120" onClick="location.href='/product/listAll'" value="">거래하러 가기</button>
					    	<br><br><br><br><br>
						</div>
					</div>
				</c:when>
					
				<c:otherwise>
					<div class="main-container">
						<!-- 차트를 그릴 영역 -->
						<div class="chart-container">
							<canvas id="saleMonth"></canvas>
							<br><br><br><br>
						</div>
						<!-- 차트를 그릴 영역 -->
						
						
						<!-- 글자 영역 -->
						<div class="table-box">
	
							<table class="table">
								<tbody>
								
									<tr>
										<th>Category</th>
										<th>Amount</th>
									</tr>
									
									<tr>
										<th>Driver</th>
										<th><span class="account"><fmt:formatNumber value="${saleDriver}" type="currency"/></span></th>
									</tr>
									<tr>
										<th>Iron</th>
										<th><span class="account"><fmt:formatNumber value="${saleIron}" type="currency"/></span></th>
									</tr>
									<tr>
										<th>Util</th>
										<th><span class="account"><fmt:formatNumber value="${saleUtil}" type="currency"/></span></th>
									</tr>
									<tr>
										<th>Wedge</th>
										<th><span class="account"><fmt:formatNumber value="${saleWedge}" type="currency"/></span></th>
									</tr>
									<tr>
										<th>Putter</th>
										<th><span class="account"><fmt:formatNumber value="${salePutter}" type="currency"/></span></th>
									</tr>
									<tr>
										<th>Etc.</th>
										<th><span class="account"><fmt:formatNumber value="${saleEtc}" type="currency"/></span></th>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 글자 영역 -->
						
						
						
					</div>
				</c:otherwise>
			</c:choose>
			<!-- JSTL -->
		</div>
	</section>
    
    
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
    <script>
    	new Chart(document.getElementById("saleMonth"),{
    		type:'doughnut',
    		data:{
    			labels: [
    				'Driver',
    				'Iron',
    				'Util',
    				'Wedge',
    				'Putter',
    				'Etc.'
    			],
    			datasets:[
    				{
    					label: "Category",
    					backgroundColor:[
    						'#FEFFDE','#FBF2CF','#DDFFBC','#91C788','#A1C298','#52734D'
    					],
    					data:[${saleDriver},${saleIron},${saleUtil},${saleWedge},${salePutter},${saleEtc}]
    				}
    			]
    		},
    		options:{
    			plugins:{
    				title:{
        				display:true,
        				text:'카테고리 별 판매 현황',
        					font:{
            					size:30
            				}
        			}
    			},

    			maintainAspectRatio:false
    		}
    	});
    </script>
    
    
    
    <%@ include file="../include/footer.jsp" %>