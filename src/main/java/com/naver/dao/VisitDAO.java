package com.naver.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("VisitDAO")
public class VisitDAO {
	private static VisitDAO instance;
	
	private VisitDAO() {}
	public static VisitDAO getInstance() {
		if(instance == null) instance = new VisitDAO();
		return instance;
	}
	
	@Autowired
	SqlSession sqlSession;
	
	public void setTotalCount() {
		this.sqlSession.insert("v_in");
	}
	
	public int getTotalCount() {
		int totalCount = sqlSession.selectOne("v_sel");
		return totalCount;
	}
	
}