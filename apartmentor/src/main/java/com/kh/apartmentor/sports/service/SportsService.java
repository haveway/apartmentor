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
	
	
	// ----------------- golf ---------------------------
	
	public ArrayList<Reserve> selectGolfSeatList(Reserve r) {
		return sportsDao.selectGolfSeatList(sqlSession, r);
	}
	
	public ArrayList<Reserve> searchTimeAndDate(Reserve r) {
		return sportsDao.searchTimeAndDate(sqlSession, r);
	}
	
	public int insertGolfSeat(Reserve r) {
		return sportsDao.insertGolfSeat(sqlSession, r);
	}
	
	
	// -------------- miniGym ----------------------------
	
	public ArrayList<Reserve> selectMiniGymTimeList(Reserve r){
		return sportsDao.selectMiniGymTimeList(sqlSession, r);
	}
	
	public ArrayList<Reserve> searchDate(Reserve r) {
		return sportsDao.searchDate(sqlSession, r);
	}
	
	public int insertMiniGym(Reserve r) {
		return sportsDao.insertMiniGym(sqlSession, r);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
