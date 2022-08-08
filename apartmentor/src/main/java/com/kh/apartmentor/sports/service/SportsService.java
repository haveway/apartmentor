package com.kh.apartmentor.sports.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.apartmentor.common.model.vo.Reserve;
import com.kh.apartmentor.sports.dao.SportsDao;

@Service
public class SportsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SportsDao sportsDao;
	
	
	public Reserve selectGolfSeatList(Reserve r) {
		return sportsDao.selectGolfSeatList(sqlSession, r);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
