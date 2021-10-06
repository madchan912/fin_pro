<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./resources/js/jquery.js"></script>
<script>
 function login_check(){
    if($.trim($("#login_id").val())==""){
       alert("로그인 아이디를 입력하세요!");
       $("#login_id").val("").focus();
       return false;
    }
    if($.trim($("#login_pwd").val())==""){
       alert("로그인 비번을 입력하세요!");
       $("#login_pwd").val("").focus();
       return false;
    }
 }//로그인 인증 유효성 검증
 

</script>


<title>Login</title>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/member.js"></script>

<link href="./resources/image/favicon.png" rel="shortcut icon" type="image/x-icon">
<link href="./resources/css/Login.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,600,600i,700,700i&amp;subset=latin-ext"	rel="stylesheet">
<script src="./resources/js/member.js"></script>

</head>
<body>

	<div class="wrapper" style="padding-top: 0">
		<div class="onboarding">
			<div class="onboarding-left">
				<div class="onboarding-left-wrapper">

					<!-- 로고 -->
					<a href="main2"><img src="./resources/image/logo0.png" alt="로고이미지"
						style="width: 60%; height: 100%; display: inline-block;"> </a>

					<!-- 로그인버튼 -->
					<form method="POST" action="member_login_ok" class="onboarding-form" onsubmit="return login_check();">
						<h2 class="onboarding-headline">로그인</h2>
						<p class="onboarding-form-description">환영합니다!</p>

						<label for="email" class="input-wrapper -default -grey ">
							<input type="email" id="login_id" class="input" name="login_id" placeholder="Your Email" value=""> 
							<span class="input-notice">이메일 주소를 입력해주세요.</span>
						</label> 
						
						<label for="password" class="input-wrapper -password -default -grey"> 
						<input type="password" id="login_pwd" name="login_pwd" class="input" placeholder="Password"> 
						<span class="input-notice">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
						</label>

						<div class="onboarding-form-controls">
							<button type="submit" class="btn -aboveMediumLarge -red">로그인</button>
							<div class="onboarding-form-controls-variants">
								<a href="Join" class="onboarding-form-controls-link">회원가입</a>
								<br> <a href="pwd_find" class="onboarding-form-controls-link -forgot">비밀번호 찾기</a>
							</div>
						</div>
					</form>
					
					<div class="onboarding-copyrights">© 2021 Daily Cook</div>
				</div>
			</div>

			<!-- 오른쪽 이미지 -->
			<div class="onboarding-right">
				<div class="onboarding-right-wrapper">
					<img src="./resources/image/pasta-6468297.jpg" width="100%" height="100%"
						alt="" class="onboarding-main-image">
					<p class="onboarding-main-description">Good food ends with good	talk. (Joffrey Neyer)
					<hr />	좋은 음식은 좋은 대화로 끝이 난다. (조프리 네이어)
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
