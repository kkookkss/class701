<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="data.dto.ClassDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ClassDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:800" rel="stylesheet">
    
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
<style type="text/css">
	body * {
		font-size:20px;
		font-family: Nanum Gothic;
	}
	
/* 	div {
		border:1px solid gray;
	} */
	
	.nav-title b{
		margin-left: 20px;
		font-size: calc(1em + 0.75vw);

	}
	.nav-item{
		margin-left: 10px;
	}
	.nav-link-box{
		width:110px;
		text-align: center;
		margin-top:5px;
	}
	.nav-search{
		margin-left: 50px;
		margin-top: 5px;
	}
	.nav-search input{
		height: 45px;
	}
	.nav-btn {
		margin-left:10px;
		text-align: right;
	}
	div.mytotal{
		margin-top:15px;
		display: flex;
		padding-left: 20px;
	}
	div.mytotal-left{
		float: left;
	}
	div.mytotal-right{
		float: right;
		display: inline-block;
		margin-left: 10px;
		margin-top: 2px;
	}
	
	.content{
		padding: 10px;
		width: 60%;
		margin: auto;
	}
	.box_top{
		margin:auto;
		display: flex;
		padding-bottom: 20px;
		justify-content: space-between;
	}
	.box_left {
  		float:left; 
  		width:700px; 
  		height:40px;
  		/* background-color:red; */
  	}
  	.box_middle {
  		margin:auto;
  		display:flex;
  		justify-content: flex-start;
  		padding-bottom: 10px;
  		margin-bottom: 30px;
  		/* background-color: green; */
  	}
  	.box_bottom {
  		margin:auto;
  		display:flex;
  		justify-content: flex-start;
  		/* background-color: yellow; */
  	}
  	div#result2 {
  		position: absolute;
  		top: 120px;
  		padding-bottom: -30px;
  		padding-left: 65px;
  		/* background-color: #ffffee;  */
  	}
  	div#result {
  		padding: 50px 30px;
  		/* background-color: #ffeeff; */
  	}
  	li.nav-item div a{
  		font-size: 1em;
  	}
  	div.list-group{
  		margin-bottom:10px;
  	}
  	div.list-group button{
  		padding-left: 20px;
  		margin-left: 50px;
  	}
  	
  	.modal{ 
  		position:absolute; 
  		width:100%; 
  		height:200em; 
  		background: rgba(0,0,0,0.8); 
  		top:0; 
  		left:0; 
  		display:none;
	}

	.modal_content{
	 	width: 48%; height: 510px;
	 	background:#fff; border-radius:10px;
	 	position:relative; top: 150px; left: 33.5%;
	 	margin-top: 0px; margin-left: 0px;
	 	box-sizing:border-box; padding:30px;
	 	line-height:23px; cursor:pointer;
	}
	
	div.list-group>button{
		border:none;
		background-color: #fff;
	}
	
	input:focus,
	input:active,
	button:focus,
	button:active {
  		outline: none;
  		box-shadow: none;
	}
	
	
	a{
		text-decoration: none;
		color: black;
	}
	a:visited {
		color: black;
	}
	a:hover {
		color: black;
	}
	
	div{
		border: 0px solid gray;
	}
</style>
</head>
<body>
	<%
		ClassDao class_dao = new ClassDao();
		UserDao user_dao = new UserDao();
	
		List<ClassDto> list = class_dao.getAllData();
		
		String user_id = (String)session.getAttribute("user_id");
		UserDto user_dto = user_dao.getUser(user_id);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		NumberFormat nf = NumberFormat.getCurrencyInstance();
	%>
	<div>
		<div>
			<nav class="navbar navbar-expand-sm navbar-light bg-light fixed-top">
	  			<div class="container-fluid" style="padding-right: 145px; margin-left: 110px; padding-bottom: 5px;">
	  				<div>
		    			<a class="navbar-brand nav-title" href="main.jsp"><b>CLASS701</b></a>
	  				</div>
	    			<div class="collapse navbar-collapse" id="mynavbar">
		     			<ul class="navbar-nav me-auto">
		       				<li class="nav-item">
			       				<div class="nav-link-box">
			        				<a class="nav-link" href="main.jsp" style="font-size: calc(0.55em + 0.5vw); font-weight: bold;">클래스</a>
		        				</div>
		        			</li>
		        			<li class="nav-item">
			        			<div class="nav-link-box"  style="margin-left: -30px;">
			      					<a class="nav-link" href="comain.jsp" style="font-size: calc(0.55em + 0.5vw); font-weight: bold;">커뮤니티</a>
		      					</div>
		        			</li>
			      			<li>
				      			<div class="nav-search" style="display:table-cell; vertical-align:middle; display: flex;">
					      			<form>
					        			<input class="form-control form-control-lg" type="text" id="sclass" style="width:calc(20em + 1vw); position: relative; left: 0px; top:0px;" placeholder="찾으시는 정보가 있나요?">
					      			</form>
					        		<i class='fas fa-search' id="sbtn" style="color:gray; font-size: 30px; position: relative; left: -40px; top:8px; cursor: pointer;"></i>
				      			</div>
			      			</li>
		      			</ul>
						<div class="nav-btn">
							<%
							if(user_id != null) {
								if("1".equals(user_id)) {%>
									<button class="btn btn-danger" type="button" onclick="location.href='adminpage.jsp'">관리자페이지</button>
								<%}
								%>
								<a href="mypage.jsp">
									<img src="../image/<%=user_dto.getProfile_image()%>" style="border-radius: 50px; width:50px; height: 50px;">
								</a>
								&nbsp;
								<i class='fas fa-angle-down' data-bs-toggle="dropdown"></i>
								<ul class="dropdown-menu dropdown-menu-end" style="position:absolute; right: 67px; top:72px;">
								   	<li style="width:200px; padding-right: 30px;">
								   		<a href="mypage.jsp" style="font-size: 15px;">
								   			<div class="mytotal">
									   			<div class="mytotal-left">
											   		<img src="../image/<%=user_dto.getProfile_image()%>" style="border-radius: 50px; width:50px; height: 50px;">
									   			</div>
									   			<div class="mytotal-right">
									   				<div style="font-size: 13px; font">
									   					<%=user_dto.getNickname()%>
									  				</div>
									  				<div style="font-size: 13px; color:rgb(255, 86, 0)">
									  					마이페이지 >
									  				</div>
									   			</div>
								   			</div>
								   		</a>
								   	</li>
								   		<hr style="width:80%; margin-left: 20px;">
									<li><a href="user_update.jsp" style="font-size: 13px; margin-left: 20px;">회원정보수정</a></li>
								    <li style="margin-bottom: 15px;"><a href="logout_action.jsp" style="font-size: 13px; margin-left: 20px;">로그아웃</a></li>
								</ul>
									<%
								} else {
									%>
									<a href="sign_in.jsp" style="font-size: 20px; color: black; text-decoration: none; font-weight: bolder;">로그인</a>
									<%
								}
							%>	
						</div>
	    			</div>
	  			</div>
			</nav>
		</div>
		<div style="width:100%; margin-top:80px;">
			<div id="result" style="width:80%; height:1000px; float: right;"></div>
			<nav class="fixed-top">
				<div id="result2" style="width:20%; height:600px;  float: left;"></div>
			</nav>
		</div>
		<div>
			<nav class="fixed-bottom">
				<div style="width:80px; height:80px; float:right; margin:30px; text-align: center; line-height: 80px;">
					<img id="modal" alt="qna" src="../image/qna.png" style="cursor: pointer;">
				</div>
			</nav>
		</div>
		<div class="modal">
  			<div class="modal_content">
				<div class="inputform">
					<table style="width: 100%">
						<tr>
							<td style="padding-bottom: 20px;">
								<b style="font-size: 30px;">질문등록</b>
							</td>
						</tr>
						<tr>
							<td style="padding-top: 20px;">
								<h6>제목</h5>
								<input type="text" id="add-board-subject" required="required" class="form-control" maxlength="30">
							</td>
						</tr>
						<tr>
							<td style="padding-top: 20px;">
								<h6>카테고리</h5>
								<select id="add-board-category" class="form-select" style="width:150px">
									<option value="1">개발</option>
									<option value="2">타로</option>
									<option value="3">유튜브</option>
									<option value="4">축구</option>
									<option value="5">독서</option>
									<option value="6">커피</option>
									<option value="7">베이커리</option>
								</select>
							</td>
						</tr>
						<tr>
							<td style="padding-top: 20px;">
						
								<textarea id="add-board-content" required="required" class="form-control" style="height: 150px;" maxlength="150"></textarea>
							</td>
						</tr>
						<tr>
							<td align="center" style="padding-top: 20px;">
								<button type="button" class="btn btn-secondary" id="btnsave">질문 등록</button>
								<button type="button" class="btn btn-secondary" id="btnclose">취소</button>
							</td>
						</tr>
					</table>
				</div>
  			</div>
		</div>
	</div>
<script>
		
		search("");
		
		$(document).ready(function(){
			$("#sclass").on('keyup keypress',function(){
				search($(this).val().trim());
			});
		});
		
		$("#sbtn").click(function(){
			//alert($("#search_class").val());
			search($("#sclass").val().trim()); 
		});
		
/* 		$(document).on("mouseover","b.content",function(e){
			$("div.mytooltip").fadeIn();
		});
		
		$(document).on("mouseout","b.content",function(e){
			$("div.mytooltip").fadeOut();
		}); */
		
		$(document).on("click","#catebtn",function(){
			 //search($(this).val());
			 // alert($(this).val());
		});	

	
	// 삭제 버튼 클릭시
	$(document).on("click", "i.delete", function(){
		
		var board_id = $(this).attr("board_id");
		alert(board_id);
		
		var a = confirm("삭제하려면 [확인]을 선택하세요");
		
		if(!a) { // 취소 선택시 함수 종료
			return;
		}
		
		$.ajax({
			type : "get",
			url : "delete_board.jsp",
			dataType : "html",
			data : {'board_id':board_id},
			success : function(res) {
				// 전체 새로고침
				//search($("#sangpum").val().trim());
				// 강제 호출
				$("i.delete").trigger("click");
			},
			statusCode : {
				404 : function() {
					alert("xml 파일을 찾을 수 없어요");
				},
				500 : function() {
					alert("서버 오류 .. 코드를 다시 한번 보세요");
				}
			}
		});
		
	});

	
	function search(sclass) {
		var r = "";
		
		$.ajax({
			type : "get",
			url : "comainjson.jsp",
			dataType : "json",
			data : {'sclass':sclass},
			success : function(res) {
				
				$.each(res, function(i, ele) {
					
					r += "<div class='content'>";
					
					r += "<div class='box_top'>";
					r += "<div class='box_left'>";
					r += "<b style='font-size:30px;'>"+ele.subject+"</b>";
					r += "</div>";
					r += "</div>";
					
					r += "<div class='box_middle'>";
					r += ele.content;
					r += "</div>";
					
					
					r += "<div class='box_bottom'>";
					r += "<img src='"+ele.user_profile_image+"' style='width:40px; height:40px; border-radius:50px; margin-right:10px;'>";
				 	r += "<p style='margin-top:5px;'>"+ele.user_nickname+" | "+ele.category_name+" | "+ele.writeday+"</p>";
					r += "</div>";
				 	r += "<i class='far fa-thumbs-up' style='font-size:24px; float:right; margin-left:10px; position:relative; top: -45px; left:-130px;'></i>";
				 	r += "<i class='fas fa-heart' style='font-size:24px; float:right; margin-left:10px; position:relative; top: -45px; left:-130px;'></i>";
					r += "<i class='fas fa-trash-alt delete' style='float:right; position:relative; top: -45px; left:-30px; font-size:25px;' value="+ele.board_id+"></i>";
					
					r += "<hr style='border:1px gray solid;'>";
				
					r += "</div>";
					
					
				});
				
				$("#result").html(r);

			},
			statusCode : {
				404 : function() {
					alert("xml 파일을 찾을 수 없어요");
				},
				500 : function() {
					alert("서버 오류 .. 코드를 다시 한번 보세요");
				}
			}
		});
		var s = "";
		
		$.ajax({
			type : "get",
			url : "comainjson2.jsp",
			dataType : "json",
			data : "",
			success : function(res) {
				
				s += "<div class='container mt-1'>";
				s += "<div class='list-group'>";
				s += "<button style='display:flex; justify-content:flex-start; font-size:20px;' type='button' id='catebtn' value='0'>전체</button>";
				s += "<hr style='margin: 0; margin-top:5px; margin-bottom:10px; width:120px; position:relative; left:70px;'>";
				s += "</div>";
				s += "</div>";
				
				$.each(res, function(i, ele) {
					
					s += "<div class='container mt-1'>";
					s += "<div class='list-group'>";
					s += "<button style='display:flex; justify-content:flex-start; font-size:20px;' type='button' id='catebtn' value='"+ele.category_id+"'>"+ele.category_name+"</button>";
					s += "<hr style='margin: 0; margin-top:5px; margin-bottom:10px; width:120px; position:relative; left:70px;'>";
					s += "</div>";
					s += "</div>";
				
				});
				
				$("#result2").html(s);

			},
			statusCode : {
				404 : function() {
					alert("xml 파일을 찾을 수 없어요");
				},
				500 : function() {
					alert("서버 오류 .. 코드를 다시 한번 보세요");
				}
			}
		});

		$("#modal").click(function(){
			$(".modal").fadeIn();
		});
			  
		$("#btnclose").click(function(){
			$(".modal").fadeOut();
		});
		
		// 상품 추가버튼 이벤트
		$("#btnsave").click(function(){
		
			var subject = $("#add-board-subject").val();
			var content = $("#add-board-content").val();
			var user_id = <%=user_id%>;
			var category_id = $("#add-board-category").val();
			
			$.ajax({
				type : "get",
				url : "add_board.jsp",
				dataType : "html",
				data : {'subject':subject, 'content':content, 'user_id':user_id,'category_id':category_id},
				success : function(res) {
					
					alert("질문이 추가되었습니다.");
					
					// 전체 새로고침
					location.reload();
					
					// 기존 상태 유지하면서 새로고침하는 형식
					// 방법 1
					// search($("#sangpum").val().trim());
					
					// 방법 2
					// 강제 호출
					// $("#btn1").trigger("click");
				},
				statusCode : {
					404 : function() {
						alert("json 파일을 찾을 수 없어요");
					},
					500 : function() {
						alert("서버 오류 .. 코드를 다시 한번 보세요");
					}
				}
			});
		});	  
	}
</script>
</body>
</html>