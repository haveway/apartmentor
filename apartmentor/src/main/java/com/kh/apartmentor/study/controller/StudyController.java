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
//		System.out.println(list);
		
		mv.addObject("list", studyService.selectList())
		  .setViewName("study/seatView");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("reserveSeat.st")
	public ModelAndView reserveSeat(ModelAndView mv, String startTime, String endTime, int seatNo, int userNo, String startDay) {
		
		//System.out.println(startTime);
		//System.out.println(endTime);
		//System.out.println(seatNo);
		
//		Reserve r = new Reserve(9999, startTime, endTime, "st", seatNo, 2, "Y", "2022-08-05", "2022-08-05");
		Reserve r = new Reserve();
		r.setStartDate(startTime); //전달받음
		r.setEndDate(endTime); //전달받음
		r.setFacility("st"); 
		r.setSeatNo(seatNo); //전달받음
		r.setUserNo(userNo); //전달받음
		r.setStatus("Y"); //디폴트인가..?
		r.setStartDay(startDay); //전달받음
//		System.out.println(r);
		
		int result = studyService.reserveSeat(r);
//		System.out.println(result);
		
		Reserve reserveInfo = null;
		if(result > 0) {
			reserveInfo = studyService.selectReserve(r.getUserNo());
			System.out.println(reserveInfo);
		}
		
		mv.addObject("reserveInfo", studyService.selectReserve(userNo))
		  .setViewName("study/seatView");
		
		return mv;
	}

}
