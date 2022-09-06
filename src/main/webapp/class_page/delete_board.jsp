<%@page import="data.dao.BoardDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String board_id = request.getParameter("board_id");

	BoardDao dao = new BoardDao();
	
	dao.deleteBoard(board_id);
%>