package com.kh.apartmentor.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudyController {
	
	@RequestMapping("reserveSeat.st")
	public String reserveSeat() {
		return "study/reserveStudySeat";
	}

}
