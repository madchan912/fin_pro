package com.naver.service;

import java.util.List;

import com.naver.vo.MemberVO;


public interface MemberService {

	MemberVO mailcheck(String mail_id);

	void insertMember(MemberVO m);

	MemberVO loginCheck(String login_id);

	MemberVO nickcheck(String mem_nic);

	MemberVO getMember(String mail_id);

	void editMember(MemberVO m);

	void delMem(MemberVO dm);

	MemberVO getMemberId(String recipy_name);

	MemberVO pwdMember(MemberVO m);

	void updatePwd(MemberVO m);

	int memberCount();

	

	

	

	

}
