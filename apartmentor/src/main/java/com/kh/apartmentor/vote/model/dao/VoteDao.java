package com.kh.apartmentor.vote.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.apartmentor.common.model.vo.PageInfo;
import com.kh.apartmentor.vote.model.vo.Vote;
import com.kh.apartmentor.vote.model.vo.VoteItem;

@Repository
public class VoteDao {

	public int insertVote(Vote v, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("voteMapper.insertVote", v);
	}

	public int insertVoteItem(List<VoteItem> voteItemList, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("voteMapper.insertVoteItem", voteItemList);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("voteMapper.selectListCount");
		
	}

	public ArrayList<Vote> selectVoteList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("voteMapper.selectVoteList", null, rowBounds);
	}

	public int setVoteStatus(SqlSessionTemplate sqlSession) {
		return sqlSession.update("voteMapper.setVoteStatus");
	}

}
