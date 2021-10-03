<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-sale=1.0, user-scalable=no">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


<title></title>
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


				<div class="intro_text">
					<ul id="imgholder" class="imgs">

						<li class="img_v_1">
							<div>
								<p>"매일의 요리가 새로워 집니다"</p>
								<p>간식부터 한식까지</p>
								<p>Daily Cook에서 일상에서의 요리사가 되어보세요</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>

	</header>