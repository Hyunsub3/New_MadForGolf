<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@ include file="../include/header.jsp" %>

<style type="text/css">
.container{
	display:grid;
	width:100%;
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
	padding-top:100px;
	paddig-left:300px;
}

.img-container{
	width:500px;
	height:500px;
}

.table-box{
	font-size:18px;
	text-align:center;
}

.account{
	color:#A1C298;
}

.book{
	font-weight:bold;
	padding: 10px 15px;
}
.book:hover{
	color: white;
	font-weight:bold;
	background-color: #FA7070;
	border-radius: 5px;
}

.about-us-area{
	display:grid;
	width:100%;
}
.section-heading text-center{
	display:grid;
	width:100%;
}

@media only screen and (max-width: 767px){
	.about-us-area{
		display:grid;
		width:80%;
	}
	.container {
		display:grid;
		width:80%;
	}
	.main-item{
		width:100%;
		height:100%;
	}
	.chart-container{
		width:80vw;
		height:80vh;
		margin:0 auto;
		positon:realtive;
	}
	.table-box{
		width:100%;
	}
	..section-heading text-center{
		display:grid;
		width:90%;
	}
}
</style>

	<!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${pageContext.request.contextPath }/resources/img/bg-img/golf-2704608.jpg);">
            <h2>My Golf Wallet</h2>
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item"><a href="/member/mypage"> Mypage </a>
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
			
			
					<%-- <picture>
					     <source media="(min-width: 1024px)" srcset="${pageContext.request.contextPath}/resources/img/geoji4.jpg" class="img-fluid">
					       <source media="(min-width: 768px)" srcset="${pageContext.request.contextPath}/resources/img/geoji_small.jpg" class="img-fluid">
					       <img src="${pageContext.request.contextPath}/resources/img/geoji_small.jpg" class="img-fluid">
				   </picture> --%>
			<!-- JSTL -->
			<c:choose>
				<c:when test="${purchaseCnt eq 0 && saleCnt eq 0}">
				   
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
					<div class="main-item">
	                    <div class="table-box">
	
							<table class="table">
								<tbody>
									<tr>
										<th><a href="/mypage/accountbookPurchase" style="font-size:18px;" class="book">구매</a></th>
										<th><span class="account">${purchaseCnt }</span>번</th>
										<th><span class="account"><fmt:formatNumber value="${purchaseMonth}" type="currency"/></span></th>
									</tr>
									
									<tr>
										<th><a href="/mypage/accountbookSale" style="font-size:18px;" class="book">판매</a></th>
										<th><span class="account">${saleCnt }</span>번</th>
										<th><span class="account"><fmt:formatNumber value="${saleMonth}" type="currency"/></span></th>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 글자 영역 -->
						<!-- 차트를 그릴 영역 -->
						<div class="chart-container">
							<canvas id="MonthChart"></canvas>
							<br><br><br><br>
						</div>
						<!-- 차트를 그릴 영역 -->
						
					</div>
				</c:otherwise>
				</c:choose>
				<!-- JSTL -->
		</div>
	</section>


<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script>
	var chartArea = document.getElementById('MonthChart').getContext('2d');
	
	var MonthChart = new Chart(chartArea,{
		type:'pie',
		data: {
			labels:["구매","판매"],
			datasets:[{
				label:"원",
				backgroundColor:[
					"#A1C298","#FA7070"
				],
				data:[${purchaseMonth},${saleMonth}]
			}]
		},
		options:{
			plugins:{
				title:{
					display:true,
					text:'이번 달 거래 현황',
					padding:{
						top:60,
						botton:50
					},
					font:{
						size:30,
						family: 'Trebuchet MS'
					}
				},
				labels:{
					font:{
						size:20
					}
				}
			},
			maintainAspectRatio:false
		}
	});
	
</script>

<%@ include file="../include/footer.jsp" %>