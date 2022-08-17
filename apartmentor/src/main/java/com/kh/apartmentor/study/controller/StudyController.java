package com.kh.apartmentor.study.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.apartmentor.common.model.vo.Reserve;
import com.kh.apartmentor.study.model.service.StudyService;

@Controller
public class StudyController {
	
	@Autowired
	private StudyService studyService;
	
	@RequestMapping("seatView.st")
	public ModelAndView seatView(ModelAndView mv) {
		// 보내야 할 것 	1."study/seatView"	2. select SeatList
		
		ArrayList<Reserve> list = studyService.selectList();
		//System.out.println(list);
		
		mv.addObject("list", studyService.selectList())
		  .setViewName("study/seatView");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("reserveSeat.st")
	public Reserve reserveSeat(ModelAndView mv, String startTime, String endTime, int seatNo, int userNo, String startDay, int loginUserNo) {
		
//		Reserve r = new Reserve(9999, startTime, endTime, "st", seatNo, 2, "Y", "2022-08-05", "2022-08-05");
		Reserve r = new Reserve();
		r.setStartDate(startTime); //전달받음
		r.setEndDate(endTime); //전달받음
		r.setFacility("st"); 
		r.setSeatNo(seatNo); //전달받음
		r.setUserNo(userNo); //전달받음
		r.setStatus("Y"); //디폴트인가..?
		//r.setStartDay(startDay); //전달받음
		
		int result = studyService.reserveSeat(r); //insert
		
		Reserve reserveInfo = null;
		reserveInfo = studyService.selectReserve(loginUserNo);
		System.out.println("예약 성공 : " + reserveInfo);
	
		mv.addObject("reserveInfo", studyService.selectReserve(loginUserNo))
		  .setViewName("study/seatView");
		
		return reserveInfo;
	}
	
	@ResponseBody
	@RequestMapping("updateReserve.st")
	public ModelAndView updateReserve(ModelAndView mv, int userNo) {
		
		Reserve r = studyService.selectReserve(userNo);
		System.out.println("update r : " + r);
		
		mv.addObject("updateReserve", studyService.selectReserve(userNo))
		  .setViewName("study/seatView");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("updateStatus.st")
	public ModelAndView updateReserve(ModelAndView mv, String today) {
		
		int result = studyService.updateStatus(today);
		System.out.println("result : " + result);
		
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
