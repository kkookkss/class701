<%@page import="data.dao.UserDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = request.getParameter("email");
	String pwd	= request.getParameter("pwd");
	
	UserDao dao = new UserDao();
	
	String user_id = dao.signIn(email, pwd);
	
	if(user_id != null) {
		%>
			<script>
				alert(user_id);
			</script>
		<%
		session.setAttribute("user_id", user_id);
		session.setAttribute("email", email);
		session.setAttribute("loginok", "yes");
		
		// 세션 저장 후 메인으로 이동
		response.sendRedirect("main.jsp");
	} else {
	%>
		<script>
			alert("이메일과 비밀번호를 다시 확인해주세요");
			history.back();
		</script>
	<%	
	}	
%>