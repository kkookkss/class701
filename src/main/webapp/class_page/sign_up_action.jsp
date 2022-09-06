<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String email = request.getParameter("email");
	String nickname = request.getParameter("nickname");
	String pwd	= request.getParameter("pwd");
	String profile_image = "default_profile.webp";
	
	UserDto dto = new UserDto();
	
	dto.setEmail(email);
	dto.setNickname(nickname);
	dto.setPwd(pwd);
	dto.setProfile_image(profile_image);
	
	UserDao dao = new UserDao();
	
	dao.insertUser(dto);
%>
<script>
	alert("가입이 완료되었습니다.");
	location.href="sign_in.jsp";
</script>