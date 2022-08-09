package com.kh.apartmentor.visit.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.apartmentor.visit.model.service.VisitService;
import com.kh.apartmentor.visit.model.vo.Visit;
import com.kh.apartmentor.visit.model.vo.VisitCategory;

@Controller
public class VisitController {
	
	@Autowired
	private VisitService visitService;

	/**
	 * 예약 작성 페이지로 이동하는 메소드
	 */
	@RequestMapping("enrollForm.visit")
	public ModelAndView enrollFormVisit(ModelAndView mv) {
		
		mv.addObject("visitCategory", visitService.selectVisitCategory())
		  .setViewName("visit/visitEnrollForm");
		
		return mv;
	}
	
	/**
	 * 예약을 추가하는 메소드
	 */
	@RequestMapping("insert.visit")
	public String insertVisitReserve(Visit v, HttpSession session, Model model) {
		
		int result = visitService.insertVisitReserve(v);
		
		if(result > 0) { // 성공 => main 페이지로 
			session.setAttribute("alertMsg2", "예약에 성공하셨습니다");
			return "main";
		} else { // 실패 => 작성 페이지 다시 보여주기
			model.addAttribute("alertMsg1", "게시글 작성에 실패하셨습니다");
			return "redirect:enrollForm.visit";
		}
	}
	
	/**
	 * 예약 날짜 / 시간 가져오는 메소드
	 */
	@ResponseBody
	@RequestMapping(value="select.visit", produces="application/json; charset=UTF-8")
	public String ajaxSelectVisitReserve(int vno) {
		return new Gson().toJson(visitService.selectVisitReserve(vno));
	}
	
	/**
	 * 예약 가능 여부 체크 메소드
	 */
	@ResponseBody
	@RequestMapping(value="check.visit", produces="application/json; charset=UTF-8")
	public String ajaxCheckVisitReserve(Visit v) {
		return new Gson().toJson(visitService.checkVisitReserve(v));
	}
	
	/**
	 * 예약 목록 페이지로 이동하는 메소드
	 */
	@RequestMapping("list.visit")
	public String listVisit() {
		return "visit/visitList";
	}
	
	/**
	 * 예약 상세 페이지로 이동하는 메소드
	 */
	@RequestMapping("detail.visit")
	public String detailVist() {
		return "visit/visitDetailView";
	}
	
}
