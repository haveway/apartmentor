package com.kh.apartmentor.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.apartmentor.board.model.vo.Board;
import com.kh.apartmentor.notice.model.vo.Notice;
@Repository
public class MainDao {

	public ArrayList<Board> boardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.boardList");
	}

	public ArrayList<Notice> noticeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.noticeList");
	}

}
