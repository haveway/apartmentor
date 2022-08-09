package com.kh.apartmentor.main.model.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.apartmentor.board.model.vo.Board;
import com.kh.apartmentor.main.model.dao.MainDao;
import com.kh.apartmentor.notice.vo.Notice;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MainDao mainDao;
	@Override
	public ArrayList<Board> boardList() {
		return mainDao.boardList(sqlSession);
	}
	@Override
	public ArrayList<Notice> noticeList() {
		return mainDao.noticeList(sqlSession);
	}

}
