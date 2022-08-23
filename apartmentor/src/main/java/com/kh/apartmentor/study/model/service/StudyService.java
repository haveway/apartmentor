package com.kh.apartmentor.study.model.service;

import java.util.ArrayList;

import com.kh.apartmentor.common.model.vo.Reserve;

public interface StudyService {
	
	//좌석 예약
	int reserveSeat(Reserve r);
	
	//예약 조회
	Reserve selectReserve(int userNo);
	
	//좌석 전체 조회
	ArrayList<Reserve> selectList(int seatNo);
	
	//상태 컬럼 수정
	int updateStatus(String today);
	
	//예약 취소
	int deleteReserve(int userNo);
	


	
}
