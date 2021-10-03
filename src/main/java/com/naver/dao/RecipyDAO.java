package com.naver.dao;

import java.util.List;


import com.naver.vo.RecipyVO;

public interface RecipyDAO {

	List<RecipyVO> getRList(RecipyVO r);

	void insertRecipy(RecipyVO r);

	void updateHit(int recipy_no);

	RecipyVO getRecipyCont(int recipy_no);

	List<RecipyVO> myList(RecipyVO r);

	void delRecipy(int recipy_no);

	int recipyCount();

}
