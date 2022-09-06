<%@page import="data.dto.CategoryDto"%>
<%@page import="data.dao.CategoryDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="data.dto.ClassDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ClassDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:800" rel="stylesheet">
    
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
<style type="text/css">
	body * {
		font-size:20px;
		font-family: Nanum Gothic;
	}
	
	.nav-title b{
		margin-left: 20px;
		font-size: calc(1em + 0.75vw);

	}
	.nav-item{
		margin-left: 10px;
	}
	.nav-link-box{
		width:110px;
		text-align: center;
		margin-top:5px;
	}
	.nav-search{
		margin-left: 50px;
		margin-top: 5px;
	}
	.nav-search input{
		height: 45px;
	}
	.nav-btn {
		margin-left:10px;
		text-align: right;
	}
	div.mytotal{
		margin-top:15px;
		display: flex;
		padding-left: 20px;
	}
	div.mytotal-left{
		float: left;
	}
	div.mytotal-right{
		float: right;
		display: inline-block;
		margin-left: 10px;
		margin-top: 2px;
	}
	
	div.total{
		display: flex;
		justify-content: space-between;
		padding: 0 140px;
		padding-right: 140px;
		margin-top: 70px;
		
	}

	div.left{
		width:30%;
		position: sticky;
        height: 500px;
        top: 70px;
       /*  background-color: skyblue; */
        padding:10px;
        padding-left: 10px;
        padding-top: 100px;

	}
	div.right{
		width: 70%;
		
		/* background-color: salmon; */
		padding: 10px;
		padding-top: 100px;
	}
	
	div{
		border: 0px solid gray;
	}
	
	a{
		text-decoration: none;
		color: black;
	}
	a:visited {
		color: black;
	}
	a:hover {
		color: black;
	}
	#blah{
		position: absolute;
		left:670px;
		top:100px;
		width:250px;
		border:1px solid black;
	}
	th{
		font-size:15px;
	}
	
</style>
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="../se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	

<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {"/Users/kkookkss"
            $('#blah')
                .attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
</script>
</head>
<body>
	<%
		ClassDao class_dao = new ClassDao();
		UserDao user_dao = new UserDao();
	
		List<ClassDto> list = class_dao.getAllData();
		int totalCount = class_dao.getTotalCount();
		
		String user_id = (String)session.getAttribute("user_id");
		UserDto user_dto = user_dao.getUser(user_id);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		NumberFormat nf = NumberFormat.getCurrencyInstance();
	%>
	<div>
		<div>
			<nav class="navbar navbar-expand-sm navbar-light bg-light fixed-top">
	  			<div class="container-fluid" style="padding-right: 145px; margin-left: 110px; padding-bottom: 5px;">
	  				<div>
		    			<a class="navbar-brand nav-title" href="main.jsp"><b>CLASS701</b></a>
	  				</div>
	    			<div class="collapse navbar-collapse" id="mynavbar">
		     			<ul class="navbar-nav me-auto">
		       				<li class="nav-item">
			       				<div class="nav-link-box">
			        				<a class="nav-link" href="main.jsp" style="font-size: calc(0.55em + 0.5vw); font-weight: bold;">클래스</a>
		        				</div>
		        			</li>
		        			<li class="nav-item">
			        			<div class="nav-link-box" style="margin-left: -30px;">
			      					<a class="nav-link" href="comain.jsp" style="font-size: calc(0.55em + 0.5vw);font-weight: bold;">커뮤니티</a>
		      					</div>
		        			</li>
			      			<li>
				      			<div class="nav-search" style="display:table-cell; vertical-align:middle; display: flex;">
					      			<form>
					        			<input class="form-control form-control-lg" type="text" id="sclass" style="width:calc(20em + 1vw); position: relative; left: 0px; top:0px;" placeholder="찾으시는 정보가 있나요?">
					      			</form>
					        			<i class='fas fa-search' id="sbtn" style="color:gray; font-size: 30px; position: relative; left: -40px; top:8px; cursor: pointer;"></i>
				      			</div>
			      			</li>
		      			</ul>
						<div class="nav-btn">
							<%
									if(user_id != null) {
										if("1".equals(user_id)) {%>
											<button class="btn btn-danger" type="button" onclick="location.href='adminpage.jsp'">관리자페이지</button>
										<%}
										%>
										<a href="mypage.jsp">	
											<img src="../image/<%=user_dto.getProfile_image()%>" width="40" height="40">
										</a>
										&nbsp;
										<i class='fas fa-angle-down' data-bs-toggle="dropdown"></i>
										<ul class="dropdown-menu dropdown-menu-end" style="position:absolute; right: 67px; top:72px;">
										   	<li style="width:200px; padding-right: 30px;">
										   		<a href="mypage.jsp" style="font-size: 15px;">
										   			<div class="mytotal">
											   			<div class="mytotal-left">
													   		<img src="../image/<%=user_dto.getProfile_image()%>" width="40" height="40">
											   			</div>
											   			<div class="mytotal-right">
											   				<div style="font-size: 13px; font">
											   					<%=user_dto.getNickname()%>
											  				</div>
											  				<div style="font-size: 13px; color:rgb(255, 86, 0)">
											  					마이페이지 >
											  				</div>
											   			</div>
										   			</div>
										   		</a>
										   	</li>
										   		<hr style="width:80%; margin-left: 20px;">
											<li><a href="user_update.jsp" style="font-size: 13px; margin-left: 20px;">회원정보수정</a></li>
										    <li style="margin-bottom: 15px;"><a href="logout_action.jsp" style="font-size: 13px; margin-left: 20px;">로그아웃</a></li>
										</ul>
									<%
								} else {
									%>
									<a href="sign_in.jsp" style="font-size: 20px; color: black; text-decoration: none; font-weight: bolder;">로그인</a>
									<%
								}
							%>	
						</div>
	    			</div>
	  			</div>
			</nav>
		</div>
		<div class="total">
			<div class="left">
				<div style="">
					<div style="float: left; display: inline-block; margin-right: 10px;">
						<img src="../image/original.jpeg" width="70px;" height="70px;" style="border-radius: 50px;">
					</div>
					<b style="font-size: 40px; font-weight: bolder;"><%=user_dto.getNickname() %></b>
				</div>
				<div style="margin-top: 10px;">
					<b style="font-size: 15px; color:gray;">
						<%=user_dto.getEmail() %>
					</b>
				</div>
				<br><br>
				<div style="border-bottom: 1px solid gray; margin-bottom: 20px; width:110px; padding-bottom: 5px;">
					<a id="admin-user" style="font-size: 20px; cursor: pointer;">
						클래스 목록
					</a>
				</div>
				<div style="border-bottom: 1px solid gray; margin-bottom: 20px; width:110px; padding-bottom: 5px;">
					<a id="admin-class" style="font-size: 20px; cursor: pointer;">
						유저 목록
					</a>
				</div>
			</div>
			<div class="right">			
				<div>
					<form action="add_class_action.jsp" method="post" enctype="multipart/form-data">
						<table class="table table-bordered">
							<caption align="top">
								<h4>
									<i class='fas fa-pencil-alt'></i>
									<b>&nbsp;클래스 생성</b>
								</h4>
							</caption>
							<tr>
								<th width="100" class="table-secondary" valign="middle" style="text-align: center;">
									클래스명
								</th>
								<td>
									<input type="text" name="title" class="form-control form-control-sm" required="required">
								</td>
							</tr>
							<tr>
								<th width="100" class="table-secondary" valign="middle" style="text-align: center;">
									멘토명
								</th>
								<td>
									<input type="text" name="mentor" class="form-control form-control-sm" required="required" autofocus="autofocus" style="width:150px">
								</td>
							</tr>
							<tr>
								<th width="100" class="table-secondary" valign="middle" style="text-align: center;">
									카테고리
								</th>
								<td>
									<select name="category_id" class="form-select" style="width:150px">
										<option value="1">개발</option>
										<option value="2">타로</option>
										<option value="3">유튜브</option>
										<option value="4">축구</option>
										<option value="5">독서</option>
										<option value="6">커피</option>
										<option value="7">베이커리</option>
										<option value="8">영어</option>
										<option value="9">미술</option>
										<option value="10">게임</option>
										<option value="11">일식</option>
									</select>
								</td>
							</tr>
							<tr>
								<th width="100" class="table-secondary" valign="middle" style="text-align: center;">
									썸네일<br>
									이미지
								</th>
								<td>
									<input type="file" name="thumbnail_image" required="required" onchange="readURL(this);" style="font-size: 15px;">
									<!-- 미리보기 이미지 -->
									<img id="blah" src="../image/default_profile.webp" alt="your image" style="position: relative; left: 250px; top: 0px; width:100px; height:100px;"/>
								</td>
							</tr>
							<tr>
								<th width="100" class="table-secondary" valign="middle" style="text-align: center;">
									메인<br>
									이미지
								</th>
								<td>
									<input type="file" name="main_image" required="required" onchange="readURL(this);" style="font-size: 15px;">
								</td>
							</tr>
							<tr>
								<th width="100" class="table-secondary" valign="middle" style="text-align: center;">
									가격
								</th>
								<td>
									<input type="text" name="price" class="form-control form-control-sm" required="required" autofocus="autofocus" style="width:150px">
								</td>
							</tr>
							<tr>
								<th width="100" class="table-secondary" valign="middle" style="text-align: center;">
									옵션
								</th>
								<td>
									<input type="checkbox" name="option" value="콘텐츠 이용권">
										<b style="font-size: 15px; font-weight: normal;">콘텐츠 이용권</b>
									<input type="checkbox" name="option" value="준비물 키트">
										<b style="font-size: 15px; font-weight: normal;">준비물 키트</b>
									<input type="checkbox" name="option" value="초급자 대상">
										<b style="font-size: 15px; font-weight: normal;">초급자 대상</b>
									<input type="checkbox" name="option" value="강의 만족도 100%">
										<b style="font-size: 15px; font-weight: normal;">강의 만족도 100%</b>
									<input type="checkbox" name="option" value="입문자 대상">
										<b style="font-size: 15px; font-weight: normal;">입문자 대상</b>
									<input type="checkbox" name="option" value="증정품 제공">
										<b style="font-size: 15px; font-weight: normal;">증정품 제공</b>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<textarea id="content" name="content" required="required" style="width:100%; height: 300px; display: none;"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button type="button" class="btn btn-secondary" style="width:120px;" onclick="submitContents(this)">클래스 등록</button>
									<button type="button" class="btn btn-secondary" style="width:120px;" onclick="location.href='adminpage.jsp'">목록으로</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
	<script type="text/javascript">
	var oEditors = [];
	
	nhn.husky.EZCreator.createInIFrame({
	
	    oAppRef: oEditors,
	
	    elPlaceHolder: "content",
	
	    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
	
	    fCreator: "createSEditor2"
	
	}); 
	
	//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	
	function submitContents(elClickedObj) {
	
	    // 에디터의 내용이 textarea에 적용된다.
	
	    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	
	 
	
	    // 에디터의 내용에 대한 값 검증은 이곳에서
	
	    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
	    try {
	        elClickedObj.form.submit();
	    } catch(e) { 
	
	    }
	
	}
	
	// textArea에 이미지 첨부
	
	function pasteHTML(filepath){
	    var sHTML = '<img src="../save/'+filepath+'" style="max-width:490px;">';
	    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 
	
	}
	</script>
</body>
</html>
