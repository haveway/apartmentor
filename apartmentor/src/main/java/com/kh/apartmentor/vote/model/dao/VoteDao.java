package com.kh.apartmentor.vote.model.dao;

public class VoteDao {

<<<<<<< HEAD
=======
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

	public int selectCategoryListCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("voteMapper.selectCategoryListCount", category);
	}

	public ArrayList<Vote> selectCategoryList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("voteMapper.selectCategoryList", keyword, rowBounds);
	}

	public int searchListCount(SqlSessionTemplate sqlSession,String keyword) {
		return sqlSession.selectOne("voteMapper.searchListCount", keyword);
	}

	public ArrayList<Vote> selectSearchList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("voteMapper.selectSearchList", keyword, rowBounds);
	}

	public Vote selectVote(SqlSessionTemplate sqlSession, int vno) {
		return sqlSession.selectOne("voteMapper.selectVote", vno);
	}

	public ArrayList<VoteItem> selectVoteItem(SqlSessionTemplate sqlSession, int vno) {
		return (ArrayList)sqlSession.selectList("voteMapper.selectVoteItem", vno);
	}

<<<<<<< HEAD
>>>>>>> parent of b1472ee (Merge branch 'main' of https://github.com/haveway/apartmentor)
=======
>>>>>>> parent of b1472ee (Merge branch 'main' of https://github.com/haveway/apartmentor)
}
