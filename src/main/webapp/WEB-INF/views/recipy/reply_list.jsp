<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<body>
	<div class="reply_title">
		댓글 <span class="commendListCount">${totalCount}</span>
		<%--댓글 갯수 --%>
		<div class="clear"></div>
	</div>
	<c:if test="${empty rplist}">
	<div>
	 댓글이 없습니다
	</div>
	</c:if>
	
	<c:if test="${!empty rplist}">
		<c:forEach var="rp" items="${rplist}" >
			<div class="media_reply_list">
				<%--댓글 시작 --%>

				<div class="media_left">
					<%--<img class="media_object" src="../image/avatar.png">후기남긴 사람 프로필 --%>
				</div>

				<div class="media_body">
					<%--후기 내용 (프로필,등록날짜,별점) --%>
					<div class="media_heading">
						<b class="media_name">${rp.replyer} <%--닉네임 --%></b>
						<%--등록 날짜 --%>${rp.regdate}
						
					</div>
					
					<p class="reply_list_cont" >${rp.replytext}
					<input type="hidden" id="rno" value="${rp.rno}">
					
					<c:if test="${sessionScope.id == rp.mail_id}">
					
					<input type="button" id="reply_edit" class="rp_btn" value="수정" data-rno="${rp.rno}" data-text="${rp.replytext}">
					<input type="button" id="reply_del"  value="삭제" data-rno="${rp.rno}">
			        </c:if> </p>
			 	</div>
				
			 
			</div>
			<div class="clear"></div>
		</c:forEach>
	</c:if>
	
<script>
	//수정
	$(document).on("click","#reply_edit",function(){
		
			var rno = $(this).attr("data-rno");
			var replytext = $(this).attr("data-text");
			
			
			var $newtext ='<div style="display: inline-block;"><input type="text" class="reply_text" name="replytext" id="replytext_up" value="'+replytext+'"></div>';
				$newtext +='<input type="hidden" id="rno_up" value="'+rno+'">';
				$newtext +='<span style="margin-left: 455px;"><button id="rp_up" class="reply_btn2" onclick="reply_edit();">저장</button>';
			    $newtext +='<button class="reply_btn2" onclick="listReply();">취소</button></span>';
			
			$(this).parent(".reply_list_cont").replaceWith($newtext);//부모 p를 newtext로 변경
			
	
	  	 
	});
	
	function reply_edit() {
		var replytext = $("#replytext_up").val(); //댓글의 내용
		var rno = $("#rno_up").val(); //댓글 번호
		var params = {
			"replytext" : replytext,
			"rno_s" : rno
		};
	
		
		$.ajax({
			type : "post", //데이터를 보낼 방식
			url : "reply/reply_edit", //데이터를 보낼 url
			data : params, //보낼 데이터
			success : function() {//데이터를 보내는 것이 성공했을 시 출력되는 메시지
				alert('댓글이 수정되었습니다.');
				listReply();
			}
		});
	}
	
	//삭제
	$(document).on("click","#reply_del",function(){
		var rno = $(this).attr("data-rno");
		
		$.ajax({
			type : "post", //데이터를 보낼 방식
			url : "reply/reply_del", //데이터를 보낼 url
			data : {"rno_s" : rno},  //보낼 데이터
			success : function() {//데이터를 보내는 것이 성공했을 시 출력되는 메시지
				alert('댓글이 삭제되었습니다.');
				listReply();
			}
		});
	});
	
</script>
</body>
</html>