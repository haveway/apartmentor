package com.kh.apartmentor.visit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VisitController {

	@RequestMapping("enrollForm.visit")
	public String enrollForm() {
		return "visit/visitEnrollForm";
	}
	
}
