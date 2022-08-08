package com.kh.apartmentor.visit.model.service;

import java.util.ArrayList;

import com.kh.apartmentor.visit.model.vo.Visit;
import com.kh.apartmentor.visit.model.vo.VisitCategory;

public interface VisitService {
	
	// 예약 작성하기 (insert)
	int insertVisitReserve(Visit v);
	
	// 카테고리
	ArrayList<VisitCategory> selectVisitCategory();
	
	// 예약 날짜 / 시간 가져오기 (select)
	ArrayList<Visit> selectVisitReserve(int vno);
}
