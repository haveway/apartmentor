package com.kh.apartmentor.vote.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.apartmentor.common.model.vo.PageInfo;
import com.kh.apartmentor.vote.model.vo.Vote;
import com.kh.apartmentor.vote.model.vo.VoteItem;

public interface VoteService {

	int insertVote(Vote v, List<VoteItem> voteItemList);
	
	int setVoteStatus();
	
	int selectListCount();

	ArrayList<Vote> selectVoteList(PageInfo pi);
	
	
	
}
