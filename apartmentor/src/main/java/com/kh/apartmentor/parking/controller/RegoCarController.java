package com.kh.apartmentor.parking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.apartmentor.member.model.vo.Member;
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
	
	// 주차 리스트 띄우는거 해보기!
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
