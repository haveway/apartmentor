package com.kh.apartmentor.parking.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.apartmentor.common.model.vo.PageInfo;
import com.kh.apartmentor.parking.model.dao.VisitCarDao;
import com.kh.apartmentor.parking.model.vo.Parking;

@Service
public class VisitCarServiceImpl implements VisitCarService {
	
	@Autowired
	private VisitCarDao visitCarDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int enrollVisitCar(Parking p) {
		return visitCarDao.enrollVisitCar(sqlSession, p);
	}


	@Override
	public int setDayVisitCar() {
		return visitCarDao.setDayVisitCar(sqlSession);
	}


	@Override
	public int selectVisitCar(Parking p) {
		return visitCarDao.selectVisitCar(sqlSession, p);
	}


	@Override
	public int updateVisitCar(Parking p) {
		return visitCarDao.updateVisitCar(sqlSession, p);
	}
	
	
	
	//--------------------------- 관리자 방문예약 ------------------------------------
	
	@Override
	public int adminVisitCarListCount() {
		return visitCarDao.adminVisitCarListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Parking> adminVisitCarList(PageInfo pi){
		return visitCarDao.adminVisitCarList(sqlSession, pi);
	}
	
	@Override
	public int deleteVisitCar(String carNo){
		return visitCarDao.deleteVisitCar(sqlSession, carNo);
	}
	
	
	
	
}