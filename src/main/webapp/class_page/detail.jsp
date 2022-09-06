<%@page import="data.dto.CategoryDto"%>
<%@page import="data.dao.CategoryDao"%>
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
	
	div.total{
		display: flex;
		justify-content: space-between;
		padding: 0 110px;
		padding-right: 145px;
		
	}

	div.left{
		width:70%;

	}
	div.top{
		padding: 0 110px;
		padding-right: 140px;
		margin-top: 74px;
	}
	div.menu-bar{
		padding-left: 90px;
		padding-right: 140px;
		position: sticky;
        height: 120px;
        top: 73px;
        background-color: #ffffff;
	}
	div.a>b{
		font-size: 15px;
		color: gray;
		position: relative;
		left: -90px;
		top:5px;
		margin-right: 10px;
		cursor: pointer;
	}
	div.b>b{
		font-size: 13px;
		color: gray;
		position: relative;
		left: -90px;
		top:5px;
		margin-right: 10px;
		cursor: pointer;
	}
	div.right{
		width: 30%;
		position: sticky;
        height: 450px;
        top: 70px;
      /*   background-color: skyblue; */
        padding:10px;
     
	}
	b.content-image{
		-webkit-transform:scale(1.9);
	}
	
	div{
		border: 0px solid gray;
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
	
</style>
</head>
<body>
	<%
		String class_id = request.getParameter("class_id");
	
		ClassDao class_dao = new ClassDao();
		ClassDto class_dto = class_dao.getData(class_id);
		
		String[] arr = class_dto.getClass_option().split(",");
		
		CategoryDao category_dao = new CategoryDao();
		CategoryDto category_dto = category_dao.getCategory(class_dto.getCategory_id());
		
		UserDao user_dao = new UserDao();
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
			        			<div class="nav-link-box" style="margin-left: -30px;">
			      					<a class="nav-link" href="comain.jsp" style="font-size: calc(0.55em + 0.5vw);font-weight: bold;">커뮤니티</a>
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
		<div class="top">
			<img src="../save/<%=class_dto.getMain_image() %>" style="width: 100%; height:300px;">
		</div>
		<div class="total">
			<div class="left">
			
					<div class="menu-bar">
						<div class="a" style="margin-top: 10px;">
							<b>후기</b>
							<b>클래스 소개</b>
							<b>커리큘럼</b>
							<b>키트소개</b>
							<b>크리에이터</b>
							<b>커뮤니티</b>
							<b>환불 정책</b>
							<b>추천</b>
						</div>
						<div class="b" style="margin-top: 20px;">
							<b style="font-size: 18px; color: black;">클래스 정보</b><br>
							<b>클래스 분량</b>
							<b style="color: black;">11개 챕터, 37개 세부강의</b>
							<b>수강 가능일</b>
							<b style="color: black;">바로 수강 가능</b>
							<b>자막 포함 여부</b>
							<b style="color: black;">포함 안됨</b>
						</div>
					
				</div>
				<div style="width: 100%; height:1100px; padding-top:100px; display: flex; justify-content: center;">
					<b class="content-image" style="font-size: 24px; margin-top:250px;"><%=class_dto.getContent() %></b>
				</div>
			</div>
			<div class="right shadow-sm">			
				<div style="padding: 10px;">
					<b style="font-size: 15px; color:gray;"><%=category_dto.getCategory_name() %></b>
					<br>
					<b style="font-size: 25px;"><%=class_dto.getTitle() %></b>
					<br><br>
				</div>
				<div align="right" style="margin-top:30px;">
					<b style="padding: 0px 10px;"><%=nf.format(Integer.parseInt(class_dto.getPrice()))%></b>
				</div>
				<hr>
				<div align="center">
					<div style="position: flex; justify-content: space-between; width:100%;">
						<% int num=0;
							for(int i=0; i<arr.length; i++) {
								if((i+1)%2==1){%>
									<div style="float: left; width: 50%; text-align: left; padding-left: 20px;">
										<b style="font-size: 15px;">
											<%=arr[i] %>
										</b>
									</div>
								<% } else {%>
									<div style="float: right; display: inline-block; width:50%; text-align: left; padding-left: 20px;">
										<b style="font-size: 15px;">
											<%=arr[i] %>
										</b>
									</div>
								<%}
								if((i+1)%2==0) {%>
									</div><br><div style="position: flex; justify-content: space-between; width:100%">
								<%}
								%>
							<%}%></div><%
						%>
				</div>
				<div align="center" style="margin-top: 50px;">	
					<button style="width: 30%;" type="button" class="btn btn-secondary" onclick="location.href='wish_add_action.jsp?class_id=<%=class_dto.getClass_id()%>'">
						<i class='fas fa-heart' style="font-size: 13px;"></i>
						305
					</button>
					<button style="width: 30%;" type="button" class="btn btn-secondary" onclick="location.href='main.jsp'">
						공유하기
					</button>
					<button style="width: 30%;" type="button" class="btn btn-secondary" onclick="location.href='main.jsp'">
						선물하기
					</button>
					
					<button style="width: 94%; margin-top: 10px; background-color: rgb(255, 86, 0); color: white; font-weight: bold;" type="button" class="btn" onclick="location.href='cart_add_action.jsp?class_id=<%=class_dto.getClass_id()%>'">
						수강하기
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
