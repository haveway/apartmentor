package com.kh.apartmentor.parking.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.apartmentor.parking.model.service.RegoCarService;
import com.kh.apartmentor.parking.model.vo.Parking;

@Controller
public class RegoCarController {

	@Autowired
	private RegoCarService regoCarService;
	
	//------------- 차량등록  -------------------------
	
	// 차량 등록 페이지 띄우기 
	@RequestMapping("regoCar.rg")
	public String regoCarView() {
		return "regoCar/regoCar";
	}
	
	// 주차 등록 
	@ResponseBody
	@RequestMapping(value="insertRegoCar.rg", produces="application/json; charset=UTF-8")
	public String insertRegoCar(Parking p) {
		return new Gson().toJson(regoCarService.insertRegoCar(p));
	}
	
	// 주차 리스트 
	@ResponseBody
	@RequestMapping(value="selectRegoCarList.rg", produces="application/json; charset=UTF-8")
	public String selectRegoCarList(int userNo) {
		return new Gson().toJson(regoCarService.selectRegoCarList(userNo));
	}
	
	// 주차 등록 삭제
	@ResponseBody
	@RequestMapping(value="deleteRegoCar.rg", produces="application/json; charset=UTF-8")
	public String deleteRegoCar(String carNo) {
		return new Gson().toJson(regoCarService.deleteRegoCar(carNo));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
