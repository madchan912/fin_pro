<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="../main/header.jsp" />
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="./resources/js/recipy.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/recipy.css" />



<article class="container">
	<div class="food_box">
		<div class="food_inbox">

			<div class="fix">
				<%--프로필 박스 --%>
				<div>
					<div class="food_img">
						<img src="./resources/upload${r.recipy_file}">
					</div>
					<%--음식 이미지 --%>

				</div>
				<a href="mypage?recipy_name=${r.recipy_name}">
				<p class="admin_id">${r.recipy_name}</p></a>
				<%--눌렀을때 사용자 페이지로 --%>
				<h2>${r.recipy_title}</h2>
				<%--음식 제목 --%>





				<div class="ingredients">

					<%--음식 재료 --%>
					<div class="ingredients_box">
						<div class="ingredients_ul_info">
							<ul>
								<p>
									<b>[재료]</b>
								</p>

								<c:forEach var="token2" items="${token2}">
									<li><c:out value="${token2}" /></li>
								</c:forEach>
							</ul>
						</div>

						<div class="ingredients_ul_info">
							<ul>
								<p>
									<b>[재료량]</b>
								</p>
								<c:forEach var="token3" items="${token3}">
									<li><c:out value="${token3}" /></li>
								</c:forEach>
							</ul>
						</div>

					</div>

				</div>
				<%--등록날짜 --%>
				<div class="date">
					<div class="view_notice">
						<p class="view_notice_date">
							<b style="border-right: 1px solid #dedede;">등록일 :  ${fn:substring(r.recipy_date,0,10)}</b>
							<c:if test="${!empty r.recipy_editdate}">
								<b style="border-right: 1px solid #dedede;">수정일:${fn:substring(r.recipy_editdate,0,10)}</b>
							</c:if>
							<b>조회수:</b>${r.recipy_hit}

						</p>
					</div>
				</div>
			</div>



			<div class="cooking_order">
				<%--조리 순서 --%>
				<div>
					<h3>조리순서</h3>
				</div>
				<ol>
					<%--반복되는 부분 --%>
					<c:forEach var="token" items="${token}" varStatus="status">

						<li>
							<div class="step">
								<div class="step_inbox">
									<span>${status.count}</span>
									<P>
										<c:out value="${token}" />
									</P>
								</div>
							</div>
						</li>

					</c:forEach>
					<%--반복되는 끝 --%>



				</ol>

			</div>
		</div>
		<%--댓글 창 --%>
		<div class="reply_box">
			
			<div id="listReply"> <%--리스트 담기는곳 --%>

			</div>

			<script>
				$(function() {
					listReply();
					$("#btn-default").click(function() {
						
						if($.trim($("#replytext").val())==""){ //댓글이 빈칸일때
						      alert("댓글을 입력하세요!");
						      $("#replytext").val("").focus();
						      return false;
						}
						
						reply();
					});
				});

				function reply() {
					var replytext = $("#replytext").val(); //댓글의 내용
					var recipy_no = "${r.recipy_no}";
					var params = {
						"replytext" : replytext,
						"recipy_no" : recipy_no
					};

					$.ajax({
						type : "post", //데이터를 보낼 방식
						url : "reply/reply_ok", //데이터를 보낼 url
						data : params, //보낼 데이터
						success : function() {//데이터를 보내는 것이 성공했을 시 출력되는 메시지
							alert('댓글이 등록되었습니다.');
							$("#replytext").val("");
							listReply();
						}
					});
				}

				function listReply() {
					var recipy_no = "${r.recipy_no}";
					var params = {
						"recipy_no" : recipy_no
					};
					$.ajax({
						type : "post", //데이터를 보낼 방식
						url : "reply/reply_list", //데이터를 보낼 url
						data : params,
						datatype : 'json',
						success : function(result) { // result에는 서버에서 리턴해준 뷰가 들어감
							$("#listReply").html(result);

						}
					});
				}
				
				
				
				
			</script>


			<!-- 댓글 달기 -->
			<div class="reply_write">
				<!--댓글 입력창-->
				<div class="input-group" style="width: 800px;">
					<textarea class="cmt_tx_content1" name="replytext" id="replytext"
						placeholder="무엇이 궁금하신가요? 댓글을 남겨주세요."></textarea>
					<span class="input-group-btn">
						<button id="btn-default" class="btn-default">등록</button>
					</span>
				</div>

			</div>

		</div>


		<%--댓글 end--%>
	</div>
</article>
<jsp:include page="../main/footer.jsp" />