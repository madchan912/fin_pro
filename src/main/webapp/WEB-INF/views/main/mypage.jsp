<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./resources/css/mypage.css">

<link href="https://fonts.googleapis.com/icon?family=xMaterial+Icons"
	rel="stylesheet">
<link href="./resources/image/favicon.png" rel="shortcut icon"
	type="image/x-icon">
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/ex.css" />

<title>마이페이지</title>
</head>

<body>
	<header>
		<%--상단 --%>
		<div class="wrap">
			<div class="intro_bg">

				<div class="header" id="link_header">

					<div class="searchArea">
						<form method="get" action="recommand" style="width: 800px;">
							<select name="find_field" class="find_field">
								<option value="recipy_title">제목</option>
								<option value="recipy_name">작성자</option>
							</select> <input type="search" class="search_input" name="find_name"
								value="${find_name}" placeholder="Search"> <input
								type="submit" class="search_sm" value="검색">
						</form>
					</div>

					<ul class="nav">
						<li><a href="main2">HOME</a></li>
						<li><a href="recommand">RECOMMAND</a></li>
						<li><a href="#link_main_text2">CONTACT</a></li>
					</ul>

					<c:if test="${empty sessionScope}">
					<div class="login"><a href="Login">로그인</a></div>
					</c:if>
					
					<c:if test="${!empty sessionScope}">
					<div class="my_page">
						<a href="mypage?recipy_name=${m.mem_nic}">마이페이지</a>
					</div>
					<div class="login">
						<a href="member_logout">로그아웃</a>
					</div>
					</c:if>


				</div>
			</div>
		</div>
	</header>


	<div id="nav_menu">
		<ul>
			<li>레시피</li>
			
			<c:if test="${sessionScope.id == mnic.mail_id}"> 
			  <li><a href="member_edit">정보수정</a></li>
			  <li><a href="member_del">회원탈퇴</a></li>
			</c:if>
			
		</ul>
	</div>



	<div class="cont_list">
		<div class="result_none">
			<div class="my_recipy">
				
				<c:if test="${!empty mylist}">
					<c:forEach var="my" items="${mylist}">
						<div id="up-on-scroll" class="recipy_box">
							<div class="recipy">
								<%--음식사진 --%>
								<a href="recipy_cont?recipy_no=${my.recipy_no}&state=cont"><img
									class="recipy_img" src="./resources/upload${my.recipy_file}"></a>
								
								<c:if test="${sessionScope.id == mnic.mail_id}"> 
								   <input type="button" value="삭제" onclick="location='recipy_del?recipy_no=${my.recipy_no}';" style="margin: 10px 10px 0 0;">
								</c:if>
								
								<div class="recipy_info">
									<%--정보들 묶는 박스 --%>
									<div class="recipy_name">
										<h3 class="recipy_name_h3">
											<a href="recipy_cont?recipy_no=${my.recipy_no}">${my.recipy_title}</a>
											<%--레시피 제목 --%>
										</h3>		
										
									</div>
									<%--하이퍼링크 음식사진과 음식이름은 동일하게 --%>

									<%--사용자 id --%>
									<div class="admin">
										<p>${my.recipy_name}</p>
									</div>

									<%--조회수 --%>
									<span class="number_view">조회수 : ${my.recipy_hit}</span>
								</div>
								<%--정보들 묶는 박스 end --%>
							</div>
						</div>
					</c:forEach>
				</c:if>

				<c:if test="${empty mylist}">
					<tr>
						<th colspan="5">레시피 목록이 없습니다!</th>
					</tr>
				</c:if>

			</div>
			<div class="recipy_in_box">
				<h2 class="recipy_in_btn">맛있는 레시피를 등록해주세요!</h2>
				<br>

				<button type="button" onclick="location='insert'" class="recipe_btn">레시피
					등록</button>
			</div>
		</div>
	</div>


	<!--main_text2 시작 -->
	<div class="main_text2" id="link_main_text2">
		<ul>
			<li>
				<div>
					<h1>CONTACT</h1>
				</div>
				<div>파트너쉽을 신청하거나, 고객이 되어주세요</div>
				<div class="more2">더 알아보기</div>
			</li>
			<li></li>
		</ul>
	</div>

	<footer>
		<div>LOGO</div>
		<div>
			Addr. 경기도 부천시 심곡동 아무개빌딩 14F <br> TEL : 02 - 000 - 0000<br>
			COPYRIGHT 2021. 08. 16
		</div>
	</footer>


	<!-- wrap end-->


</body>
</html>
