package com.naver.service;

import java.util.List;


import com.naver.vo.RecipyVO;

public interface RecipyService {

	List<RecipyVO> getRList(RecipyVO r);

	void insertRecipy(RecipyVO r);

	RecipyVO getRecipyCont(int recipy_no);

	RecipyVO getRecipyCont2(int recipy_no);

	List<RecipyVO> myList(RecipyVO r);

	void delRecipy(int recipy_no);

	int recipyCount();

}
