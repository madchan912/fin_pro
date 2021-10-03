package com.naver.service;

import java.util.List;

import com.naver.vo.ReplyVO;

public interface ReplyService {

	void insertReply(ReplyVO rp);

	int totalCount(int recipy_no);

	List<ReplyVO> getRpList(int recipy_no);

	void reply_edit(ReplyVO rp);

	void reply_del(int rno);

}
