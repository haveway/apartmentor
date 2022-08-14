package com.kh.apartmentor.parking.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.apartmentor.parking.model.vo.Parking;

@Repository
public class RegoCarDao {

	public int insertRegoCar(SqlSessionTemplate sqlSession, Parking p){
		return sqlSession.insert("regoCarMapper.insertRegoCar", p);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
