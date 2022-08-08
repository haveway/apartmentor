package com.kh.apartmentor.sports.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.apartmentor.common.model.vo.Reserve;
import com.kh.apartmentor.sports.service.SportsService;

@Controller
public class SportsController {
	
	@Autowired
	private SportsService sportsService;

	@RequestMapping("golf.sp")
	public String reserveGolf() {
		return "sports/golf";
	}
	
	@ResponseBody
	@RequestMapping("reserveGolfSeat.sp")
	public String insertGolfSeat(Reserve r) {
		//System.out.println(r);
		//System.out.println(r.getStartDay());
		
		ArrayList<Reserve> list = sportsService.searchTimeAndDate(r);
		if(!list.isEmpty()) {
			return "fail";
		} else {
			return sportsService.insertGolfSeat(r) > 0 ? "success" : "fail";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="golfSeatList.sp", produces="application/json; charset=UTF-8")
	public String selectGolfSeatList(Reserve r) {
		//System.out.println(r.getStartDate());
		//System.out.println(r.getStartDay());
		return new Gson().toJson(sportsService.selectGolfSeatList(r));
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping("miniGym.sp")
	public String reserve2() {
		
		return "sports/miniGym";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
