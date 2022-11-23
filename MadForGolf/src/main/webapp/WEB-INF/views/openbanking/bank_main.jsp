<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->


    <!-- Title -->
    <title>Mad For Golf</title>


    
</head>

<body>
 <script src="${pageContext.request.contextPath }/resources/js/jquery/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#price').val(sessionStorage.getItem('price'));
		$('#price2').val(sessionStorage.getItem('price'));
// 		alert("test");
		
		//function pay(){
		//$('#clickTest').on("click", function(){
			
		//페이지 로드 시 함수 바로 실행
		window.onload = function(){
			//alert('zmfflr');
			//let info = $('#fr').serializeArray();
			let info = $('#fr').serializeObject();
			let infoD = $('#fr22').serializeObject();
			
			var result = confirm("이체를 진행하시겠습니까?");
			if(result){
			    
			
			
			//alert('실행');
			//출금이체////////////////////////////////////
			$.ajax({
				url  : "/openbanking/withdraw",
				type : "POST",
				async : true,
				data : JSON.stringify(info),
				dataType:"json",
				contentType : "application/json;charset=UTF-8",
				success 	: function(data) {
					if(data.rsp_code == "A0000"){
					//	alert("출금성공");
// 						$('#result').html(data.account_num_masked + " / " + data.bank_name + " / " + data.account_holder_name + "님의 계좌에서 <br>");
						
						$('#req_account_num_masked').val(data.account_num_masked);
						$('#req_bank_name').val(data.bank_name);
						$('#req_account_holder_name').val(data.account_holder_name);
					} else {
						alert('출금에 실패하였습니다.'+data.rsp_message);
						$.ajax({
							url  : "/deal/deleteBuyer",
							type : "GET",
							dataType:'json',
							data : {
								'deal_num':'${sessionScope.prod_num}',
							},
							contentType : "application/json;charset=UTF-8",
		    });
						location.href = "/";
						return false;
					}
					// 입금이체////////////////////////////////////////
					$.ajax({
						url  : "/openbanking/deposit",
						type : "POST",
						async : true,
						data : JSON.stringify(infoD),
						
						dataType:"json",
						contentType : "application/json;charset=UTF-8",
						success 	: function(data) {
							if(data.rsp_code == "A0000"){
								//alert("이체가 완료되었습니다.");
								//alert(data.api_tran_id + "/" + data.res_list[0]);
							
// 								$('#result').append(data.res_list[0].account_alias+" / " + data.res_list[0].bank_name + " / ");
// 								$('#result').append(data.res_list[0].account_holder_name+"님에게 " + data.res_list[0].tran_amt + "원 이체를 완료하였습니다.<br>");
								
								$('#recv_account_alias').val(data.res_list[0].account_alias);
								$('#recv_bank_name').val(data.res_list[0].bank_name);
								$('#recv_account_holder_name').val(data.res_list[0].account_holder_name);
								$('#recv_tran_amt').val(data.res_list[0].tran_amt);
							}else {
								alert('입금에 실패하였습니다.');
								$.ajax({
									url  : "/deal/deleteBuyer",
									type : "GET",
									dataType:'json',
									data : {
										'deal_num':'${sessionScope.prod_num}',
									},
									contentType : "application/json;charset=UTF-8",
				    });
								location.href = "/";
								return false;
							}
							
							let re = {
									prod_num : ${sessionScope.prod_num},
									price : data.res_list[0].tran_amt,
									payment : "계좌이체"
							};
							//디비에 결제정보 저장하기////////////////////////////////////////
							$.ajax({
								url  : "/pay/payInsert",
								type : "POST",
								async : true,
								data : JSON.stringify(re),
								//dataType:"json",
								contentType : "application/json;charset=UTF-8",
								
								success 	: function() {
									alert('이체가 완료되었습니다.');
									let form1 = $('#fr111111111');
									form1.attr("action", "/pay/payResult");
									form1.attr("method", "post");
									form1.submit();
									
								},
							    error		: function(request,status) {
							    	console.log("request.status : "+ request.status);
							    	console.log("request.responseText : "+ request.responseText);
							    	//console.log(error);
							    	alert('디비저장실패');
							    	location.href = "/";
							    }
							});
							
							
					    },
					    error		: function(error) {
					    	console.log(error);
					    	alert('이체에 실패하셨습니다.');
					    	$.ajax({
								url  : "/deal/deleteBuyer",
								type : "GET",
								dataType:'json',
								data : {
									'deal_num':'${sessionScope.prod_num}',
								},
								contentType : "application/json;charset=UTF-8",
			    });
					    	location.href = "/";
					    }
					});
					
					
					
					
					
			    },
			    error		: function(error) {
			    	console.log(error);
			    	alert('이체에 실패하셨습니다.');
			    	$.ajax({
						url  : "/deal/deleteBuyer",
						type : "GET",
						dataType:'json',
						data : {
							'deal_num':'${sessionScope.prod_num}',
						},
						contentType : "application/json;charset=UTF-8",
	    });
			    	location.href = "/";
			    }
			});
			}else{
			    alert("이체를 취소하였습니다.");
			    var answer = confirm("거래를 취소하시겠습니까?");
			    
			    if(answer){
					$.ajax({
									url  : "/deal/deleteBuyer",
									type : "GET",
									dataType:'json',
									data : {
										'deal_num':'${sessionScope.prod_num}',
									},
									contentType : "application/json;charset=UTF-8",
				    });
				    location.href = "/";
				}//if 종료
				 else{
					return false;
				}
			}
		    }
			
				
				

	//	});//click
// 		}
		

 	});//jquery
			
</script>    
    하이하이
 
    
    <div class="container">
<!--     <h1> -->

    
<!--     <div id="result"> -->
<%--     <img src="${pageContext.request.contextPath }/resources/img/payimg.gif"  style="align-content: center;"><br> --%>
<!-- 	결제 중... -->
<!-- 	</div> -->
<!--     </h1> -->
<!-- 		<h2>인증 완료</h2> -->
<%-- 		엑세스 토큰 : ${responseToken.access_token}<hr> --%>
<%-- 		사용자 번호 : ${responseToken.user_seq_no}<hr> --%>
<%-- 		token_type : ${responseToken.token_type}<hr> --%>
<%-- 		expires_in : ${responseToken.expires_in}<hr> --%>
<%-- 		refresh_token : ${responseToken.refresh_token}<hr> --%>
<%-- 		scope : ${responseToken.scope}<hr> --%>
<%-- 		${productVO} --%>
	
<!-- 		<hr> -->
		
		<!-- 사용자정보조회 API -->
		<form method="get" action="userInfo">
			<%-- 필요 파라미터는 입력데이터 없이 hidden 속성으로 전달 --%>
			<input type="hidden" name="access_token" value="${responseToken.access_token }"> 
			<input type="hidden" name="user_seq_no" value="${responseToken.user_seq_no }">
<!-- 			<input type="submit" value="사용자정보조회"> -->
		</form>
	
<!-- 		<hr> -->
		
		
		<!-- 2.2.3 등록계좌조회 API -->
		<form method="get" action="accountList">
			<%-- 필요 파라미터는 입력데이터 없이 hidden 속성으로 전달 --%>
			<input type="hidden" name="access_token" value="${responseToken.access_token }"> 
			<input type="hidden" name="user_seq_no" value="${responseToken.user_seq_no }"> 
			<input type="hidden" name="include_cancel_yn" value="Y"> 
			<input type="hidden" name="sort_order" value="D"> 
<!-- 			<input type="submit" value="등록계좌조회"> -->
		</form>
		
<!-- 		<hr> -->
<!-- 				<h2>출금이체 갑니다😁👌😁👌   😀😀😀😀        </h2> -->
	<form method="post" action="withdraw" id="fr">
		<input type="hidden" name="access_token" value="${responseToken.access_token }">
<%-- 		<input type="hidden" name="access_token" value="${sessionScope.token }"> --%>
<!-- 		<input type="hidden" name="access_token" value="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDE0NzM5Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwib29iIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2NzYyNTg0MDQsImp0aSI6IjQ0NTAyNTNhLWY1YTEtNGRmOC05ODQ0LTdlNzVmYWRhZTRhZiJ9._yvPTWTIohkjlQx5ii_UmnyIFLB3VzFNFtlOcfdpC9U"> -->
		
<!-- 		<input type="hidden" name="bank_tran_id" value="M202202083U7BC366365"> -->
		<input type="hidden" name="cntr_account_type" value="N">
		<input type="hidden" name="cntr_account_num" value="20221123">
		<input type="hidden" name="dps_print_content" value="마지막">
		<input type="hidden" name="fintech_use_num" value="120220208388941285822769">
<!-- 		<input type="hidden" name="fintech_use_num" value="120220208388941285310465"> -->
<!-- 		<input type="hidden" name="wd_print_content" value="오픈뱅킹출금"> -->
		
		<input type="hidden" id="price" name="tran_amt" value="1000">
		<input type="hidden" name="tran_dtime" value="20221123151921">
		<input type="hidden" name="req_client_name" value="마지막">
<!-- 		<input type="hidden" name="req_client_bank_code" value="002"> -->
<!-- 		<input type="hidden" name="req_client_account_num" value="1101230000678"> -->
		<input type="hidden" name="req_client_num" value="JEONGHJ123">
		<input type="hidden" name="transfer_purpose" value="TR">
		<input type="hidden" name="req_client_bank_code" value="002">
		<input type="hidden" name="req_client_account_num" value="20221123">
<!-- 		<input type="hidden" name="req_client_fintech_use_num" value="120220208388941285310465"> -->
<!-- 		<input type="hidden" name="sub_frnc_name" value="하위가맹점"> -->
<!-- 		<input type="hidden" name="sub_frnc_num" value="123456789012"> -->
<!-- 		<input type="hidden" name="sub_frnc_business_num" value="1234567890"> -->
		
		<input type="hidden" name="recv_client_name" value="권현지">
		<input type="hidden" name="recv_client_bank_code" value="097">
		<input type="hidden" name="recv_client_account_num" value="0518030909">
	</form>
<!-- 		<input type="submit" value="출금이체 슝 갑니다" id="clickTest">	 -->
	
	



<!-- <hr>	 -->
<!-- <hr>	 -->

	
<!-- 	<hr> -->
<!-- 	<hr> -->

<!-- <h2>입금이체 아 가봅니다 OO가자</h2> -->
	
	<form method="post" action="deposit" id="fr22">
		<input type="hidden" name="access_token" value="${responseToken.access_token }">
<!-- <input type="hidden" name="access_token" value="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDE0NzM5Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwib29iIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2NzYyNTg0MDQsImp0aSI6IjQ0NTAyNTNhLWY1YTEtNGRmOC05ODQ0LTdlNzVmYWRhZTRhZiJ9._yvPTWTIohkjlQx5ii_UmnyIFLB3VzFNFtlOcfdpC9U"> -->
		<input type="hidden" name="cntr_account_type" value="N">
		<input type="hidden" name="cntr_account_num" value="20221123">
		<input type="hidden" name="wd_pass_phrase" value="NONE">
		<input type="hidden" name="wd_print_content" value="마지막중고거래">
		<input type="hidden" name="name_check_option" value="off">
		<input type="hidden" name="tran_dtime" value="20221123151921">
		<input type="hidden" name="req_cnt" value="1">
		
		<input type="hidden" name="tran_no" value="1">
<!-- 		<input type="hidden" name="bank_tran_id" value="M202202083U123432349"> -->
		<input type="hidden" name="fintech_use_num" value="120220208388941285745275">
		<input type="hidden" name="print_content" value="마지막중고거래">
		<input type="hidden" id="price2" name="tran_amt" value="1000">
		<input type="hidden" name="req_client_name" value="마지막">
		<input type="hidden" name="req_client_bank_code" value="002">
		<input type="hidden" name="req_client_account_num" value="20221123">
<!-- 		<input type="hidden" name="req_client_fintech_use_num" value=""> -->
		<input type="hidden" name="req_client_num" value="JEONGHJ123">
		<input type="hidden" name="transfer_purpose" value="TR">
	</form>
		

	
<!-- 		<input type="button" value="입금이체다" id="depositClick"> -->


		
	</div>
	
<!-- 	<input type="button" value="마이페이지로 이동"> -->
<!-- 	<input type="button" value="메인화면으로 이동"> -->
	
	
	
	
	<!-- 다른 페이지로 이동할 때 데이터 저장 -->
	
	<form role="form" id="fr111111111" method="get">
		<input type="hidden" id="req_account_num_masked" name="req_account_num_masked" value="">
		<input type="hidden" id="req_bank_name" name="req_bank_name" value="">
		<input type="hidden" id="req_account_holder_name" name="req_account_holder_name" value="">
		<input type="hidden" id="recv_account_alias" name="recv_account_alias" value="">
		<input type="hidden" id="recv_bank_name" name="recv_bank_name" value="">
		<input type="hidden" id="recv_account_holder_name" name="recv_account_holder_name" value="">
		<input type="hidden" id="recv_tran_amt" name="recv_tran_amt" value="">
	</form>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
   </body>
</html> 