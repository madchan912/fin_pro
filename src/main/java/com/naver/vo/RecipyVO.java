package com.naver.vo;

import lombok.Data;

@Data
public class RecipyVO {
	
	
	private int recipy_no;// --레시피 번호
	private String recipy_name;// --작성자
	private String mail_id;//메일 아이디
	private String recipy_title;// --제목
	private String recipy_file;// --레시피사진 제목
	private String recipy_cont; //레시피 순서
	private String recipy_material; //--재료
	private String recipy_material_v;//--재료량
	private int recipy_hit;// --조회수
	private int recipy_ref;// --원본글과 답변글을 묶어주는 글 그룹번호
	private int recipy_step;// --원본글이면 0, 첫번째 답변글이면1, 두번째 답변글이면2...=>원본글과 답변글을 구분하는 값이면서 몇번째 답변글인가를 알려준다.
	private int recipy_level;// --답변글 정렬순서
	private String recipy_date;// 등록날짜
	private String recipy_editdate;//--수정날짜
	// 페이징 쪽나누기
	private int startrow;// 시작행 번호
	private int endrow;// 끝 행번호

	// 검색기능과 관련
	private String find_field;// 검색필드
	private String find_name;// 검색어
}
