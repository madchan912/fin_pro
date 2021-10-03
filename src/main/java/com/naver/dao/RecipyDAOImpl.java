package com.naver.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.naver.vo.RecipyVO;

@Repository
public class RecipyDAOImpl implements RecipyDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<RecipyVO> getRList(RecipyVO r) { //레시피 목록 가져오기
		return sqlSession.selectList("r_li",r);
	}

	@Override
	public void insertRecipy(RecipyVO r) { //레시피저장
		sqlSession.insert("r_in",r);	
	}

	
	@Override
	public void updateHit(int recipy_no) { //조회수 증가
		this.sqlSession.update("recipy_hitUp",recipy_no);
		
	}

	@Override
	public RecipyVO getRecipyCont(int recipy_no) { //레시피 상세보기
		return this.sqlSession.selectOne("recipy_co",recipy_no);
	}

	@Override
	public List<RecipyVO> myList(RecipyVO r) { //마이레시피 리스트
		return sqlSession.selectList("my_li",r);
	}

	@Override
	public void delRecipy(int recipy_no) {   //레시피 삭제
		sqlSession.delete("recipy_del",recipy_no);		
	}

	@Override
	public int recipyCount() {
		
		return sqlSession.selectOne("recipy_count");
	}

	
	
}
