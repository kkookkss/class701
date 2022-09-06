<%@page import="data.dto.CategoryDto"%>
<%@page import="data.dao.CategoryDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.BoardDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	CategoryDao category_dao = new CategoryDao();

	List<CategoryDto> category_list = category_dao.getAllCategory();
	
	JSONArray arr = new JSONArray();
	
	for(CategoryDto category_dto:category_list) {
		JSONObject ob = new JSONObject();
		
		ob.put("category_id", category_dto.getCategory_id());
		ob.put("category_name", category_dto.getCategory_name());
		
		arr.add(ob);
	}
%>
<%=arr.toString()%>