package com.kh.apartmentor.parking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.apartmentor.parking.model.service.VisitCarService;
import com.kh.apartmentor.parking.model.vo.Parking;

@Controller
public class VisitCarController {
	

	
	@ResponseBody
	@RequestMapping("visit.car")
	public void enrollVisitCar(Parking p) {
		
		System.out.println(p);
		
	}

}
