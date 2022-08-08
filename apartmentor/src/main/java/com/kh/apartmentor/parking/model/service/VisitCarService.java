package com.kh.apartmentor.parking.model.service;

import com.kh.apartmentor.parking.model.vo.Parking;

public interface VisitCarService {
	
	// 방문차량등록(insert)
	int enrollVisitCar(Parking p);

	int SetDayVisitCar(String today);

}
