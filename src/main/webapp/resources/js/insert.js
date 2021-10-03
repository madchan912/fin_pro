/**
 * insert.js
 */
 
  var a = 2;

 //재료추가 누르면 폼 추가
 function material_add(){

var newtext="";	
	
newtext+='<ul id="material_area" style="margin-left: 233px;">';
newtext+='  <li id="material_1" >';
newtext+='    <input type="text" name="material" id="cook_material_1" style="width: 300px;" placeholder="ex) 돼지고기"> ';
newtext+='    <input type="text" name="material_v" id="cook_material_1_vol" style="width: 200px;" placeholder="ex) 200g"> ';
newtext+='    <a id="delBtn" class="delBtn" href="" style="display: none;"></a>';
newtext+='  </li>';
newtext+='</ul>';

$("#material_Up").append(newtext);	
 
}
 
 
 

function seqUp_add(){ //(name 값을 증가시키지 않고 배열로 받기)
	

$newtext="";

$newtext+='<div id="order_area" >';
$newtext+=	'<div id="order_step">';
$newtext+=	  '<div id="step1_tit">';
$newtext+=		 '<p id="step1">Step'+a+'</p></div>';
$newtext+=	  '<div id="step1_text" style="display: inline-block;">';
$newtext+=		 '<textarea class="oder_1" id="oder_1" name="oder_1" placeholder="예) 사용할 야채를 먼저 손질해 주세요."></textarea></div>';
$newtext+=	  '<div id="btn_add2">';
$newtext+=		 '<button type="button" onclick="seqUp_add();" id="btn_add_2">순서 추가</button>';
$newtext+='</div></div></div>';				

a++;

$("#recipe_orderUp").append($newtext);


}

//유효성 검증
function write_check(){
 
    
    if($.trim($('#cok_title').val()) == ''){
      alert('레시피제목을 입력하세요!');
      $('#cok_title').val('').focus();
      return false;
    } 
   
    if($.trim($('#recipy_file').val()) == ''){
      alert('음식사진을 첨부해주세요!');
      
      return false;
    }
  }