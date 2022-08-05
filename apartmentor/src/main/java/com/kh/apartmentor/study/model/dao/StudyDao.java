package com.kh.apartmentor.study.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.apartmentor.common.model.vo.Reserve;

@Repository
public class StudyDao {
	
	public int reserveSeat(SqlSessionTemplate sqlSession, Reserve r) {
		return sqlSession.insert("studyMapper.reserveSeat", r);
	}
	
	public Reserve selectReserve(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("studyMapper.selectReserve",userNo);
	}
}
