package com.kh.apartmentor.visit.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.apartmentor.visit.model.vo.Visit;

@Service
public class VisitServiceImpl implements VisitService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertVisitReserve(Visit v) {
		
		return 0;
	}
	
	

}
