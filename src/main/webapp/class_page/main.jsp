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
	
	html, body {
  		margin: 0;
  		padding: 0;
  		height: 100%;
	}
	
	#body-wrapper {
		height: auto;
	    min-height: 100%;
	    padding-bottom: 200px; /* footer의 높이 */
	}
	
	footer {
	    width: 100%;
	    height: 200px; /* footer의 높이 */
		position : relative;
		transform : translateY(50%);
		
	}
	
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
	

	div.middle{
		margin-top:50px;
		width:50%;
	}
	
	ul.classlist{
		display: flex;
		margin-top: 20px;
	}
	ul.classlist li{
		list-style: none;
		width:240px;
		height: 280px;
		margin-bottom: 220px;
		text-align: center;
		margin-right: 107px;
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
	<div id="body-warpper">
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
				      				<a class="nav-link" href="comain.jsp" style="font-size: calc(0.55em + 0.5vw);font-weight: bold;">커뮤니티</a>
			      				</div>
			        		</li>
				     		<li>
					     		<div class="nav-search" style="display:table-cell; vertical-align:middle; display: flex;">
						      		<form>
						        		<input class="form-control form-control-lg" type="text" id="sclass" style="width:calc(20em + 1vw); position: relative; left: 0px; top:0px;" placeholder="찾으시는 취미가 있나요?">
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
			<!-- Carousel -->
			<div id="demo" class="carousel slide" data-bs-ride="carousel" style="margin-top:75px;">
				<!-- Indicators/dots -->
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
				    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
				    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
				</div>
				  
				<!-- The slideshow/carousel -->
				<div class="carousel-inner">
					<div class="carousel-item active">
				    	<img src="../banner_image/banner_1.png" alt="Los Angeles" class="d-block" style="width: 100%; height: 400px;">
				    </div>
				    <div class="carousel-item">
				      	<img src="../banner_image/banner_2.png" alt="Chicago" class="d-block" style="width: 100%; height: 400px;">
				    </div>
				    <div class="carousel-item">
				      	<img src="../banner_image/banner_3.png" alt="New York" class="d-block" style="width: 100%; height:  400px;">
				    </div>
				</div>
				  
				<!-- Left and right controls/icons -->
				<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
				    <span class="carousel-control-next-icon"></span>
				</button>
			</div>
		<div style="align-items: center; margin-left: 110px;">
			<div class="middle">
				<b style="margin-left: 35px; font-size: 30px;">BIT 추천 클래스</b>
				<ul class="classlist">
				<%
					for(int i=0; i<list.size(); i++){
						ClassDto class_dto = list.get(i);%>
							<li>
								<a href="detail.jsp?class_id=<%=class_dto.getClass_id()%>">
									<img src="../save/<%=class_dto.getThumbnail_image() %>" style="width:250px; height:350px; border-radius: 10px;" class="img-thumbnail">
								</a>
								<b style="font-size:15px; font-weight: border; display: flex; justify-content: flex-start; position: relative; top: 5px;">
									<%=class_dto.getMentor() %>
								</b>
								<br>
								<a  href="detail.jsp?class_id=<%=class_dto.getClass_id()%>">
									<b style="display: flex; justify-content: flex-start; position: relative; top: -25px; left: -2px; font-weight: normal; text-align: left;">
										<%=class_dto.getTitle() %>
									</b>
									<br>
								</a>
								<i class='fas fa-heart' style="color: lightgray; font-size: 15px; display:flex; justify-content: flex-start; position: relative; top: -50px; left:0px; cursor: pointer;"></i>
								<hr style="color: gray; display:flex; justify-content: flex-start; position: relative; top: -55px; width:255px;">
								<b style="display: flex; justify-content: flex-start; position: relative; top: -60px; left: 0px; font-size: 15px; font-weight: bord;">
									<%=nf.format(Integer.parseInt(class_dto.getPrice()))%>
								</b>
								<br>
							</li>
							<% 
								if((i+1)%4==0){%>
									</ul><ul class="classlist">
								<%}
							%>
												
					<%}
				%>
				</ul>
			</div>
		</div>
		<footer>
			<div style="display: flex; justify-content: space-between; padding-left: 140px; padding-top:30px; padding-right: 140px;">
				<div class="fleft" style="float: left; width:40%;">
					<b style="color: gray; font-size: 15px;">CLASS701 Korea</b>
				</div>
				<div class="fright" style="float: right; width:60%; display: inline-block;">
					<div style="padding-bottom: 10px;">
						<b style="color: gray; font-size: 12px;">이용약관 • 개인정보 처리방침 • 정기구독서비스 이용약관 • 101프라임 이용약관 • 기프트카드 및 캐시 이용약관 • 환불 정책 • 사업자 정보 확인</b><br>
						<b style="color: gray; font-size: 12px; position: relative; top: -10px;">단체/기업 교육 문의 • 제휴/협력 문의 • PR 관련 문의 • 지식재산권 침해 신고 센터</b>
					</div>
					<div>
						<p style="color: gray; font-size: 12px;">
							주식회사 클래스101 | 
							대표 공대선 | 
							서울특별시 강남구 테헤란로 302, 1-11층, 13층(역삼동, 위워크타워) | 
							ask@101.inc | `
							전화번호: 1800-2109 | 
							클라우드 호스팅: Amazon Web Services Korea LLC | 
							사업자등록번호 : 457-81-00277 | 
							통신판매업신고 : 2022-서울강남-02525 | 
							클래스101은 통신판매중개자로서 중개하는 거래에 대하여 책임을 부담하지 않습니다.
						</p>
					</div>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>
