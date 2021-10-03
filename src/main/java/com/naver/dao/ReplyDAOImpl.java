package com.naver.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public void insertReply(ReplyVO rp) { //댓글저장
		sqlSession.insert("rp_in",rp);		
	}

	@Override
	public int totalCount(int recipy_no) {
		return sqlSession.selectOne("rp_count",recipy_no); //댓글 총갯수
	}

	@Override
	public List<ReplyVO> getRpList(int recipy_no) {
		return sqlSession.selectList("rp_li", recipy_no); //댓글 목록
	}

	@Override
	public void reply_edit(ReplyVO rp) {    //댓글 수정
		sqlSession.update("rp_edit",rp);	
	}

	@Override
	public void reply_del(int rno) {
		sqlSession.delete("rp_del",rno);	
	}

	


}
