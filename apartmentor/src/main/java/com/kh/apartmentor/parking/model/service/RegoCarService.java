package com.kh.apartmentor.parking.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.apartmentor.parking.model.dao.RegoCarDao;
import com.kh.apartmentor.parking.model.vo.Parking;

@Service
public class RegoCarService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private RegoCarDao regoCarDao;
	
	
	public int insertRegoCar(Parking p){
		return regoCarDao.insertRegoCar(sqlSession, p);
	}
	
	public ArrayList<Parking> selectRegoCarList(int userNo){
		return regoCarDao.selectRegoCarList(sqlSession, userNo);
	}
	
	public int deleteRegoCar(String carNo){
		return regoCarDao.deleteRegoCar(sqlSession, carNo);
	}
	
	
	
	
	
	
	
	
	
	
}
