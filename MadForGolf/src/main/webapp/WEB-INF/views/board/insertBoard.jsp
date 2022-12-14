<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header -->
<jsp:include page="../include/header.jsp" />
<!-- header -->
<style>

.container{
/*  	border: 5px solid red; */
}

.container2{
/*  	border: 5px solid yellow; */

}

.container3{
/*  	border: 5px solid gray; */
	width: 100%;
}

.section-heading{
/* 	border: 5px solid blue; */
	text-align: center;
}

.contact-form-area{
/* 	border: 5px solid green; */
	
}

.form-group label{
	font-weight: bold;
}
#message{
	width: 100%;
    height: 400px;
/*      border-color: #f5f5f5; */
    resize: none;
/*      background-color: #f5f5f5;  */
}

.placeholder::placeholder{
	color: #b7b7b7; 
}

.form-control_real{
    position: relative;
    z-index: 2;
    height: 45px;
    width: 100%;
    background-color: #ffffff;
    font-size: 16px;
    margin-bottom: 15px;
    border: 1px solid #e1e1e1;
    border-radius: 2px;
     padding: 0px 20px;
    font-weight: 400;
    color: #b7b7b7;
    transition-duration: 500ms;
}
.form-control_file{
    position: relative;
    z-index: 2;
    height: 70px;
    width: 100%;
    background-color: #ffffff;
    font-size: 16px;
/*     margin-bottom: 5px; */
    border: 1px solid #e1e1e1;
    border-radius: 2px;
     padding: 15px 20px;
    font-weight: 400;
    color: #b7b7b7;
    transition-duration: 500ms;
}


.label{
	height: 40px;
}

.form-control_file input{
	background-color: white;
	color: red;
}
.board_btn{
/*  	border: 5px solid blue; */
	display: flex;
	flex-flow: row nowrap;
 	justify-content: center;

	
}

.board_btn button{
	width : 30px;
	margin : 10px 20px;
	background-color: #91C788;
	border: 0;
}

.board_btn button:hover{
	margin : 10px 20px;
	background-color: #C6EBC5;
	color: white;
	
}


</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var cnt = 2;
function addFile(){
	// alert("??????");
	if(cnt < 4) {
	// ?????? ????????? ?????? -> ??????????????? ??????
		$('#div_file').append("<input type='file' class='form-control' id='content_img" + cnt + "' name='file" + cnt + "'><img id='preview'/><br>");
		cnt++;
	} else {
		alert("?????? ????????? 2???????????? ???????????????.")
	}
}
function delFile(){
	// alert("??????");
	
	if(cnt == 2) {
	// ?????? ????????? ?????? -> ??????????????? ??????
		$('#content_img').remove();
		cnt--;
	}
	else if(cnt == 3) {
	// ?????? ????????? ?????? -> ??????????????? ??????
		$('#content_img2').remove();
		cnt--;
	} else if(cnt == 4){
		$('#content_img3').remove();
		cnt--;
	} 
}

function readURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) { document.getElementById('preview').src = e.target.result; };
		reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('preview').src = "";
	}
}



$(document).ready(function(){
	// alert("??????");
	$('form').submit(function(){
		// alert("??????");
		// ???????????? ??????
		if($('#category option:selected').val()==""){
			alert('??????????????? ??????????????????.');
			$('#category').focus();
			return false;
		}
		
		// ?????? ??????
		if($('#title').val()==""){
			alert('????????? ???????????????.');
			$('#title').focus();
			return false;
		}
		// ?????? ??????
		if($('#message').val()==""){
			alert('????????? ???????????????.');
			$('#message').focus();
			return false;
		}
		
		alert("????????? ????????? ?????????????????????.");
	});
});
</script>


<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
    <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url('/resources/img/bg-img/background-img (3).jpg');">
        <h2>Community</h2>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i> Home</a></li>
                        <li class="breadcrumb-item"><a href="/board/listBoardAll"> Community</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Write Board</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- ##### Breadcrumb Area End ##### -->



<!-- 		<section class="contact-area"> -->
<div class="container">
	<div class="row align-items-center justify-content-between container2">
		<div class="container3">

                <!-- Section Heading -->
            <div class="section-heading">
                <h2>Write Board</h2>
            </div>



            <!-- Contact Form Area -->
            <div class="contact-form-area mb-100">
                <form action="/board/insertBoard" method="post" enctype="multipart/form-data">
				<input type="hidden" name="user_id" value="${sessionScope.user_id}">
                    <div class="row">

                       	<!-- ????????? ?????? -->
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                            	<select name="board_category" class="form-control_real" id="category">
                            		<option class="form-control_real" value="">--????????? ??????--</option>
  									<option class="form-control_real" value="??????">??????</option>
									<option class="form-control_real"  value="??????">??????</option>
  									<option class="form-control_real"  value="??????">??????</option>
  									<option class="form-control_real"  value="??????">??????</option>
								</select>
                            </div>
                        </div>
    
                        
                        
                        <!-- ???????????? -->
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                            	<input type="text" class="form-control_real" value="${user_name}" readonly="readonly" id="user_name">
                            	<input type="hidden" name="user_name" value="${user_name}">
                            </div>
                        </div>
                        
                        
                        <!-- ?????? -->
                        <div class="col-12">
                            <div class="form-group">
                            	<input type="text" name="title" class="form-control placeholder" id="title" placeholder="????????? ???????????????">
                            </div>
                        </div>
                        
                        
	                    <!-- ?????? -->
                        <div class="col-12">
                            <div class="form-group">
                                <textarea class="form-control placeholder" name="content" id="message" cols="30" rows="40" placeholder="????????? ???????????????"></textarea>
                            </div>
                        </div>
                        
                        
                        <!-- ???????????? -->
                        <div class="col-12 mb-4 ">
                        	<div class="form-group">
                        		<input type="file" class="form-control_file" id="content_img" name="file1" onchange="readURL(this);">
                         		<img id="preview"/><br>
                                <input type="button" id="button2" value="???????????? ??????" onclick="addFile();">
                                <input type="button" id="button2" value="???????????? ??????" onclick="delFile();">
								<div id="div_file"><!-- <input type="file" name="file"> --></div>
                        	</div>
                    	</div>
                                
                    	
                    	<!-- ???????????? -->
                        <div class="col-12 board_btn">
                            <button type="submit" class="btn alazea-btn mt-15">????????? ??????</button>
                            <button type="button" class="btn alazea-btn mt-15" onclick="location.href='/board/listBoardAll'">?????? ??????</button>
                        </div>
                    
                    
                    </div>
                </form>
            </div>
        </div>
	</div>
</div>
                
                

<!-- ?????????????????? ??? -->
<jsp:include page="../include/footer.jsp" />
<!-- ?????????????????? ??? -->		