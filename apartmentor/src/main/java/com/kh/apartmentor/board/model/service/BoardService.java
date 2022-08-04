package com.kh.apartmentor.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.apartmentor.board.model.dao.BoardDao;
import com.kh.apartmentor.board.model.vo.Board;
import com.kh.apartmentor.board.model.vo.Reply;
import com.kh.apartmentor.common.model.vo.PageInfo;

@Service
public class BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao boardDao;
	
	// 게시글 총 갯수 조회
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}

	// 한 페이지에 보여줄 게시글  리스트 조회
	public ArrayList<Board> selectList(PageInfo pi) {
		return boardDao.selectList(sqlSession, pi);
	}

	public int increaseCount(int boadrNo) {
		return boardDao.increaseCount(sqlSession, boadrNo);
	}

	public Board selectBoard(int boardNo) {
		return boardDao.selectBoard(sqlSession, boardNo);
	}

	public ArrayList<Reply> selectReplyList(int bno) {
		return boardDao.selectReplyList(sqlSession, bno);
	}

	public int selectSearchCount(String keyword) {
		return boardDao.selectSearchCount(sqlSession, keyword);
	}

	public ArrayList<Board> selectSearchList(String keyword, PageInfo pi) {
		return boardDao.selectSearchList(sqlSession, keyword, pi);
	}

	

}
