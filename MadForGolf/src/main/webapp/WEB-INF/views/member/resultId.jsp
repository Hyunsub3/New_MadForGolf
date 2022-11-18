<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../include/header.jsp" %>

<!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        Top Breadcrumb Area
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${pageContext.request.contextPath }/resources/img/bg-img/24.jpg);">
            <h2>Find My ID</h2>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Find My Account</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
<!-- ##### Breadcrumb Area End ##### --> 

	<!-- 본문 -->
		
	<div class="checkout_area mb-100">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-12 col-lg-7">
					<div class="checkout_details_area clearfix">
						<h5>Find My Email</h5>
						<br><br>
						
						
							<div class="row">
								<div class="col-12 mb-4">
									<label for="user_name">찾으시는 아이디는 ${user_id }입니다.</label> 
									<br><br><br>
								
								
								<div>
									<a class="action remind" href="${pageContext.request.contextPath }/member/login"><span>Go To Login</span></a><br>
								</div>
								<div>
									<a class="action remind" href="${pageContext.request.contextPath }/member/findPw"><span>Forgot Your Password?</span></a><br>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
                
	<!-- 본문 -->



	


<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
</script>

<%@ include file="../include/footer.jsp" %>