<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chatting.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/talkplus-js-0.2.17.js" ></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script type="text/javascript">
window.resizeTo(540, 670);

var DEMO_CHANNEL_ID = "${vo.chattingNum }";

var userid1 = "${sessionScope.user_id }";
var text1 = userid1.substring(0, userid1.indexOf('@'));
var text2 = userid1.substring(userid1.indexOf("@")+1, userid1.indexOf("."));
var text3 = userid1.substring(userid1.lastIndexOf('.') + 1);
var talker1_id = text1 + text2 + text3;
var talker1_name = "${sessionScope.user_name }";

var userid2 = "";
var talker2_id = "";
var talker2_name = "";

if(talker1_id == "${vo.talker1_id }") {
	userid2 = "${vo.talker2_id }";
	var text4 = userid2.substring(0, userid2.indexOf('@'));
	var text5 = userid2.substring(userid2.indexOf("@")+1, userid2.indexOf("."));
	var text6 = userid2.substring(userid2.lastIndexOf('.') + 1);
	talker2_id = text4 + text5 + text6;
	talker2_name = "${vo.talker2_name }";
} else {
	userid2 = "${vo.talker1_id }";
	var text4 = userid2.substring(0, userid2.indexOf('@'));
	var text5 = userid2.substring(userid2.indexOf("@")+1, userid2.indexOf("."));
	var text6 = userid2.substring(userid2.lastIndexOf('.') + 1);
	talker2_id = text4 + text5 + text6;
	talker2_name = "${vo.talker1_name }";
}

//var APP_ID = '6d4f7ab2-f06e-4978-8282-8fc150e43cd0';
//var client = new TalkPlus.Client({appId: APP_ID});

// //사용자 생성
// $(document).ready(function(){
// 	//alert("확인");
// 	$.ajax({
// 		url: "https://api.talkplus.io/v1.4/api/users/create",
// 		type: "post",
// 		beforeSend: function(hdata) {
//             hdata.setRequestHeader("content-type","application/json");
//             hdata.setRequestHeader("api-key", "03a0408c7c56c3b9da2fb2349a74888f9944a059b88423079eb46914750409ba");
//             hdata.setRequestHeader("app-id", "6d4f7ab2-f06e-4978-8282-8fc150e43cd0");
//         },
//         data: JSON.stringify({"userId" : talker1_id, "password" : "1234", "username" : talker1_name, "profileImageUrl":"https://notion-emojis.s3-us-west-2.amazonaws.com/prod/svg-twitter/26f3.svg"}),
// 		success: function(rdata){
// 			console.log(rdata);
// 		},
// 		error: function(rdata){
// 			console.log(rdata);
// 		}
// 	});
// });


// 사용자 로그인
$(document).ready(function(){
	//alert("확인");
	$.ajax({
		url: "https://api.talkplus.io/v1.4/api/users/login",
		type: "post",
		beforeSend: function(hdata) {
			hdata.setRequestHeader("content-type","application/json");
			hdata.setRequestHeader("api-key", "03a0408c7c56c3b9da2fb2349a74888f9944a059b88423079eb46914750409ba");
			hdata.setRequestHeader("app-id", "6d4f7ab2-f06e-4978-8282-8fc150e43cd0");
		},
		data: JSON.stringify({"userId": talker1_id, "password": "1234"}),
		success: function(rdata){
			console.log(rdata.loginToken);
			console.log(talker1_id);
			console.log(talker1_name);

			client.loginWithToken({"userId": talker1_id, "username": talker1_name, "loginToken":rdata.loginToken, "profileImageUrl":"https://notion-emojis.s3-us-west-2.amazonaws.com/prod/svg-twitter/26f3.svg"}, function (errResp, data) {
//				loginUserInfo = data.user;
//				console.log(loginUserInfo);
//				console.log(errResp);
    			
				// 로그인 확인
				const isLoggedIn = client.isLoggedIn();
				console.log(isLoggedIn);
    			
// 				$('.user-box .user-img').attr('src', loginUserInfo.profileImageUrl);
// 				$('.user-box .name input').val(loginUserInfo.username);
				
// 				//user name 변경
// 				changeUserName(loginUserInfo);
				
				if (errResp) {
					return alert("@@"+JSON.stringify(errResp));
				}
				
				// join demo channel
				client.joinChannel({channelId: DEMO_CHANNEL_ID}, function (errResp, data) {
					console.log(errResp);
					if (errResp) {
						if (errResp.code === '2003') { // if channel not found, create it
							client.createChannel({
								channelId: DEMO_CHANNEL_ID,
								name: DEMO_CHANNEL_ID,
								type: 'public',
								members: [talker2_id],
								reuseChannel: true,
								hideMessagesBeforeJoin: true
							}, function (errResp, data) {
								if (errResp) {
									return console.log(JSON.stringify(errResp));
								}
							});
						} else if (errResp.code === '2008') { // if user already had joined channel before, don't worry about error
							// don't handle
						} else {
							return alert("채널만들기"+JSON.stringify(errResp));
						}
					}
 					client.getMessages({channelId: DEMO_CHANNEL_ID}, function (errResp, data) {
						if (errResp) {
							return alert("@@@@@"+JSON.stringify(errResp));
						}
						populateChatWindowWithMessages(data.messages);
					});
				});
			});
 		},
		error: function(rdata){
			console.log(rdata);
		}
	});
});

</script>
</head>
<body>
<!-- <div class="wrap" id="wrap"> -->


	<main class="chat-wrap" style="flex:none; width:auto; padding: 0px;">
		<div class="chat-wrap-inner" style="width:520px; margin:0px; padding-bottom:0px;">
			<div class="chat-container" id="chat-container">
				<h2 class="chat-title">Mad for Golf</h2>
				<!-- chat-area -->
				<div class="chat-area" id="chatView">
					<div class="date"></div>
					<!-- message-area -->
					<div class="message-area">
						
					</div>
					<!-- //message-area -->
				</div>
				<!-- //chat-area -->
				<!-- message-write-area -->
				<div class="message-write-area">
					<div class="message-write-inner">
						<div class="write-box">
							<input type="text" class="enterMessage" placeholder="메시지를 입력해주세요.">
						</div>
						<a class="btn-send" id="btnEnterMessage" href="javascript:void(0);">전송</a>
					</div>
				</div>
				<!-- //message-write-area -->
			</div>
		</div>
	</main>
<!-- </div> -->

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/index2.js" type="module"></script>
</body>
</html>