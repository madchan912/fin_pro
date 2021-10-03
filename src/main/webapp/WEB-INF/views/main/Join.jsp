<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>SignUp</title>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/member.js"></script>

<link href="./resources/image/favicon.png" rel="shortcut icon" type="image/x-icon">
<link href="./resources/css/Join.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,600,600i,700,700i&amp;subset=latin-ext" rel="stylesheet">
<script src="./resources/js/member.js"></script>

</head>

<body>
	<div class="wrapper" style="padding-top: 0">
		<div class="onboarding">
			<div class="onboarding-left">
				<div class="onboarding-left-wrapper">

					<!-- 로고 -->
					<a href="main2"><img src="./resources/image/logo0.png" alt="로고이미지"
						style="width: 100%; height: 100%; display: inline-block;"> </a>

					<form method="POST" action="member_join_ok" class="onboarding-form"  onsubmit="return join_check();">
						<h2 class="onboarding-headline">회원가입</h2>
						<p class="onboarding-form-description">환영합니다!</p>


						<label for="email" class="input-wrapper -default -grey ">
							<input type="email" id="mail_id" class="input" name="mail_id" placeholder="이메일" value="">
							<input type="button" value="중복체크" class="mailcheck" onclick="mail_check();"> <br/> 
							<span id="mailcheck"class="input-notice">이메일 주소를 입력해주세요.</span>
						</label> 
						
						<label for="nickname" class="input-wrapper -default -grey ">
							<input type="text" id="mem_nic" class="input" name="mem_nic" placeholder="닉네임" value="">
							<input type="button" value="중복체크" class="nickcheck" onclick="nick_check();"> <br/> 
							<span id="nickcheck"class="input-notice">사용하실 닉네임을 입력해주세요.</span>
						</label> 
						
						
						<label for="password" class="input-wrapper -password -default -grey"> 
						  	<input type="password" id="mem_pwd" name="mem_pwd" class="input" placeholder="비밀번호"> 
						  	<span class="input-notice">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
						</label>
						 
						<label for="password" class="input-wrapper -password -default -grey"> 
						 	 <input type="password" id="mem_pwd2" name="mem_pwd2" class="input" placeholder="비밀번호 확인"> 
						  	 <span class="input-notice">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
						</label>

						<label for="name" class="input-wrapper -default -grey ">
							<input type="text" id="mem_name" class="input" name="mem_name" placeholder="이름" value="">
							<span class="input-notice">이름을 입력해주세요</span>
						</label> 

						<label for="phone" class="input-wrapper -default -grey ">
							 <input type="text" id="mem_phone" class="input" name="mem_phone" placeholder="전화번호" value=""> 
							 <span class="input-notice">전화번호를  입력하세요. (010-1234-5678)</span>
						</label>

						<div class="onboarding-form-controls">
							<button type="submit" class="btn -aboveMediumLarge -red" >회원가입</button>
							<a href="Login" class="Login">로그인으로 돌아가기</a>
						</div>
					</form>

					
					<div class="onboarding-copyrights">© 2021 Daily Cook</div>
				</div>
			</div>
			
			<!-- 오른쪽 이미지 -->
			<div class="onboarding-right">
				<div class="onboarding-right-wrapper">
					<img src="./resources/image/blueberries-919029.jpg" width="100%" height="100%" alt="" class="onboarding-main-image">
					<p class="onboarding-main-description">Part of the secret of success in life is to eat what you like and let the food fight it out inside. (Mark Twain)
					<hr />인생에서 성공하는 비결 중 하나는 좋아하는 음식을 먹고 힘내 싸우는 것이다. (마크 트웨인)					
				</div>
			</div>
		</div>
	</div>
</body>
</html>