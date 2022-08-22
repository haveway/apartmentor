package com.kh.apartmentor.fee.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.apartmentor.fee.model.service.FeeService;
import com.kh.apartmentor.fee.model.vo.Fee;

@Controller
public class FeeController {

	
	@Autowired
	private FeeService feeService;
	
	/*
	 * @RequestMapping("feeView.fe") public String fee() { return "fee/feeView"; }
	 */
	
	//@ResponseBody
	@RequestMapping("feeView.fe")
	public ModelAndView selectFee(ModelAndView mv) {
		
		ArrayList<Fee> list = feeService.selectFeeList();
		System.out.println(list);
		
		mv.addObject("list", feeService.selectFeeList())
		  .setViewName("fee/feeView");
		
		return mv;
	}
	
	
	
}
