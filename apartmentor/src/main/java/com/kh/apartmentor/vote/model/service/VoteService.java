package com.kh.apartmentor.vote.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.apartmentor.common.model.vo.PageInfo;
import com.kh.apartmentor.notice.model.vo.Notice;
import com.kh.apartmentor.vote.model.vo.Vote;
import com.kh.apartmentor.vote.model.vo.VoteItem;

public interface VoteService {

	int insertVote(Vote v, List<VoteItem> voteItemList);
	
	int setVoteStatus();
	
	int selectListCount();

	ArrayList<Vote> selectVoteList(PageInfo pi);

	int selectCategoryListCount(String category);

	ArrayList<Vote> selectCategoryList(String category, PageInfo pi);

	int searchListCount(String keyword);

	ArrayList<Vote> searchList(String keyword, PageInfo pi);

	Vote selectVote(int vno);

	ArrayList<VoteItem> selectVoteItem(int vno);

	int submitVote(VoteItem vi);
	
	
	
}
