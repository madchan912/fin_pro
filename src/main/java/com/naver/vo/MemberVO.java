package com.naver.vo;







import lombok.Data;

@Data
public class MemberVO { //회원관리 빈 클래스
	
	private String mail_id; //메일 아이디
	private String mem_nic; //회원 닉네임
	private String mem_pwd; //회원비번(암호화시켜야함)
	private String mem_name; //회원이름
	private String mem_phone; //폰번호
	private String mem_date; //가입날짜
	private int mem_state; //가입회원이면 1, 탈퇴회원은 2
	private String mem_delcont; //탈퇴사유
	private String mem_deldate ; //탈퇴 날짜
	//관리자 회원목록 페이징 관련 변수
	private int startrow; //시작행 번호
	private int endrow; //끝행 번호
	
	//관리자 회원목록 검색필드와 검색어 관련변수
	private String find_name; //검색어
	private String find_field; //검색필드
}
