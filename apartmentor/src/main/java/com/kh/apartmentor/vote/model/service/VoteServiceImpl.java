package com.kh.apartmentor.vote.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.apartmentor.common.model.vo.PageInfo;
import com.kh.apartmentor.notice.model.vo.Notice;
import com.kh.apartmentor.vote.model.dao.VoteDao;
import com.kh.apartmentor.vote.model.vo.Vote;
import com.kh.apartmentor.vote.model.vo.VoteItem;

@Service
public class VoteServiceImpl implements VoteService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private VoteDao voteDao;

	@Override
	public int insertVote(Vote v, List<VoteItem> voteItemList) {
		
		int result1 = voteDao.insertVote(v, sqlSession);
		
		int result2 = voteDao.insertVoteItem(voteItemList, sqlSession);
		
		return result1 * result2;
	}

	@Override
	public int setVoteStatus() {
		return voteDao.setVoteStatus(sqlSession);
	}

	@Override
	public int selectListCount() {
		
		return voteDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Vote> selectVoteList(PageInfo pi) {
		return voteDao.selectVoteList(sqlSession, pi);
	}

	@Override
	public int selectCategoryListCount(String category) {
		return voteDao.selectCategoryListCount(sqlSession, category);
	}

	@Override
	public ArrayList<Vote> selectCategoryList(String category, PageInfo pi) {
		return voteDao.selectCategoryList(sqlSession, category, pi);
	}

	@Override
	public int searchListCount(String keyword) {
		return voteDao.searchListCount(sqlSession, keyword);
	}

	@Override
	public ArrayList<Vote> searchList(String keyword, PageInfo pi) {
		return voteDao.selectSearchList(sqlSession, keyword, pi);
	}

	@Override
	public Vote selectVote(int vno) {
		return voteDao.selectVote(sqlSession, vno);
	}

	@Override
	public ArrayList<VoteItem> selectVoteItem(int vno) {
		return voteDao.selectVoteItem(sqlSession, vno);
	}

	@Override
	public int submitVote(VoteItem vi) {
		return voteDao.submitVote(sqlSession, vi);
	}




}
