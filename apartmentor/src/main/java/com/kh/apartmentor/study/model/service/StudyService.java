package com.kh.apartmentor.study.model.service;

import java.util.ArrayList;

import com.kh.apartmentor.common.model.vo.Reserve;

public interface StudyService {
	
	//좌석 예약
	int reserveSeat(Reserve r);
	
	//예약 조회
	Reserve selectReserve(int userNo);
	
	//좌석 전체 조회
	ArrayList<Reserve> selectList();

	
}
