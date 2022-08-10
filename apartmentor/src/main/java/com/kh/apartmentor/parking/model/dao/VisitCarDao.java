package com.kh.apartmentor.parking.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.apartmentor.parking.model.vo.Parking;

@Repository
public class VisitCarDao {

	public int enrollVisitCar(SqlSessionTemplate sqlSession, Parking p) {
		return sqlSession.insert("visitCarMapper.enrollVisitCar", p);
	}

	public int setDayVisitCar(SqlSessionTemplate sqlSession) {
		return sqlSession.update("visitCarMapper.setDayVisitCar");
	}

	public int selectVisitCar(SqlSessionTemplate sqlSession, Parking p) {
		return sqlSession.selectOne("visitCarMapper.selectVisitCar", p);
	}

	public int updateVisitCar(SqlSessionTemplate sqlSession, Parking p) {
		return sqlSession.update("visitCarMapper.updateVisitCar", p);
	}

}
