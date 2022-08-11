package com.kh.apartmentor.sports.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.apartmentor.common.model.vo.PageInfo;
import com.kh.apartmentor.common.model.vo.Reserve;

@Repository
public class SportsDao {

	//-------------------------- golf ---------------------------------------------------------
	
	public ArrayList<Reserve> selectGolfSeatList(SqlSessionTemplate sqlSession, Reserve r) {
		return (ArrayList)sqlSession.selectList("sportsMapper.selectGolfSeatList", r);
	}
	
	public ArrayList<Reserve> searchTimeAndDate(SqlSessionTemplate sqlSession, Reserve r) {
		return (ArrayList)sqlSession.selectList("sportsMapper.searchTimeAndDate", r);
	}

	public int insertGolfSeat(SqlSessionTemplate sqlSession, Reserve r) {
		return sqlSession.insert("sportsMapper.insertGolfSeat", r);
	}
	
	
	//--------------------------- miniGym ----------------------------------------------------
	
	public ArrayList<Reserve> selectMiniGymTimeList(SqlSessionTemplate sqlSession, Reserve r){
		return (ArrayList)sqlSession.selectList("sportsMapper.selectMiniGymTimeList", r);
	}
	
	public ArrayList<Reserve> searchDate(SqlSessionTemplate sqlSession, Reserve r) {
		return (ArrayList)sqlSession.selectList("sportsMapper.searchDate", r);
	}
	
	public int insertMiniGym(SqlSessionTemplate sqlSession, Reserve r) {
		return sqlSession.insert("sportsMapper.insertMiniGym", r);
	}
	
	
	// --------------------------- 이용내역 ----------------------------------------------------
	/*
	 * public int selectListCount(SqlSessionTemplate sqlSession) { return
	 * sqlSession.selectOne("sportsMapper.selectListCount"); }
	 * 
	 * public ArrayList<Reserve> selectList(SqlSessionTemplate sqlSession, PageInfo
	 * pi){
	 * 
	 * int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit(); int limit =
	 * pi.getBoardLimit();
	 * 
	 * RowBounds rowBounds = new RowBounds(offset, limit);
	 * 
	 * return (ArrayList)sqlSession.selectList("sportsMapper.selectList",
	 * null,rowBounds); }
	 */
	 
	public int selectOptionListCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("sportsMapper.selectOptionListCount", category);
	}
	
	public ArrayList<Reserve> selectOptionList(SqlSessionTemplate sqlSession, String category, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("sportsMapper.selectOptionList", category, rowBounds);
	}
	
	
	
	
	
	
}
