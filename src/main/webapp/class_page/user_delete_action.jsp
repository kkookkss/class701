<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 인코딩
	request.setCharacterEncoding("utf-8");

	// 데이터 읽기
	String pwd = request.getParameter("pwd");
	String user_id = (String)session.getAttribute("user_id");
	
	UserDao user_dao = new UserDao();
	

	// isPassCheck
	boolean ch = user_dao.isPassCheck(user_id, pwd);
	
	// true면 updateform으로 이동(num전달)
	// false면 alert 후 history.back()
	if(ch) {
		user_dao.deleteUser(user_id);
		session.removeAttribute("loginok");
		session.removeAttribute("user_id");%>
		<script>
			alert("삭제되었습니다. 그동안 감사했습니다.");
			location.href="main.jsp";
		</script>
		<%
	} else {%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
		</script>
		<%}
%>