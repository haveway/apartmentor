package com.kh.apartmentor.parking.model.service;

import java.util.ArrayList;

import com.kh.apartmentor.common.model.vo.PageInfo;
import com.kh.apartmentor.parking.model.vo.Parking;

public interface VisitCarService {
	
	// 방문차량등록(insert)
	int enrollVisitCar(Parking p);

	int setDayVisitCar();

	int selectVisitCar(Parking p);

	int updateVisitCar(Parking p);
	
	// ------------관리자 방문차량-------------------
	int adminVisitCarListCount();
	
	ArrayList<Parking> adminVisitCarList(PageInfo pi);
	
	int deleteVisitCar(String carNo);
}
