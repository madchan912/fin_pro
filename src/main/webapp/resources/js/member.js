$mbutton=0; //이메일 중복검색 유효성검증을 위한 변수 초기화
$nbutton=0; //닉네임 중복검색 유효성검증을 위한 변수 초기화
var passRule= /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; //비번 유효성 검증
var phonRule = /^\d{3}-\d{3,4}-\d{4}$/; //핸드폰 정규식


function join_check(){
   if($.trim($("#mail_id").val())==""){
      alert("이메일을 입력하세요!");
      $("#mail_id").val("").focus();
      return false;
   }
   $mem_pwd=$.trim($("#mem_pwd").val());
   $mem_pwd2=$.trim($("#mem_pwd2").val());
   if($mem_pwd == ""){
      alert("비번을 입력하세요!");
      $("#mem_pwd").val("").focus();
      return false;
   }
   //비번 내용 확인
   if(!passRule.test($("#mem_pwd").val())){
      alert("비밀번호는 특수문자 /문자/숫자 포함 형태의 8~15자리 이내로 입력해주세요!");
      $("#mem_pwd").val("").focus();
      return false;
   }
   if($mem_pwd2 == ""){
      alert("비번확인을 입력하세요!");
      $("#mem_pwd2").val("").focus();
      return false;
   }
   if($mem_pwd != $mem_pwd2){
      alert("비번이 다릅니다!");
      $("#mem_pwd").val("");//비번 입력박스를 초기화
      $("#mem_pwd2").val("");
      $("#mem_pwd").focus();
      return false;
   }
   if($.trim($("#mem_name").val())==""){
      alert("회원이름을 입력하세요!");
      $("#mem_name").val("").focus();
      return false;
   }
   
   if($.trim($("#mem_nic").val())==""){
      alert("닉네임을 입력하세요!");
      $("#mem_nic").val("").focus();
      return false;
   }
   
   if($.trim($("#mem_phone").val())==""){
      alert("폰번호를 입력하세요!");
      $("#mem_phone").val("").focus();
      return false;
   }
   
   //폰 내용 확인
   if(!phonRule.test($("#mem_phone").val())){
      alert("폰번호를 정확하게 입력해 주세요");
      $("#mem_phone").val("").focus();
      return false;
   }
   
 if($mbutton == 0){
 alert("이메일 중복체크를 해주세요!");
 $("#mail_id").val("").focus();
      return false;
 }
 if($nbutton == 0){
 alert("닉네임 중복체크를 해주세요!");
 $("#mem_nic").val("").focus();
      return false;
 }
  
}//join_check()



//수정폼 유효성 검증
function join_check2(){ 
	
    
   
   $mem_pwd=$.trim($("#mem_pwd").val());
   $mem_pwd2=$.trim($("#mem_pwd2").val());
   if($mem_pwd == ""){
      alert("비번을 입력하세요!");
      $("#mem_pwd").val("").focus();
      return false;
   }
   //비번 내용 확인
   if(!passRule.test($("#mem_pwd").val())){
      alert("비밀번호는 특수문자 /문자/숫자 포함 형태의 8~15자리 이내로 입력해주세요!");
      $("#mem_pwd").val("").focus();
      return false;
   }
   
   if($mem_pwd2 == ""){
      alert("비번확인을 입력하세요!");
      $("#mem_pwd2").val("").focus();
      return false;
   }
   if($mem_pwd != $mem_pwd2){
      alert("비번이 다릅니다!");
      $("#mem_pwd").val("");//비번 입력박스를 초기화
      $("#mem_pwd2").val("");
      $("#mem_pwd").focus();
      return false;
   }
   if($.trim($("#mem_name").val())==""){
      alert("회원이름을 입력하세요!");
      $("#mem_name").val("").focus();
      return false;
   }
   
   if($.trim($("#mem_nic").val())==""){
      alert("닉네임을 입력하세요!");
      $("#mem_nic").val("").focus();
      return false;
   }
   
   if($.trim($("#mem_phone").val())==""){
      alert("폰번호를 입력하세요!");
      $("#mem_phone").val("").focus();
      return false;
   }

 //폰 내용 확인
   if(!phonRule.test($("#mem_phone").val())){
      alert("폰번호를 정확하게 입력해 주세요");
      $("#mem_phone").val("").focus();
      return false;
   }
   
 
}


//중복이메일 검색
function mail_check(){
 /* copy begin */
   $("#mailcheck").hide();
   //이메일 영역을 숨김
   $mail_id=$.trim($("#mail_id").val());
   //1.입력글자 길이 체크
   if($mail_id.length < 4){
      $newtext='<font color="red" size="3"><b>메일아이디는 4자 이상이어야 합니다.</b></font>';
      $("#mailcheck").text('');
      //mailcheck 이메일 영역 문자열을 초기화
      $("#mailcheck").show();
      //mailcheck 이메일 영역을 보이게 함.
      $("#mailcheck").append($newtext);
      //mailcheck 영역에 문자열을 추가
      $("#mailcheck").val('').focus();
      
      
      return false;
   };
   
 //2.이메일입력글자 확인
   if(!(validate_userid($mail_id))){
      $newtext='<font color="red" size="3"><b>이메일 형식이어야 합니다 @을 포함해주세요</b></font>';
      $("#mailcheck").text('');
      $("#mailcheck").show();
      $("#mailcheck").append($newtext);
      $("#mail_id").val('').focus();
      return false;
   };
  
   //이메일 중복확인
    $.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 아작스 실행
        type:"POST",//데이터를 서버로 보내는 방법
       //url:"./member/member_mailcheck.jsp",    
        url:"member_mailcheck", //아작스 서버 주소 파일명
        data: {"mail_id":$mail_id},  //좌측 mail_id 피라미터 이름에 우측 $mail_id변수값을 저장
        datatype:"int",//서버의 실행된 결과값을 사용자로 받아오는 방법
        success: function (data) {//success는 아작스로 받아오는것이 성공했을경우
           //서버 데이터를 data변수에 저장
           if(data==1){//중복 이메일이 있다면
            $newtext='<font color="red" size="3"><b>중복 이메일입니다.</b></font>';
            $("#mailcheck").text('');
           $("#mailcheck").show();
           $("#mailcheck").append($newtext);                
             $("#mail_id").val('').focus();
             
             $mbutton=0;
            
             return false;
        
           }else{//중복 이메일이 아니면
            $newtext='<font color="blue" size="3"><b>사용가능한 이메일입니다.</b></font>';
            $("#mailcheck").text('');
            $("#mailcheck").show();
            $("#mailcheck").append($newtext);
            $("#mem_pwd").focus();
          
           $mbutton=1;
           
           }              
        },
         error:function(){//비동기식 아작스로 서버디비 데이터를
            //못가져와서 에러가 발생했을 때 호출되는 함수이다.
            alert("data error");
         }
      });//$.ajax
 /* end */   
}//mail_check()



//닉네임 중복검색
function nick_check(){
 /* copy begin */
   $("#nickcheck").hide();
   //닉네임 영역을 숨김
   $mem_nic=$.trim($("#mem_nic").val());
   //1.입력글자 길이 체크
   if($mem_nic.length < 4){
      $newtext='<font color="red" size="3"><b>아이디는 4자 이상이어야 합니다.</b></font>';
      $("#nickcheck").text('');
      //nickcheck 닉네임 영역 문자열을 초기화
      $("#nickcheck").show();
      //nickcheck 닉네임 영역을 보이게 함.
      $("#nickcheck").append($newtext);
      //nickcheck영역에 문자열을 추가
      $("#mem_nic").val('').focus();
      return false;
   };
   if($mem_nic.length > 12){
      $newtext='<font color="red" size="3"><b>아이디는12자 이하이어야 합니다.</b></font>';
      $("#nickcheck").text('');
      //nickcheck 닉네임 영역 문자열을 초기화
      $("#nickcheck").show();
      //nickcheck 닉네임 영역을 보이게 함.
      $("#nickcheck").append($newtext);
      //nickcheck영역에 문자열을 추가
      $("#mem_nic").val('').focus();
      return false;
   };
   //2.입력글자 확인
   if(!(validate_usernick($mem_nic))){
      $newtext='<font color="red" size="3"><b>아이디는 영문소문자,숫자,_조합만 가능합니다.</b></font>';
      $("#nickcheck").text('');
      $("#nickcheck").show();
      $("#nickcheck").append($newtext);
      $("#mem_nic").val('').focus();
      return false;
   };
   
   //닉네임 중복확인
    $.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 아작스 실행
        type:"POST",//데이터를 서버로 보내는 방법
        url:"member_nickcheck", //매핑주소
        data: {"mem_nic":$mem_nic},  //좌측 mem_nic 피라미터 이름에 우측 $mem_nic변수값을 저장
        //위 파라미터 이름이 컨트롤러에서 값을 받아오는 매개변수이름과 같음
        datatype:"int",//서버의 실행된 결과값을 사용자로 받아오는 방법
        success: function (data) {//success는 아작스로 받아오는것이 성공했을경우
           //서버 데이터를 data변수에 저장
           if(data==1){//중복 닉네임이 있다면
            $newtext='<font color="red" size="3"><b>중복 닉네임입니다.</b></font>';
            $("#nickcheck").text('');
           $("#nickcheck").show();
           $("#nickcheck").append($newtext);                
             $("#mem_nic").val('').focus();
             
             $nbutton=0;
             
             return false;
        
           }else{//중복 닉네임이 아니면
            $newtext='<font color="blue" size="3"><b>사용가능한 닉네임입니다.</b></font>';
            $("#nickcheck").text('');
            $("#nickcheck").show();
            $("#nickcheck").append($newtext);
            $("#mem_pwd").focus();
            
             $nbutton=1;
            
           }              
        },
         error:function(){//비동기식 아작스로 서버디비 데이터를
            //못가져와서 에러가 발생했을 때 호출되는 함수이다.
            alert("data error");
         }
      });//$.ajax
 /* end */   
}//nick_check()

//정규표현식
//닉네임
function validate_usernick($mem_nic)
{
  var pattern= new RegExp(/^([a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣])+$/);
  //닉네임을 한글 영문 숫자만 가능 

  return pattern.test($mem_nic);
};

//이메일
function validate_userid($mail_id)
{
  var patterns= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

 return patterns.test($mail_id);
};



 







