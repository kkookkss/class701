<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 인코딩
	request.setCharacterEncoding("utf-8");

	// 데이터 읽기
	String user_id = request.getParameter("user_id");
	
	String email = request.getParameter("email");
	String nickname = request.getParameter("nickname");
	String phone = request.getParameter("phone");
	String profile_image = request.getParameter("profile_image");
	String pwd = request.getParameter("pwd");
	
	UserDto user_dto = new UserDto();
	
	user_dto.setEmail(email);
	user_dto.setNickname(nickname);
	user_dto.setPhone(phone);
	user_dto.setPwd(pwd);
	user_dto.setUser_id(user_id);
	user_dto.setProfile_image(profile_image);
	
	UserDao user_dao = new UserDao();
	
	user_dao.updateUser(user_dto);
	
	response.sendRedirect("main.jsp");
%>