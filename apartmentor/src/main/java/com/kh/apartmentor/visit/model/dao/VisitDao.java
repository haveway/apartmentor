package com.kh.apartmentor.visit.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.apartmentor.common.model.vo.PageInfo;
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

	public ArrayList<Visit> selectVisitAllReserve(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("visitMapper.selectVisitReserveAll");
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("visitMapper.selectListCount");
	}

	public ArrayList<Visit> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("visitMapper.selectList", null, rowBounds);
	}
	
	public int selectCategoryListCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("visitMapper.selectCategoryListCount", category);
	}

	public ArrayList<Visit> selectCategoryList(SqlSessionTemplate sqlSession, String category, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("visitMapper.selectCategoryList", category, rowBounds);
	}

	public Visit selectVisit(SqlSessionTemplate sqlSession, int visitVo) {
		return sqlSession.selectOne("visitMapper.selectVisit", visitVo);
	}

	public int okReserveStatus(SqlSessionTemplate sqlSession, int visitVo) {
		return sqlSession.update("visitMapper.okReserveStatus", visitVo);
	}

	public int noReserveStatus(SqlSessionTemplate sqlSession, int visitVo) {
		return sqlSession.update("visitMapper.noReserveStatus", visitVo);
	}
	
	

}
