<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
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
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	

	String sclass = request.getParameter("sclass");
	String scate = request.getParameter("scate");
	
	BoardDao board_dao = new BoardDao();
	UserDao user_dao = new UserDao();
	CategoryDao category_dao = new CategoryDao();

	List<BoardDto> board_list = board_dao.getAllBoard(sclass);
	
	JSONArray arr = new JSONArray();
	
	
	for(BoardDto board_dto:board_list) {
		JSONObject ob = new JSONObject();
		UserDto user_dto = user_dao.getUser(board_dto.getUser_id());
		CategoryDto category_dto = category_dao.getCategory(board_dto.getCategory_id());
		
		ob.put("subject", board_dto.getSubject());
		ob.put("content", board_dto.getContent().replace("\n","<br>"));
		ob.put("writeday", sdf.format(board_dto.getWriteday()));
		ob.put("blike", board_dto.getBlike());
		ob.put("readcount", board_dto.getReadcount());
		ob.put("user_nickname", user_dto.getNickname());
		ob.put("user_profile_image", "../image/"+user_dto.getProfile_image());
		ob.put("class_id", board_dto.getClass_id());
		ob.put("category_name", category_dto.getCategory_name());
		ob.put("board_id", board_dto.getBoard_id());
		
		arr.add(ob);
	}
	
%>
<%=arr.toString()%>