package com.kh.apartmentor.visit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.apartmentor.visit.model.vo.Visit;

@Controller
public class VisitController {

	@RequestMapping("enrollForm.visit")
	public String enrollFormVisit() {
		return "visit/visitEnrollForm";
	}
	
	@RequestMapping("insert.viist")
	public String insertVisitReserve(Visit v) {
		
		return "redirect:/";
	}
	
	@RequestMapping("list.visit")
	public String listVisit() {
		return "visit/visitList";
	}
	
	@RequestMapping("detail.visit")
	public String detailVist() {
		return "visit/visitDetailView";
	}
	
}
