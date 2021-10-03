package com.naver.vo;

import lombok.Data;

@Data
public class ReplyVO {

	private int rno;//댓글번호
	private int recipy_no;//레시피 번호
	private String replyer;//댓글 작성자
	private String mail_id;//메일 아이디
	private String replytext;//댓글내용
	private String regdate;//등록날짜
	private String updatedate;//수정날짜

}
