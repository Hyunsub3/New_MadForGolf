<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@page import="com.madforgolf.persistence.MemberDAO"%>
<%@page import="com.madforgolf.domain.MemberVO"%>
	
<%@ include file="../include/header.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/talkplus-js-0.2.17.js" ></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script type="text/javascript">
var APP_ID = '6d4f7ab2-f06e-4978-8282-8fc150e43cd0';
var client = new TalkPlus.Client({appId: APP_ID});


function exit(){
	$(document).ready(function(){
		var chattingNum = $('#exitChattingNum').val();
		// alert(chattingNum);
 		$.ajax({
			url: "/product/deleteChattingNum",
			data: {"chattingNum" : chattingNum, "talker1_id" : "${sessionScope.user_id}", "talker1_name" : "${sessionScope.user_name}"},
			success: function(chattingNum){
				alert("채팅 나가기 성공!");
				alert(chattingNum);
				
				$('#test').html('<c:choose><c:when test="${sessionScope.user_id eq vo.talker1_id }"><c:if test="${empty vo.talker2_id }"><td><span class="badge bg-orange">대화상대 없음</span></td><td><span class="badge bg-orange">대화상대 없음</span></td></c:if><c:if test="${!empty vo.talker2_id }"><td><span class="badge bg-orange">${vo.talker2_id }</span></td><td><span class="badge bg-orange">${vo.talker2_name }</span></td></c:if><td><input type="button" value="채팅하기" onclick="window.open('+'"/product/chatting?chattingNum=${vo.chattingNum}");"><input type="button" id="exit" value="채팅나가기" onclick="javascript:exit();"><input type="hidden" id="exitChattingNum" value="${vo.chattingNum }"></td></c:when><c:when test="${sessionScope.user_id eq vo.talker2_id }"><c:if test="${empty vo.talker1_id }"><td><span class="badge bg-orange">대화상대 없음</span></td><td><span class="badge bg-orange">대화상대 없음</span></td></c:if><c:if test="${!empty vo.talker1_id }"><td><span class="badge bg-orange">${vo.talker1_id }</span></td><td><span class="badge bg-orange">${vo.talker1_name }</span></td></c:if><td><input type="button" value="채팅하기" onclick="window.open('+'"/product/chatting?chattingNum=${vo.chattingNum}");"><input type="button" id="exit" value="채팅나가기" onclick="javascript:exit();"><input type="hidden" id="exitChattingNum" value="${vo.chattingNum }"></td></c:when></c:choose>');
				
				client.loginAnonymous({"userId": "${sessionScope.user_id }", "username": "${sessionScope.user_name }", "profileImageUrl":"https://notion-emojis.s3-us-west-2.amazonaws.com/prod/svg-twitter/26f3.svg"}, function (errResp, data) {
					// 로그인 확인
					const isLoggedIn = client.isLoggedIn();
					console.log(isLoggedIn);
					client.leaveChannel({channelId: chattingNum, deleteChannelIfEmpty: true});
				});
			},
			error: function(){
				alert("채팅 나가기 실패!");
			}
		}); // Ajax
	}); // jQuery
	
}
</script>

<!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url('/resources/img/bg-img/background-img (4).jpg');">
            <h2>chattingList</h2>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">chattingList</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
<!-- ##### Breadcrumb Area End ##### -->
	<div class="checkout_area mb-100">
		<div class="container">
			<h1> 📃ChattingList </h1><br>
 			<div class="box-body">
				<table class="table table-bordered" style="text-align: center;">
					<tbody>
							<tr>
								<th style="width: 200px">대화상대 아이디</th>
								<th style="width: 200px">대화상대 이름</th>
								<th style="width: 200px">채팅하기</th>
							</tr>
						<c:forEach var="vo" items="${chattingList }" varStatus="status">
							<tr id="test">
								<c:choose>
									<c:when test="${sessionScope.user_id eq vo.talker1_id }">
										<c:if test="${empty vo.talker2_id }">
											<td><span class="badge bg-orange">대화상대 없음</span></td>
											<td><span class="badge bg-orange">대화상대 없음</span></td>							
										</c:if>
										<c:if test="${!empty vo.talker2_id }">
											<td><span class="badge bg-orange">${vo.talker2_id }</span></td>
											<td><span class="badge bg-orange">${vo.talker2_name }</span></td>							
										</c:if>
											<td><input type="button" value="채팅하기" onclick="window.open('/product/chatting?chattingNum=${vo.chattingNum}', 'Mad for Golf', '_blank');">
												<input type="button" id="exit" value="채팅나가기" onclick="javascript:exit();"><input type="hidden" id="exitChattingNum" value="${vo.chattingNum }"></td>
									</c:when>
									<c:when test="${sessionScope.user_id eq vo.talker2_id }">
										<c:if test="${empty vo.talker1_id }">
											<td><span class="badge bg-orange">대화상대 없음</span></td>
											<td><span class="badge bg-orange">대화상대 없음</span></td>							
										</c:if>
										<c:if test="${!empty vo.talker1_id }">
											<td><span class="badge bg-orange">${vo.talker1_id }</span></td>
											<td><span class="badge bg-orange">${vo.talker1_name }</span></td>							
										</c:if>
											<td><input type="button" value="채팅하기" onclick="window.open('/product/chatting?chattingNum=${vo.chattingNum}', 'Mad for Golf', '_blank');">
												<input type="button" id="exit" value="채팅나가기" onclick="javascript:exit();"><input type="hidden" id="exitChattingNum" value="${vo.chattingNum }"></td>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

<!-- ======================================== 페이징 네비바 ======================================== -->
	<!-- Pagination -->
	<nav aria-label="Page navigation">
		<ul class="pagination">
			<c:if test="${pm.prev }">
				<%-- ${pm.prev }결과가 참(true)일 때 --%>
				<li class="page-item"><a id="ProductAreaPage" class="page-link" href="chattingList?page=${pm.startPage-1 }"><i class="fa fa-angle-left"></i></a></li>
				<!-- 현재 위치한 페이지 블럭의 첫번째 페이지보다 -1인 페이지로 이동  -->
			</c:if>
			<c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
				<li class="page-item" <c:out value="${pm.vo.page == idx?'class=active':'active' }"/>>
					<a id="ProductAreaPage" class="page-link" href="chattingList?page=${idx }">${idx }</a>
				</li>
			</c:forEach>
			<c:if test="${pm.next }">
				<%-- ${pm.next }결과가 참(true)일 때 --%> 
				<li class="page-item"><a id="ProductAreaPage" class="page-link" href="chattingList?page=${pm.endPage+1 }"><i class="fa fa-angle-right"></i></a></li>
				<!-- 현재 위치한 페이징 블럭의 마지막 페이지보다 +1인 페이지로 이동 -->
			</c:if>
		</ul>
	</nav><br><br>
<!-- ======================================== 페이징 네비바 ======================================== -->
	
<%@ include file="../include/footer.jsp" %>
