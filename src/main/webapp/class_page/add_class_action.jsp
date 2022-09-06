<%@page import="data.dao.ClassDao"%>
<%@page import="data.dto.ClassDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 업로드할 폴더
	String realFolder = getServletContext().getRealPath("/save");
	System.out.println(realFolder); //콘솔로 이클립스 내의 톰캣위치에 저장된 save 확인

	// 업로드할 이미지의 크기
	int uploadSize = 1024*1024*10; // 10mb
	
	MultipartRequest multiRequest = null;		

	try{
		// DefaultFileRenamePolicy: 같은 이름으로 업로드할 경우 자동으로 이름을 변경해줌
		multiRequest = new MultipartRequest(request, realFolder, uploadSize, "utf-8", new DefaultFileRenamePolicy());
		
		// 폼데이터 읽기
		String title = multiRequest.getParameter("title");
		String mentor = multiRequest.getParameter("mentor");
		String category_id = multiRequest.getParameter("category_id");
		String price = multiRequest.getParameter("price");
		String[] options = multiRequest.getParameterValues("option");
		String content = multiRequest.getParameter("content");
		
		// 메인사진은 업로드된 파일명으로 저장
		String thumbnail_image = multiRequest.getFilesystemName("thumbnail_image");
		String main_image = multiRequest.getFilesystemName("main_image");
		
		String option ="";
		
		for(String i:options) {
			option += i;
			option += ",";
		}
		
		// dto에 저장
		ClassDto dto = new ClassDto();
		
		dto.setTitle(title);
		dto.setMentor(mentor);
		dto.setCategory_id(category_id);
		dto.setPrice(price);
		dto.setClass_option(option);
		dto.setContent(content);
		dto.setThumbnail_image(thumbnail_image);
		dto.setMain_image(main_image);
		
		// dao 선언
		ClassDao dao = new ClassDao();
		
		// insert
		dao.insertClass(dto);
		
		// smartlist.jsp 이동
		response.sendRedirect("adminpage.jsp");
		
	} catch(Exception e) {
		System.out.println("업로드 오류: "+e.getMessage());
	}
%>