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
		font-size: 20px;
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
	a {
		text-decoration: none;
	}
	a:visited {
		color: black
	}
	div.table {
		margin-top: 150px;
		width: 450px;
	}
	tr{
		border-bottom: 0px;
	}
	div.ob{
		display: flex;
		justify-content: center;
	}
	td{
		font-size: 15px;
	}
</style>
<script type="text/javascript">
	$(function(){
		var color;
		
		$("#loginbtn").hover(function(){
			color = $(this).css("background-color");
			console.log(color);
			$(this).css("background-color","rgb(235, 66, 0)");
		},function(){
			$(this).css("background-color",color);
		});
		
		$("#kakaobtn").hover(function(){
			color = $(this).css("background-color");
			console.log(color);
			$(this).css("background-color","rgb(235, 212, 8)");
		},function(){
			$(this).css("background-color",color);
		});
	});
</script>
</head>
<body>
	<%
		ClassDao class_dao = new ClassDao();
		UserDao user_dao = new UserDao();
		
		String user_id = (String)session.getAttribute("user_id");
		UserDto user_dto = user_dao.getUser(user_id);
	
		List<ClassDto> list = class_dao.getAllData();
		
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
		<div class="ob">
			<form action="user_update_action.jsp" method="post">
			<input type="hidden" name="user_id" value="<%=user_id %>">
				<div class="table">
					<table class="table table-borderless">
						<tr>
							<td align="left" style="padding-bottom: 40px;"><b style="font-size: 25px; font-weight: border;">정보 수정</b></td>
						</tr>
						<tr>
							<td align="left">
								닉네임
								<input type="text" class="form-control" value="<%=user_dto.getNickname() %>" name="nickname">
							</td>
						</tr>
						<tr>
							<td align="left">
								이메일
								<input type="email" class="form-control" value="<%=user_dto.getEmail() %>" name="email">
							</td>
						</tr>
						<tr>
							<td align="left">
								전화번호
								<input type="text" class="form-control" value="<%=user_dto.getPhone()==null?"":user_dto.getPhone() %>" name="phone">
							</td>
						</tr>
						<tr>
							<td align="left">
								프로필이미지
								<input type="file" class="form-control" name="profile_image">
							</td>
						</tr>
						<tr>
							<td align="left">
								비밀번호
								<input type="password" class="form-control" placeholder="••••••" name="pwd">
								<b style="font-size: 12px; color:gray;">
									<i class='fas fa-info-circle'></i>
									영문 대문자/영문 소문자/숫자/특수문자 중 2가지 이상 조합, 8자~32자
								</b>
							</td>
						</tr>
						<tr>
							<td align="left">
								비밀번호 확인
								<input type="password" class="form-control" placeholder="••••••">
							</td>
						</tr>
						<tr>
							<td align="center">
								<button id="loginbtn" type="submit" class="btn" style="width:100%; background-color: rgb(255, 86, 0); color:white;">수정 완료</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
