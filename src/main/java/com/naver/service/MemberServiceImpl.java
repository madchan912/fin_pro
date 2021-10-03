package com.naver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dao.MemberDAO;
import com.naver.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService {
 
	@Autowired
	MemberDAO memberDao;

	@Override
	public MemberVO mailcheck(String mail_id) {
		return memberDao.mailcheck(mail_id);
	}

	@Override
	public void insertMember(MemberVO m) {
		memberDao.insertMember(m);		
	}

	@Override
	public MemberVO loginCheck(String login_id) {
		return memberDao.loginCheck(login_id);
	}

	@Override
	public MemberVO nickcheck(String mem_nic) {
		return memberDao.nickcheck(mem_nic);
	}

	@Override
	public MemberVO getMember(String mail_id) {
		return memberDao.getMember(mail_id);
	}

	@Override
	public void editMember(MemberVO m) {
		memberDao.editMember(m);
	}

	@Override
	public void delMem(MemberVO dm) {
		memberDao.delMem(dm);	
	}

	@Override
	public MemberVO getMemberId(String recipy_name) {
		return memberDao.getMemberId(recipy_name);
	}

	@Override
	public MemberVO pwdMember(MemberVO m) {
		return memberDao.pwdMember(m);
	}

	@Override
	public void updatePwd(MemberVO m) {
		memberDao.updatePwd(m);	
	}

	@Override
	public int memberCount() {
		return memberDao.memberCount();
	}

	

	

	

}
