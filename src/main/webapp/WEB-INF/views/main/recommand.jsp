<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="./header.jsp" />

<link rel="stylesheet" type="text/css" href="./resources/css/ex.css" />
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="./resources/js/index.js"></script>







<%--본문 --%>


<article class="container">
	<div class="main_con_box">
		<div class="main_con_inbox">

			<div class="recommend_title">
				<p>추천</p>
				<h2>
					제일 많이 찾은 <span>레시피</span>
				</h2>
			</div>
			
				<c:if test="${!empty rlist}">
					<c:forEach var="r" items="${rlist}" varStatus="status">
						<%--////////////////추천 레시피 목록////////////////////// --%>
						
							
								<div id="up-on-scroll" class="recipy_box">
									<div class="recipy">
										<%--음식사진 --%>
										<a href="recipy_cont?recipy_no=${r.recipy_no}&state=cont"><img class="recipy_img"
											src="./resources/upload${r.recipy_file}"></a>

										<div class="recipy_info">
											<%--정보들 묶는 박스 --%>

											<div class="recipy_name">
												<h3 class="recipy_name_h3">
													<a href="recipy_cont?recipy_no=${r.recipy_no}">${r.recipy_title}</a>
													<%--레시피 제목 --%>
												</h3>
											</div>
											<%--하이퍼링크 음식사진과 음식이름은 동일하게 --%>

											<%--사용자 id --%>
											<div class="admin">
												<a href="mypage?recipy_name=${r.recipy_name}"><span class="admin_img"><img
														src="./resources/image/avatar.png"></span>
													<p>${r.recipy_name}</p></a>
											</div>

											<%--조회수 --%>
											<span class="number_view">조회수 : ${r.recipy_hit}</span>
										</div>
										<%--정보들 묶는 박스 end --%>
									</div>

								</div>
						
					</c:forEach>
				</c:if>
			
		</div>
	</div>

	

	<%--목록 없을때 --%>
	<c:if test="${empty rlist}">

		<div style="text-align: center;">레시피 목록이 없습니다!</div>

	</c:if>
	
 	

</article>



<%--하단 --%>
<jsp:include page="./footer.jsp" />