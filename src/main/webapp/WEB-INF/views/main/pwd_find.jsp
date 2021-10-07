<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./resources/js/jquery.js"></script>
<script>
 function login_check(){
    if($.trim($("#login_mail").val())==""){
       alert("회원 이메일을 입력하세요!");
       $("#login_id").val("").focus();
       return false;
    }
    if($.trim($("#login_name").val())==""){
       alert("회원이름을 입력하세요");
       $("#login_pwd").val("").focus();
       return false;
    }
 }
</script>


<title>비번검색</title>
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
					<form method="POST" action="pwd_find_ok" class="onboarding-form" onsubmit="return login_check();">
						<h2 class="onboarding-headline">비밀번호를 잊으셨나요?</h2>
						<p class="onboarding-form-description">이메일로 임시 비밀번호를 전송합니다</p>

						<label for="email" class="input-wrapper -default -grey ">
							<input type="email" id="login_mail" class="input" name="login_mail" placeholder="Your Email" value=""> 
							<span class="input-notice">이메일 주소를 입력해주세요.</span>
						</label> 
						
						<label for="name" class="input-wrapper -password -default -grey" > 
						<input id="login_name" name="login_name" class="input" placeholder="Your name"> 
						<span class="input-notice">회원 이름을 입력해주세요.</span>
						</label>

						<div class="onboarding-form-controls">
							<button type="submit" class="btn -aboveMediumLarge -red">이메일 전송</button>
							<div class="onboarding-form-controls-variants">
								
								
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
