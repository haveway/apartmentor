package com.kh.apartmentor.parking.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.apartmentor.parking.model.service.VisitCarService;
import com.kh.apartmentor.parking.model.vo.Parking;

@Controller
public class VisitCarController {
	

	@Autowired
	private VisitCarService visitCarService;
	
	@ResponseBody
	@RequestMapping("visit.car")
	public ModelAndView enrollVisitCar(Parking p, ModelAndView mv, HttpSession session) {
		
		int result = visitCarService.enrollVisitCar(p);
		
		if(result > 0) {
			session.setAttribute("alertMsg1", "방문차량 등록완료");
			mv.setViewName("main");
		} else {
			session.setAttribute("alertMsg2", "방문차량 등록실패. 관리자에게 문의해주세요.");
			mv.setViewName("main");
		}
		return mv;

	}

}
