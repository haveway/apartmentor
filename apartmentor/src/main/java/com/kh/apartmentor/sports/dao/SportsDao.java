package com.kh.apartmentor.sports.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.apartmentor.common.model.vo.Reserve;

@Repository
public class SportsDao {

	
	public Reserve selectGolfSeatList(SqlSessionTemplate sqlSession, Reserve r) {
		return sqlSession.selectOne("boardMapper.selectBoard", r);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
