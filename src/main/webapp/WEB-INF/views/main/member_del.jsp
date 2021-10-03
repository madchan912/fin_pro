<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>회원탈퇴</title>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/member.js"></script>

<link href="./resources/image/favicon.png" rel="shortcut icon" type="image/x-icon">
<link href="./resources/css/Join.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,600,600i,700,700i&amp;subset=latin-ext" rel="stylesheet">
<script src="./resources/js/member.js"></script>
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script type="text/javascript">
  function del_check(){
	  if($.trim($("#mem_pwd").val())==""){
		  alert('비밀번호를 입력하세요');
		  $('#mem_pwd').val('').focus();
		  return false;
	  }
	  
	  if($.trim($("#del_cont").val())==""){
		  alert('탈퇴 사유를 입력하세요');
		  $('#del_cont').val('').focus();
		  return false;
	  }
  }
 
</script>
</head>

<body>
	<div class="wrapper" style="padding-top: 0">
		<div class="onboarding">
			<div class="onboarding-left">
				<div class="onboarding-left-wrapper">

					<!-- 로고 -->
					<a href="main2"><img src="./resources/image/logo0.png" alt="로고이미지"
						style="width: 100%; height: 100%; display: inline-block;"> </a>

					<form method="POST" action="member_del_ok" class="onboarding-form"  onsubmit="return del_check();">
						<h2 class="onboarding-headline">회원탈퇴</h2>
						<p class="onboarding-form-description"></p>


						<label for="email" class="input-wrapper -default -grey ">
							<input type="email" id="mail_id" class="input" name="mail_id" placeholder="이메일" readonly value="${m.mail_id}">
							<span id="mailcheck"class="input-notice"></span>
						</label> 
						
						<label for="nickname" class="input-wrapper -default -grey ">
							<input type="text" id="mem_nic" class="input" name="mem_nic" placeholder="닉네임" readonly value="${m.mem_nic}">
							<span id="nickcheck"class="input-notice"></span>
						</label> 
						
						
						<label for="password" class="input-wrapper -password -default -grey"> 
						  	<input type="password" id="mem_pwd" name="mem_pwd" class="input" placeholder="비밀번호"> 
						  	<span class="input-notice">비밀번호를 입력해주세요</span>
						</label>
						 
						
						<label for="name" class="input-wrapper -default -grey ">
							<input type="text" id="mem_name" class="input" name="mem_name" placeholder="이름" readonly value="${m.mem_name}">
							<span class="input-notice"></span>
						</label> 

						<label for="del_cont" class="input-wrapper -default -grey ">
							<textarea id="del_cont" class="input" name="del_cont" placeholder="탈퇴사유"  rows="9" cols="36"></textarea>
							<span class="input-notice">탈퇴 사유를 입력해주세요</span>
						</label> 
			
						<div class="onboarding-form-controls">
							<button type="submit" class="btn -aboveMediumLarge -red" >회원탈퇴</button>
							<button type="reset" class="Login" onclick="location.href ='mypage?recipy_name=${m.mem_nic}'">취소</button>
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