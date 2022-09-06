<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
<style type="text/css">
	* {
		font-family: "Jua";
	}
	#wrap {
		position: absolute;
		left:50%;
		top:20%;
		transform:translate(-50%,-50%);
	}
</style>
</head>
<body>
<%
	String user_id = (String) session.getAttribute("user_id");

	UserDao user_dao = new UserDao();

	UserDto user_dto = user_dao.getUser(user_id);

%>
	<div style="margin: 100px auto; width:300px;">
		<form action="user_delete_action.jsp" method="post">
		<input type="hidden" name="user_id" value="<%=user_id %>">
			<table class="table table-borderless">
				<h2 align="center"><b>회원탈퇴</b></h2>
				<br>
				<tr>
					<td>
						비밀번호<br>
						<input type="password" class="form-control" name="pwd" required="required">
					</td>
				</tr>
				<tr>
					<td>
						비밀번호확인<br>
						<input type="password" class="form-control" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-danger" style="margin-top:10px;">
						탈퇴하기</button>
						&nbsp;
						<button type="button" class="btn btn-secondary" style="margin-top:10px;"
						onclick=history.back()>
						취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>