package com.kh.apartmentor.sports.service;

import java.util.ArrayList;

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
	
	public int insertGolfSeat(Reserve r) {
		return sportsDao.insertGolfSeat(sqlSession, r);
	}
	
	public ArrayList<Reserve> searchTimeAndDate(Reserve r) {
		return sportsDao.searchTimeAndDate(sqlSession, r);
	}
	
	public ArrayList<Reserve> selectGolfSeatList(Reserve r) {
		return sportsDao.selectGolfSeatList(sqlSession, r);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
