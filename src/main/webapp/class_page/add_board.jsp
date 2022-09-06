<%@page import="data.dao.BoardDao"%>
<%@page import="data.dto.BoardDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String user_id = request.getParameter("user_id");
	String category_id = request.getParameter("category_id");

	BoardDto dto = new BoardDto();
	
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setCategory_id(category_id);
	dto.setUser_id(user_id);
	
	BoardDao dao = new BoardDao();
	
	dao.insertBoard(dto);

	
%>