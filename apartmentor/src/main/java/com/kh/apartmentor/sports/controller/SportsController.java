package com.kh.apartmentor.sports.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SportsController {

	@RequestMapping("golf.sp")
	public String reserve() {
		
		return "sports/golf";
	}
}
