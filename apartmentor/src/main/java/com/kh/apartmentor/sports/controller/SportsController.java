package com.kh.apartmentor.sports.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.apartmentor.board.model.service.BoardService;
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
	
	
	@RequestMapping("golfSeatList.sp")
	public String reserve(Reserve r) {
		//System.out.println(r.getStartDate());
		//System.out.println(r.getStartDay());
		
		sportsService.selectGolfSeatList(r);
		
		
		return "sports/golf";
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping("miniGym.sp")
	public String reserve2() {
		
		return "sports/miniGym";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
