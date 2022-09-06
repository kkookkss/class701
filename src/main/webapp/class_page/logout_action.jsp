<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에서 loginof 제거 후 invaliiddate 주의 모든 세션 다 지워짐
	session.removeAttribute("loginok");
	session.removeAttribute("user_id");

%>
<script>
	alert("로그아웃 되었습니다")
	location.href="main.jsp";
</script>