package com.naver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dao.ReplyDAO;
import com.naver.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDAO replyDao;

	@Override
	public void insertReply(ReplyVO rp) {
		replyDao.insertReply(rp);	
	}

	@Override
	public int totalCount(int recipy_no) {
		return replyDao.totalCount(recipy_no);
	}

	@Override
	public List<ReplyVO> getRpList(int recipy_no) {
		return replyDao.getRpList(recipy_no);
	}

	@Override
	public void reply_edit(ReplyVO rp) {
		replyDao.reply_edit(rp);
	}

	@Override
	public void reply_del(int rno) {
		replyDao.reply_del(rno);		
	}

	
}
