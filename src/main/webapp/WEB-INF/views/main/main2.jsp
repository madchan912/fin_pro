<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-sale=1.0, user-scalable=no">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="./resources/js/index.js"></script>

<title></title>
</head>


<body>
<header><%--상단 --%>
	<div class="wrap">
		<div class="intro_bg" >
		
			<div class="header" id="link_header">
			
				<div class="searchArea">
					<form method="get" action="recommand" style="width:800px;">
							<select name="find_field" class="find_field">
								<option value="recipy_title" > 제목</option>
								<option value="recipy_name" > 작성자</option>
							</select> 
							<input type="search" class="search_input" name="find_name" value="${find_name}" placeholder="Search"> 
							<input type="submit" class="search_sm" value="검색">
						</form>
				</div>
				
				<ul class="nav">
					<li><a href="main2">HOME</a></li>
					<li><a href="recommand">RECOMMAND</a></li>
					<li><a href="#link_main_text2">CONTACT</a></li>
				</ul>
				
				<c:if test="${empty sessionScope.id}">
					<div class="login"><a href="Login">로그인</a></div>
					</c:if>
					
					<c:if test="${!empty sessionScope.id}">
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
	<div class="wrap">
		<ul class="amount">
			<li>
				<div>
					<div class="contents1">회원수</div>
					<div class="result">${memberCount}</div>
				</div>
			</li>
			<li>
				<div>
					<div class="contents1">총 방문자수</div>
					<div class="result"><%=session.getAttribute("totalCount") %></div>
				</div>
			</li>
			<li>
				<div>
					<div class="contents1">신규등록수</div>
					<div class="result">77</div>
				</div>
			</li>
			<li>
				<div>
					<div class="contents1">총 레시피 수</div>
					<div class="result">${recipyCount}</div>
				</div>
			</li>
		</ul>
		<!-- amount end-->

		<!--main_text0시작 -->
		<div class="main_text0" id="link_main_text0">
			<h1>금주의 레시피</h1>
			

			<ul class="icons" >
				<li>
					<div  class="icon_img">
						<img src="./resources/image/icon2.svg">
					</div>
					<div class="contents1_bold">아무개1</div>
					<div class="contents2">so predictable you're an animal i
						can't let you go</div>
					<div class="more">MORE</div>
				</li>
				<li>
					<div class="icon_img">
						<img src="./resources/image/icon1.svg">
					</div>
					<div class="contents1_bold">아무개2</div>
					<div class="contents2">you're so good at being bad, you know
					</div>
					<div class="more">MORE</div>
				</li>
				<li>
					<div class="icon_img">
						<img src="./resources/image/icon0.svg">
					</div>
					<div class="contents1_bold">아무개3</div>
					<div class="contents2">My baby;s bad, you know you know i'm
						not gonna leave your side</div>
					<div class="more">MORE</div>
				</li>

			</ul>
		</div>
		<!--main_text0 end -->

		<!--main_text1 시작 -->
		<div class="main_text1" id="link_main_text1" >
			<h1>SERVICE</h1>
			<div class="contents1">엄격한 유통과정으로 미식가들에게</div>
			<div class="service">
				<div class="food_photo">
					<img src="./resources/image/food.png">
				</div>
				<div class="contents2">
					<h2>이것이 오징어야, 문어야?</h2>
					이것이 오징어인지 문어인지 헷갈리시는 분들도 있을거에요. <br> 왜냐면 이것은 그냥 Pixabay에서
					오징어라고 검색했더니 나온 이미지인데 <br> 오징어 같은 아무것이나 검색이 된것 같아요. <br>
					<br>
				</div>
			</div>
		</div>
		<!--main_text1 end -->

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
				Addr. 경기도 부천시 심곡동 아무개빌딩 14F <br> TEL :
				02 - 000 - 0000<br> COPYRIGHT 2021. 08. 16
			</div>
		</footer>

	</div>
	<!-- wrap end-->


</body>
</html>
