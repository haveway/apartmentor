package com.kh.apartmentor.visit.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public ArrayList<Visit> selectVisitReserve(int vno) {
		return visitDao.selectVisitReserve(sqlSession, vno);
	}

	@Override
	public ArrayList<VisitCategory> selectVisitCategory() {
		return visitDao.selectVisitCategory(sqlSession);
	}

	
	

}
