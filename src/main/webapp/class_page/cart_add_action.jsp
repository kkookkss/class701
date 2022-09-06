<%@page import="data.dao.CartDao"%>
<%@page import="data.dto.CartDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String) session.getAttribute("user_id");
	String class_id = request.getParameter("class_id");
	
	CartDto cart_dto = new CartDto();
	
	cart_dto.setUser_id(user_id);
	cart_dto.setClass_id(class_id);
	
	CartDao cart_dao = new CartDao();
	
	cart_dao.insertCart(cart_dto);
%>
<script>
	alert("해당 상품이 장바구니에 담겼습니다.");
	location.href="mypage.jsp";
</script>