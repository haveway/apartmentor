package com.kh.apartmentor.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.apartmentor.common.model.vo.Reserve;
import com.kh.apartmentor.study.model.service.StudyService;

@Controller
public class StudyController {
	
	@Autowired
	private StudyService studyService;
	
	@RequestMapping("seatView.st")
	public String seatView() {
		return "study/seatView";
	}
	
	@ResponseBody
	@RequestMapping("reserveSeat.st")
	public Reserve reserveSeat(String startTime, String endTime, int seatNo) {
		
		//System.out.println(startTime);
		//System.out.println(endTime);
		//System.out.println(seatNo);
		
//		Reserve r = new Reserve(9999, startTime, endTime, "st", seatNo, 2, "Y", "2022-08-05");
		Reserve r = new Reserve();
		r.setReserveNo(999);
		r.setStartDate(startTime);
		r.setEndDate(endTime);
		r.setFacility("st");
		r.setSeatNo(seatNo);
		r.setUserNo(2);
		r.setStatus("Y");
//		System.out.println(r);
		
		int result = studyService.reserveSeat(r);
//		System.out.println(result);
		
		Reserve rInfo = null;
		if(result > 0) {
			rInfo = studyService.selectReserve(r.getUserNo());
//			System.out.println(rInfo);
		}
		
		return rInfo;
	}

}
