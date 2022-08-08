package com.kh.apartmentor.visit.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.apartmentor.visit.model.vo.Visit;
import com.kh.apartmentor.visit.model.vo.VisitCategory;

@Repository
public class VisitDao {

	public int insertVisitReserve(SqlSessionTemplate sqlSession, Visit v) {
		return sqlSession.insert("visitMapper.insertVisitReserve",v);
	}

	public ArrayList<Visit> selectVisitReserve(SqlSessionTemplate sqlSession, int vno) {
		return (ArrayList)sqlSession.selectList("visitMapper.selectVisitReserve",vno);
	}

	public ArrayList<VisitCategory> selectVisitCategory(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("visitMapper.selectVisitCategory");
	}

	public Visit checkVisitReserve(SqlSessionTemplate sqlSession, Visit v) {
		return sqlSession.selectOne("visitMapper.checkVisitReserve", v);
	}

}
