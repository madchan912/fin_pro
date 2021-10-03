package com.naver.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.vo.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberVO mailcheck(String mail_id) { // 이메일 중복확인
		return sqlSession.selectOne("m_check", mail_id);
	}

	@Override
	public void insertMember(MemberVO m) { // 회원저장
		sqlSession.insert("m_in", m);
	}

	@Override
	public MemberVO loginCheck(String login_id) { // 로그인 인증
		return sqlSession.selectOne("login_ck", login_id);
	}

	@Override
	public MemberVO nickcheck(String mem_nic) { // 닉네임 중복확인
		return sqlSession.selectOne("n_check", mem_nic);
	}

	@Override
	public MemberVO getMember(String mail_id) { // 메일아이디에 해당하는 회원정보를 수정폼으로 전달
		return sqlSession.selectOne("m_edit", mail_id);
	}

	@Override
	public void editMember(MemberVO m) { // 정보수정완료
		sqlSession.update("m_edit_ok", m);
	}

	@Override
	public void delMem(MemberVO dm) {  //화원탈퇴
		sqlSession.update("m_del", dm);
	}

	@Override
	public MemberVO getMemberId(String recipy_name) { //닉네임 기준으로 회원정보 가져오기
		return sqlSession.selectOne("m_id",recipy_name);
	}

	@Override
	public MemberVO pwdMember(MemberVO m) {
		return sqlSession.selectOne("ped_m",m); //메일과 이름기준으로 회원정보 검색(비번찾기)
	}

	@Override
	public void updatePwd(MemberVO m) { // 임시비밀번호 수정
		sqlSession.update("p_edit",m);
	}

	@Override
	public int memberCount() {
		return sqlSession.selectOne("m_count"); //총 멤버수
	}


	

}
