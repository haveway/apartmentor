package com.kh.apartmentor.study.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.apartmentor.common.model.vo.Reserve;
import com.kh.apartmentor.study.model.service.StudyService;

@Controller
public class StudyController {
	
	@Autowired
	private StudyService studyService;
	
	@RequestMapping("seatView.st") 
	public String study() { 
		return "study/seatView"; 
	}
	
	@ResponseBody
	@RequestMapping(value="seatView.st", produces="application/json; charset=UTF-8")
	public String ajaxSelectReserve(int userNo) {
		Reserve r = studyService.selectReserve(userNo);
		System.out.println(r);
		return new Gson().toJson(studyService.selectReserve(userNo));
	}
	
	@ResponseBody
	@RequestMapping(value="selectSeatNo.st", produces="application/json; charset=UTF-8")
	public String ajaxSelectSeatNo(int seatNo) {
		ArrayList<Reserve> list = studyService.selectList(seatNo);
		System.out.println("list : " + list);
		return new Gson().toJson(list);
	}
	
	
//	@RequestMapping("seatView.st")
//	public ModelAndView seatView(ModelAndView mv) {
//
//		ArrayList<Reserve> list = studyService.selectList();
//		
//		mv.addObject("list", studyService.selectList())
//		  .setViewName("study/seatView");
//		
//		return mv;
//	}
	
	@ResponseBody
	@RequestMapping("reserveSeat.st")
	public Reserve reserveSeat(ModelAndView mv, String startTime, String endTime, int seatNo, int userNo, String startDay, int loginUserNo) {
		
		Reserve r = new Reserve();
		r.setStartDate(startTime);
		r.setEndDate(endTime);
		r.setFacility("st"); 
		r.setSeatNo(seatNo);
		r.setUserNo(userNo);
		r.setStatus("Y");
		
		int result = studyService.reserveSeat(r);
		
		Reserve reserveInfo = null;
		reserveInfo = studyService.selectReserve(loginUserNo);
		System.out.println("예약 성공 : " + reserveInfo);
	
		mv.addObject("reserveInfo", studyService.selectReserve(loginUserNo))
		  .setViewName("study/seatView");
		
		return reserveInfo;
	}
	
	@ResponseBody
	@RequestMapping("updateStatus.st")
	public ModelAndView updateReserve(ModelAndView mv, String today) {
		
		int result = studyService.updateStatus(today);
		System.out.println("독서실 전 날 이용자 수 : " + result);
		
		mv.addObject("updateStatus", studyService.updateStatus(today))
		  .setViewName("study/seatView");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("deleteReserve.st")
	public int deleteReserve(int userNo) {
		
		int result = studyService.deleteReserve(userNo);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
