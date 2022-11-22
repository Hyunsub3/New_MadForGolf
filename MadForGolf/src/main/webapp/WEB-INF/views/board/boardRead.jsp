<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header -->
<jsp:include page="../include/header.jsp" />
<!-- header -->

<style>
@import url("https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800");
@font-face {
    font-family: 'S-CoreDream-3Light';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    unicode-range: U+AC00-D7A3;
}
.container_box{
/*  	border: 5px solid black; */
	background-color: #f9f9f9;
}

.content_inner_box{

}

.post-content{
/* 	border: 5px solid red; */
	margin-top: 20px;
}

.board_head{
/* 	border: 5px solid yellow; */
/* 	background-color: #FBF2CF; */
	padding: 30px;
}
.board_category{
/* 	border: 5px solid blue; */
	color:#52734D;
	font-weight: bold;
}
.post-title{
/* 	border: 5px solid red; */
	margin : 20px 0;
	font-weight: bold;
}
.post-meta{
/* 	border: 5px solid black; */
	border-top : 1px solid #b7b7b7; 
	padding-top : 10px;
	margin-bottom: 20px;
}
.post-meta a{
	font-size: 20px;
}

.content_box{
/*  	border: 5px solid gray;  */
	padding: 30px;
	height: auto;
	background-color: white;
}

.content_inner_box{
/* 	border: 5px solid blue; */
	width: 100%;
	font-weight: bold;
	color: black;
}

.img_box{
	display: flex;
	flex-flow: column wrap;
	justify-content: center;
	margin-left: 10%;
}

.img{
	width: 85%;
	margin: 10px;
}

.alazea-portfolio-filter{
/* 	border: 5px solid yellow; */

}

.board_btn_box{
/*  	border: 5px solid black; */
	display: flex;
	flex-flow: row nowrap;
	justify-content: center;	
	width: 100%;
	margin-bottom: 10px;
}



.board_btn{
/* 	border: 5px solid blue; */
	width : 140px;
	height: 50px;
	margin : 10px 20px;
	background-color: #91C788;
	border: 0;
	color: white;
	font-size: 17px;
	font-weight: bold;

}

.board_btn:hover{
	background-color : #FA7070;
	color: white;
}

.comment_area{
/* 	border: 5px solid green; */
	padding: 30px;

}

.comment_title{
 	font-size: 30px;
}
.comment_meta_name{
	font-size: 17px;
	font-weight: bold;
	padding-right: 20px;
	color: #b7b7b7;
}
.comment-wrapper{
	border-bottom: 1px dashed #b7b7b7;
	padding-bottom: 20px;
}
.comment_text{
	background-color: white;
	padding: 40px;
	margin-bottom: 30px;
}



.leave-comment-area{
/* 	border: 5px solid blue; */
	padding: 30px;
	

}
comment-head{

}

.comment_meta{
/* 	border: 5px solid blue; */
	display: flex;
 	flex-flow: row nowrap;
 	justify-content: flex-start;
 	padding-left: 5px;
 	
 } 
 
.comment_meta div{
	margin-right: 10px
}

.comment_control{
/* 	border: 5px solid red; */
	display: flex;
 	flex-flow: row nowrap;
 	justify-content: flex-end;
}

.comment_control a{
	color: #b7b7b7;
}

.comment_content{
/* 	border: 5px solid yellow; */
	padding-left: 5px;
	color: #52734D;
	font-weight: bold;
	
}
.form-control{
	resize: none;
}
#updateFormReply, #deleteReply{
	font-size: 12px;
	color: #b7b7b7;
	width: 47px;
	height: 20px;
	margin: 0 5px;
	padding: 0 10px;
	background-color: #f9f9f9;
	border-radius: 3px;
	
}
#page-link_real:hover{
	background-color: #C6EBC5;
	border: 1px solid #C6EBC5;
	
}
#text{
	font-size: 20px;
  	font-family: "Dosis", "S-CoreDream-3Light";
  	line-height: 200%;
	white-space:pre-wrap;
}



</style>


<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">

        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url('/resources/img/bg-img/background-img (3).jpg');">

		<h2>COMMUNITY</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="/board/listBoardAll">Community</a></li>
						<li class="breadcrumb-item active" aria-current="page">Single Comunity Post</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->

<!-- 수정, 삭제 시 필요한 글번호 저장 -->
<form role="form" method="post" id="boardContent">
	<input type="hidden" name="board_num" value="${vo.board_num }">
</form>
<%
	//세션영역에 있는 로그인 아이디 정보를 가져오기
	String id =	(String)session.getAttribute("user_id");
	if(id == null){ 
		// 로그인을 안했다
		%>
		<script type="text/javascript">

		alert("로그인이 필요한 서비스입니다.");
		location.href="/member/login";
		</script>
		
		<%
	}
%>


<!-- ##### Blog Content Area Start ##### -->
<section class="blog-content-area section-padding-0-100">
	<div class="container container_box">
<!-- 		<div class="row justify-content-center"> -->
			<!-- Blog Posts Area -->
			<div class="">
				<div class="blog-posts-area">

					<!-- 글내용#############@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					<div class="single-post-details-area" style="margin: 0;">
						<div class="post-content">
						
							<!-- 게시글 헤더 -->
							<div class="board_head">
								<div class="board_category">${vo.board_category }</div>
								<h4 class="post-title">${vo.title }</h4>
								<div class="post-meta mb-30">
									<a><i class="fa fa-user" aria-hidden="true"></i>${vo.user_name }</a>
									<a><i class="fa fa-clock-o" aria-hidden="true"></i>
										<fmt:formatDate pattern="yy-MM-dd HH:mm"	value="${vo.write_date }" /></a> 
									<a><!-- <i class="fa" aria-hidden="true"> --></i>조회수 ${vo.readcount }</a>
								</div>
							</div>
							
							<!-- 게시글 본문 -->
							<div class=" mb-30 content_box">
								<div class="content_inner_box" style="margin-bottom: 80px; margin-top: 40px;"><pre id="text">${vo.content }</pre></div>
								<div class="img_box">
									 <c:if test="${not empty vo.content_img}">
									 <div class="img">
	                                   	<img  src="${pageContext.request.contextPath }/resources/board_file/${vo.content_img }"alt="1">
<%-- 	                                   	<img  src="${pageContext.request.contextPath }/resources/board_file/${vo.content_img }"alt="1"> --%>
<%-- 	                                   	<img  src="tomcat/webapps/board_file/${vo.content_img }"alt="1"> --%>
	                                 </div>
	                                 </c:if>
	                                 <c:if test="${not empty vo.content_img2}">
		                                 <div class="img">
		                                    <img src="${pageContext.request.contextPath }/resources/board_file/${vo.content_img2 }" alt="1">
		                                 </div>
	                                 </c:if>
	                                 <c:if test="${not empty vo.content_img3}">
		                                 <div class="img">
		                                    <img src="${pageContext.request.contextPath }/resources/board_file/${vo.content_img3 }" alt="1">
		                                 </div>
	                                 </c:if>
								</div>
							</div>
							
							<!-- 게시글 버튼 -->
							<div class="row">
<!-- 								<div class="alazea-portfolio-filter"> -->
									<div class="portfolio-filter board_btn_box">
										<button type="submit" class="btn board_btn" id="listAll">목록</button>
										 <c:if test="${sessionScope.user_id == vo.user_id }">
											<button type="submit" class="btn board_btn" id="updateBoard">수정</button>
											<button type="submit" class="btn board_btn" id="deleteBoard">삭제</button>
										 </c:if>
									</div>
<!-- 								</div> -->
							</div>

						</div>
					</div>



					<!-- 댓글리스트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					<c:if test="${msg != 'NO' }">
					<div class="comment_area clearfix">
						<h6 class="headline comment_title">Comment</h6>

						<ol class="comment_text">
							
							<!-- Single Comment Area -->
							<c:forEach var="replyVO" items="${replyVO }">

								<li class="single_comment_area">
									<div class="comment-wrapper " id="edit_div${replyVO.reply_num }">
										<form role="form" method="post" id="boardReply${replyVO.reply_num }">
											<input type="hidden" name="board_num" value="${vo.board_num }"> 
											<input type="hidden" name="reply_num" value="${replyVO.reply_num }">
											
											<div class="comment-content">
												<div class="align-items-center justify-content-between comment-head">
		
												
													
													<!-- 댓글 작성자 -->
													<div class="comment_meta">
														<span class="comment_meta_name">${replyVO.user_name }</span>
														<span class="comment-date"><fmt:formatDate pattern="yy-MM-dd HH:mm" value="${replyVO.reply_updatedate }"/></span>
													</div>

												</div><!-- comment-head -->
												
												
												<!-- 댓글 본문 -->
												<input type="hidden" name="reply_content" value="${replyVO.reply_content }">
												<div class="comment_content" id="edit_acontent">${replyVO.reply_content }</div>
												
													<!-- 댓글 제어 버튼 -->
													<div class="comment_control">
													<c:if test="${sessionScope.user_id == replyVO.user_id }">
														<a class="active" id="updateFormReply" href="javascript:void(0);"
															onclick="updateReplyFun(${vo.board_num },${replyVO.reply_num },'${replyVO.reply_content }','${replyVO.user_name }');">수정</a>
										
														<a class="active" id="deleteReply" href="javascript:void(0);"
															onclick="deleteReply(${replyVO.reply_num })">삭제</a>
													</c:if>
	
													</div>
											</div><!-- comment-content -->
										</form>

									</div>

								</li>
							</c:forEach>

						</ol>
						<!-- 댓글 페이징@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<nav aria-label="Page navigation">
							<ul class="pagination">
								<c:if test="${pm.prev }">
									<li class="page-item"><a class="page-link" id="page-link_real"
										href="boardRead?board_num=${vo.board_num }&page=${pm.startPage-1 }"><i
											class="fa fa-angle-left"></i></a></li>
								</c:if>
								<c:forEach var="idx" begin="${pm.startPage }"
									end="${pm.endPage }">
									<li class="page-item"><a class="page-link" id="page-link_real"
										href="boardRead?board_num=${vo.board_num }&page=${idx }">${idx }</a></li>

								</c:forEach>
								<c:if test="${pm.next }">
									<li class="page-item"><a class="page-link" id="page-link_real"
										href="boardRead?board_num=${vo.board_num }&page=${pm.endPage+1 }"><i
											class="fa fa-angle-right"></i></a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</c:if>			


					<!-- 댓글남기기@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					<div class="leave-comment-area clearfix">
						<div class="comment-form">
							<h4 class="headline">Leave A Comment</h4>

							<div class="contact-form-area">
								<!-- Comment Form -->
								<form action="/board/insertReply" method="post">
									<div class="row">
<!-- 										<input type="hidden" name="user_id" value="itwill01"> -->
										<input type="hidden" name="user_id" value="${sessionScope.user_id}">
										<input type="hidden" name="board_num" value="${vo.board_num }">
										<div class="col-12">
											<div class="form-group">
												<textarea class="form-control" name="reply_content"
													id="insertReplyContent" cols="30" rows="5"
													placeholder="댓글을 입력하세요"></textarea>
											</div>
										</div>
										<div class="board_btn_box">
											<input type="submit" class="btn board_btn" id="insertReply"
												value="댓글쓰기">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>

				</div>
<!-- 			</div> -->









		</div>
	</div>
</section>
<!-- ##### Blog Content Area End ##### -->
<!-- <!-- jQuery-2.2.4 js -->
<!-- <script  src="http://code.jquery.com/jquery-3.6.0.min.js"></script> -->

<script type="text/javascript">

	$("#insertReply").click(function(){
		if($('#insertReplyContent').val() == ""){
			alert('내용을 입력하세요!');
			return false;
		}
	});

	function updateReplyFun(board_num,reply_num,reply_content,user_name){
		//alert("함수실행 "+ board_num+",,"+reply_num+",,"+reply_content);
		
 		 var commentsView = "";
 		// var buttonView = "";
		
 		 
 		commentsView += '<form action="/board/updateReply" method="post" id="boardReply" style="margin-bottom:50px;">';
 		commentsView += user_name;
		commentsView += '<input type="hidden" name="board_num" value="'+board_num+'">';
		commentsView += '<textarea class="form-control" name="reply_content" id="message'+reply_num+'" cols="30" rows="5" placeholder="글내용" style="line-height: 0.8; margin-bottom:20px; margin-top:10px;">';
		commentsView += reply_content;
		commentsView += '</textarea>';
		commentsView += '<input type="hidden" name="reply_num" value="'+reply_num+'">';
		commentsView += '<div class="portfolio-filter">';
		commentsView += '<input type="submit" class="btn" id="updateReply" value="수정완료">'
		commentsView += '</div>';
		
		
 		commentsView += '</form>';
 		
 		
// 		buttonView += '완료'
// 		buttonView += '</button>'
		
		$('#edit_div' + reply_num).replaceWith(commentsView);
		//$('#edit_button' + reply_num).replaceWith(buttonView);
		$('#message'+reply_num).focus();
	}
	
	
	
	function chk_form() {
		alert(reply_num);
		var fr3 = $('#boardReply');
		if(document.getElementById("message'+reply_num+'").value==''){
			alert("내용을 입력하세요");
			return false;
		}
		fr3.submit();
	}
	
	
	
	
	
	
	
	
	
	
	function deleteReply(reply_num){
		var fr2 = $('#boardReply'+reply_num);
		//alert('삭제버튼 클릭');
		
		//fr 속성 바꾸기 action, method
		fr2.attr("action", "/board/deleteReply");
		fr2.attr("method", "get");
		fr2.submit();
	}

	
	$(document).ready(function(){
		//alert('제이쿼리 실행!!');
		
		//글번호 정보를 포함하는 폼태그
		//변수에 담기
		var fr = $('#boardContent');
		
		//수정하기
		$("#updateBoard").click(function(){
			//alert('수정버튼 클릭');
			
			//fr 속성 바꾸기 action, method
			fr.attr("action", "/board/boardModify");
			fr.attr("method", "get");
			//속성을 바꾸고 서브밋하겠다
			fr.submit();
			
		});
		
		//삭제하기
		$("#deleteBoard").click(function(){
			//alert('수정버튼 클릭');
			
			//fr 속성 바꾸기 action, method
			fr.attr("action", "/board/boardDelete");
			fr.attr("method", "get");
			//속성을 바꾸고 서브밋하겠다
			fr.submit();
			
		});
		
		//목록으로 이동하기
		$("#listAll").click(function(){
			location.href="/board/listBoardAll";
			//history.back();
		});
		
		

		
	});
	
	
	
/* 	//alert(${msg});
	var result = "${msg}";
	
	
	if(result == "INSERTOK"){
		alert('댓글 쓰기 완료!');
	}
	if(result == "UPDATEOK"){
		alert('댓글 수정 완료!');
	}
	if(result == "DELETEOK"){
		alert('댓글 삭제 완료!');
	}
 */
	
	
	
	
	
</script>

<!-- 푸터들어가는 곳 -->
<jsp:include page="../include/footer.jsp" />
<!-- 푸터들어가는 곳 -->