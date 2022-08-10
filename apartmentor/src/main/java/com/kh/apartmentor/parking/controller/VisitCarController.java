package com.kh.apartmentor.parking.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
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
	public ModelAndView SelectVisitCar(Parking p, ModelAndView mv, HttpSession session) {
		
		int selectResult = visitCarService.selectVisitCar(p);
		int enrollResult;
		
		if(selectResult > 0) {
			enrollResult = updateVisitCar(p);
		} else {
			enrollResult = enrollVisitCar(p);
		}
		
		if(enrollResult > 0) {
			session.setAttribute("alertMsg2", "방문차량  등록완료"); 
			mv.setViewName("main");
		} else {
			session.setAttribute("alertMsg1", "방문차량 등록실패. 관리자에게 문의해주세요.");
			mv.setViewName("main");
		}
		
		return mv;
	}
	
	public int enrollVisitCar(Parking p) {
        
		int result = visitCarService.enrollVisitCar(p);
		setDayVisitCar();
		
		return result;
		
	}

	public int updateVisitCar(Parking p) {
		
		int result = visitCarService.updateVisitCar(p);
		setDayVisitCar();
		
		return result;
	}
	
	@Scheduled(cron="1 00 00 * * ?")
	public void setDayVisitCar() {

		int result = visitCarService.setDayVisitCar();
		
		System.out.println("방문차량 업데이트 결과 :" + result + "대의 차량을 업데이트 하였습니다.");
	}
	

}
