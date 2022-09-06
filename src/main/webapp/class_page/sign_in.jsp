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
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
<style type="text/css">
	body * {
		font-size: 15px;
		font-family: Nanum Gothic;
	}
	
	div{
		border: 0px solid gray;
	}

	div.total{
		display: flex;
		justify-content: space-between;
	}
	body::-webkit-scrollbar{
	    display: none; /* Chrome, Safari, Opera*/
	}
	
	div.login-left{
		position:relative;
		left:0px;
		top:0px;
		width: 800px;
		display: flex;
		justify-content: center;
	}
	div.login-right{
		background-color: #ffffee;
		text-align: center;
	}
	div.ob{
		margin:10px 250px;
		width: 300px;
	}
	div.table{
		padding-top: 50px;
	}
	a {
		text-decoration: none;
	}
	tr{
		border-bottom: 0px;
	}
	a:visited {
		color:black;
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
	<div class="total">
		<div class="login-left">
			<div class="ob">
				<div class="title" style="margin-top: 10px;">
					<a href="main.jsp">
						<b style="font-size: 20px; font-weight: border; margin-left: 5px;">CLASS701</b>
					</a>
				</div>
				<form action="sign_in_action.jsp">
					<div  class="table">
						<table class="table table-borderless">
							<tr>
								<td align="left"><b style="font-size: 25px; font-weight: border;">로그인</b></td>
							</tr>
							<tr>
								<td align="left">
									이메일
									<input type="email" class="form-control" placeholder="example@google.com" name="email">
								</td>
							</tr>
							<tr>
								<td align="left">
									비밀번호
									<input type="password" class="form-control" placeholder="••••••" name="pwd">
								</td>
							</tr>
							<tr>
								<td>
									<div style="display: flex; justify-content: space-between;">
										<div>
											<a style="font-size: 12px; color: gray;">비밀번호를 잊으셨나요?</a>
										</div>
										<div>
											<a href="sign_up.jsp" style="font-size: 12px; color: gray;">회원 가입하기</a>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td align="center">
									<button id="loginbtn" type="submit" class="btn" style="width:100%; background-color: rgb(255, 86, 0); color:white;">로그인</button>
								</td>
							</tr>
							<tr>
								<td align="center">
									<button id="kakaobtn" type="button" class="btn" style="width:100%; background-color: rgb(255, 232, 18); color:black;">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
										<path fill="#1B1C1D" fill-rule="evenodd" d="M12 4c-4.971 0-9 3.185-9 7.115 0 2.558 1.707 4.8 4.27 6.054l-.78 2.94c-.122.489.179.483.377.351l3.463-2.353a11.39 11.39 0 001.67.123c4.971 0 9-3.185 9-7.115S16.971 4 12 4"></path>
										</svg>
										카카오로 3초 만에 시작하기
									</button>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
		<div class="login-right">
			<img src="../image/original.jpeg" style="width:110%; height: 110%;">
		</div>
	</div>
</body>
</html>