package com.kh.apartmentor.sports.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.apartmentor.common.model.vo.Reserve;

@Repository
public class SportsDao {

	
	public int insertGolfSeat(SqlSessionTemplate sqlSession, Reserve r) {
		return sqlSession.insert("sportsMapper.insertGolfSeat", r);
	}
	
	
	public ArrayList<Reserve> searchTimeAndDate(SqlSessionTemplate sqlSession, Reserve r) {
		return (ArrayList)sqlSession.selectList("sportsMapper.searchTimeAndDate", r);
	}
	
	
	public ArrayList<Reserve> selectGolfSeatList(SqlSessionTemplate sqlSession, Reserve r) {
		return (ArrayList)sqlSession.selectList("sportsMapper.selectGolfSeatList", r);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
