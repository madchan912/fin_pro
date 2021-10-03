<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="../main/header.jsp" />

<link rel="stylesheet" type="text/css" href="./resources/css/insert.css" />
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/insert.js"></script>


<form method="post" action="insert_ok" onsubmit="return write_check();"
enctype="multipart/form-data">
<div class="recipe_reg1">
	<div class="reg_center">
		<div id="reg_title">레시피 등록</div>
		 
		<div class="main_box"> <%--요리 개요 --%>

			<div id="cont_title">
				<p class="cont_tit1" >레시피 제목</p>
				<input type="text" name="recipy_title" id="cok_title" placeholder="요리의 제목을 적어주세요!">
			</div>
 
		</div>
<div id="cont_intro">
		<div class="material"> <%--요리 재료 --%>
			<div class="material_box">
			
					<p class="cont_tit4" >재료</p>
					<ul id="material_area">
						<li id="material_1" >
							<input type="text" name="material" id="cook_material_1"
								style="width: 300px;" placeholder="ex) 돼지고기"> 
							<input type="text" name="material_v" id="cook_material_1_vol"
								style="width: 200px;" placeholder="ex) 200g"> 
							<a id="delBtn" class="delBtn" href="" style="display: none;"></a>
						</li>

						<li id="material_2" >
							<input type="text" name="material" id="cook_material_2"
								style="width: 300px;" placeholder="ex) 간장"> 
							<input type="text" name="material_v" id="cook_material_2_vol"
								style="width: 200px;" placeholder="ex) 2T">
							<a id="delBtn" class="delBtn" href="" style="display: none;"></a>
						</li>

						<li id="material_3" >
							<input type="text" name="material" id="cook_material_3"
								style="width: 300px;" placeholder="ex) 참깨"> 
							<input type="text" name="material_v" id="cook_material_3_vol"
								style="width: 200px;" placeholder="ex) 1T">
							<a id="delBtn" class="delBtn" href="" style="display: none;"></a>
						</li>
					</ul>
					<div id="material_Up">
				
					</div>
		
			</div>
			<div id="btn_add1">
				<button type="button" onclick="material_add();" id="btn_add_1">추가</button>
			</div>
		</div>
		</div>
		
		
		
		<div class="recipe_order">
			<p class="cont_tit5">요리 순서</p>
			<div id="order_area" >
				<div id="order_step">
				
					<div id="step1_tit">
						<p id="step1">Step1</p>
					</div> 
					
					<div id="step1_text">
						<textarea class="oder_1" id="oder_1" name="oder_1" placeholder="예) 사용할 야채를 먼저 손질해 주세요."></textarea>
					</div>
					
					
					<div id="btn_add2">
						<button type="button" onclick="seqUp_add();" id="btn_add_2" name="btn_add_2" >순서 추가</button>
					</div>
									
				</div>			
			</div>
		</div>
		<div class="clear"></div>
		
     	<!-- 버튼 클릭시 추가 되는 폼 -->
		<div id="recipe_orderUp">
		
		
		</div>
		
 	<%--음식 사진 첨부 --%>
 	<div class="r_file">
	   <p class="cont_tit4" >사진 첨부</p>
	   <div style="text-align: center;"><input type="file" id="recipy_file" name="recipy_file"  /></div>
	</div>	 
	
	</div>
	
	
	<div class="reg_btn">
		<button type="submit" id="btn_sc">저장</button>
		<button type="reset" id="btn_sc">취소</button>
	</div>
	
</div>
</form>

<jsp:include page="../main/footer.jsp" />