package com.naver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naver.dao.RecipyDAO;

import com.naver.vo.RecipyVO;

@Service
public class RecipyServiceImpl implements RecipyService {

	@Autowired
	private RecipyDAO recipyDao;

	@Override
	public List<RecipyVO> getRList(RecipyVO r) {
		return recipyDao.getRList(r);
	}

	@Override
	public void insertRecipy(RecipyVO r) {
		recipyDao.insertRecipy(r);	
	}

	@Transactional
	@Override
	public RecipyVO getRecipyCont(int recipy_no) {
		// 조회수 증가
		this.recipyDao.updateHit(recipy_no);
		//번호에 해당하는 내용 가져오기
		return this.recipyDao.getRecipyCont(recipy_no);
	}

	@Override
	public RecipyVO getRecipyCont2(int recipy_no) { //조회수 증가 없음
		//수정폼에서 쓰임
		return recipyDao.getRecipyCont(recipy_no);
	}

	@Override
	public List<RecipyVO> myList(RecipyVO r) {
		return recipyDao.myList(r);
	}

	@Override
	public void delRecipy(int recipy_no) {
		recipyDao.delRecipy(recipy_no);		
	}

	@Override
	public int recipyCount() {
		return recipyDao.recipyCount();
	}

}
