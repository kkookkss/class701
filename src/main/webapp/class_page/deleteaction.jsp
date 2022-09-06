<%@page import="data.dao.ClassDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	// num, currentPage 읽기
	String class_id = request.getParameter("class_id");
	
	// dao 선언
	ClassDao dao = new ClassDao();
	
	// 삭제메서드 호출
	dao.deleteClass(class_id);
	
	// list페이지 이동 (보던 페이지)
	response.sendRedirect("adminpage.jsp");
%>