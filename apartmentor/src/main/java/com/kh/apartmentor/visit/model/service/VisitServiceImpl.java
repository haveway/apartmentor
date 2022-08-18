package com.kh.apartmentor.visit.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.apartmentor.common.model.vo.PageInfo;
import com.kh.apartmentor.visit.model.dao.VisitDao;
import com.kh.apartmentor.visit.model.vo.Visit;
import com.kh.apartmentor.visit.model.vo.VisitCategory;

@Service
public class VisitServiceImpl implements VisitService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private VisitDao visitDao;

	@Override
	public int insertVisitReserve(Visit v) {
		return visitDao.insertVisitReserve(sqlSession, v);
	}

	@Override
	public ArrayList<Visit> selectVisitReserve(int nno) {
		return visitDao.selectVisitReserve(sqlSession, nno);
	}

	@Override
	public ArrayList<VisitCategory> selectVisitCategory() {
		return visitDao.selectVisitCategory(sqlSession);
	}

	@Override
	public Visit checkVisitReserve(Visit v) {
		return visitDao.checkVisitReserve(sqlSession, v);
	}

	@Override
	public ArrayList<Visit> selectVisitAllReserve() {
		return visitDao.selectVisitAllReserve(sqlSession);
	}

	@Override
	public int selectListCount() {
		return visitDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Visit> selectList(PageInfo pi) {
		return visitDao.selectList(sqlSession, pi);
	}
	
	@Override
	public int selectCategoryListCount(String category) {
		return visitDao.selectCategoryListCount(sqlSession, category);
	}

	@Override
	public ArrayList<Visit> selectCategoryList(String category, PageInfo pi) {
		return visitDao.selectCategoryList(sqlSession, category, pi);
	}

	@Override
	public Visit selectVisit(int visitVo) {
		return visitDao.selectVisit(sqlSession, visitVo);
	}

	@Override
	public int okReserveStatus(int visitVo) {
		return visitDao.okReserveStatus(sqlSession, visitVo);
	}

	@Override
	public int noReserveStatus(int visitVo) {
		return visitDao.noReserveStatus(sqlSession, visitVo);
	}


	
	

}
