<%@page import="data.dao.ClassDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	// nums 읽기
	String class_id_list = request.getParameter("class_id_list");
	
	// ,로 분리하기 변수 String[] num
	String[] num = class_id_list.split(",");
	
	// for문으로 num갯수만큼 반복해서 delete 메서드 호출
	ClassDao dao = new ClassDao();
	
	for(String class_id:num) {
		dao.deleteClass(class_id);
	}
	
	// 목록으로 이동
	response.sendRedirect("adminpage.jsp");
%>