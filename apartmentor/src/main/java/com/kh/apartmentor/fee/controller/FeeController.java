package com.kh.apartmentor.fee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.apartmentor.fee.model.service.FeeService;

@Controller
public class FeeController {

	
	@Autowired
	private FeeService feeService;
	
	@RequestMapping("feeView.fe")
	public String fee() {
		return "fee/feeView";
	}
	
	
	
}
