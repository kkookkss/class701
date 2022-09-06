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
      /*   background-color: skyblue; */
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
	div.top-button{
		position: sticky;
        top: 73px;
        background-color: white;
        height: 60px;
      /*   background-color: skyblue; */

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
	
</style>
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
											<img src="../image/<%=user_dto.getProfile_image()%>" style="border-radius: 50px; width:50px; height: 50px;">
										</a>
										&nbsp;
										<i class='fas fa-angle-down' data-bs-toggle="dropdown"></i>
										<ul class="dropdown-menu dropdown-menu-end" style="position:absolute; right: 67px; top:72px;">
										   	<li style="width:200px; padding-right: 30px;">
										   		<a href="mypage.jsp" style="font-size: 15px;">
										   			<div class="mytotal">
											   			<div class="mytotal-left">
													   		<img src="../image/<%=user_dto.getProfile_image()%>" style="border-radius: 50px; width:50px; height: 50px;">
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
				<div>
					<div style="float: left; display: inline-block; margin-right: 10px;">
						<img src="../image/original.jpeg" width="70px;" height="70px;" style="border-radius: 50px;">
					</div>
					<b style="font-size: 40px; font-weight: bolder;"><%=user_dto.getNickname() %></b>
				</div>
				<div style="margin-top: 20px;">
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
					<div class="top-button">
						<span style="float: right">
							<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='add_class.jsp'">
								클래스 생성
							</button>
							&nbsp;
							<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='update_calss.jsp'">
								수정
							</button>
							&nbsp;
							<button type="button" class="btn btn-danger btn-sm" id="btndel">
								삭제
							</button>
						</span>
					</div>
					<table class="table table-bordered">
						<caption align="top">
							<h6>
								<b>총 <%=totalCount%>개의 클래스가 등록되어 있습니다.</b>
							</h6>
						</caption>
						<tr>
							<th width="20" style="text-align: center;">
								<input type="checkbox" class="alldelcheck">
							</th>
							<th width="30" style="text-align: center;">NO</th>
							<th width="150" style="text-align: center;">클래스명</th>
							<th width="100" style="text-align: center;">멘토명</th>
							<th width="100" style="text-align: center;">등록일</th>
						</tr>
						<%
							if(totalCount==0) {%>
								<tr>
									<td colspan="5">등록된 글이 없습니다.</td>
								</tr>
							
							<%} else {
								int i=0;
								for(ClassDto dto:list) {
									i++;%>
									<tr valign="middle">
										<td align="center">
											<input type="checkbox" class="alldel" value="<%=dto.getClass_id()%>">
										</td>
										<td align="center"><%=i %></td>
										<td>
											<!--
											상세페이지 넘어갈 때 상품의 num뿐만 아니라 페이지번호도 넘겨야
											상세페이지에서 리스트페이지로 이동할 때 보던 페이지로 이동할 수 있음
											-->
											<a href="detail.jsp?class_id=<%=dto.getClass_id()%>">
												<span style="text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: block;max-width: 250px;">
													<img src="../save/<%=dto.getThumbnail_image() %>" width="50" height="50" style="border-radius: 10px;">
													<%=dto.getTitle() %>	
												</span>
											</a>
										</td>
										<td align="center"><%=dto.getMentor() %></td>
										<td align="center"><%=sdf.format(dto.getReleasedate()) %></td>
									</tr>
									<%}%>	
							<%}%>		
					</table>
				</div>
				<div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    	// 전체 체크 클릭시 체크값 얻어서 모든 체크값 전달하기
        $(".alldelcheck").click(function() {
        	// 전체 체크값 얻기
        	var chk = $(this).is(":checked");
        	console.log(chk);
        	
        	// 전체 체크값을 글 앞의 체크게 일괄 전달하기
			$(".alldel").prop("checked", chk);
        	
        });
    	
        // 삭제 번튼 클릭시 삭제
        $("#btndel").click(function() {
        		
        	// 체크된 길이 구하기
        	var len=$(".alldel:checked").length;
        		
        	// 체크를 안했을 경우 '최소 1개 이상의 글을 선택해주세요'라고 alert
        	if(len==0) {
        		alert("최소 1개 이상의 클래스를 선택해주세요");
        	} else {
        		var a = confirm(len+"개의 클래스를 삭제하려면 [확인]을 눌러주세요");
        		
        		if(a) {
        		// 체크된곳의 value값(num) 얻기
        		var n = "";
        		$(".alldel:checked").each(function(idx) {
        			n += $(this).val()+",";
        		});
        		// 마지막에 컴마 제거하기
        		n = n.substring(0, n.length-1);
        		console.log(n);
        		
        		// 삭제 파일로 get방식 전송
        		location.href = "alldelete.jsp?class_id_list="+n;        			
        		}
        	}
        });
	</script>
</body>
</html>
