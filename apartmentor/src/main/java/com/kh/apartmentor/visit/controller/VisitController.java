package com.kh.apartmentor.visit.controller;

import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.apartmentor.board.model.vo.Board;
import com.kh.apartmentor.common.model.vo.PageInfo;
import com.kh.apartmentor.common.template.Pagination;
import com.kh.apartmentor.visit.model.service.VisitService;
import com.kh.apartmentor.visit.model.vo.Visit;

@Controller
public class VisitController {
	
	@Autowired
	private VisitService visitService;
	
	@Autowired
	private JavaMailSender sender;

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
	
	@ResponseBody
	@RequestMapping(value="check.visit", produces="application/json; charset=UTF-8")
	public String ajaxCheckVisitReserve(Visit v) {
		return new Gson().toJson(visitService.checkVisitReserve(v));
	}
	
	/**
	 * 예약 날짜 / 시간 전부 가져오는 메소드
	 */
	@ResponseBody
	@RequestMapping(value="selectAll.visit", produces="application/json; charset=UTF-8")
	public String ajaxSelectVisitAllReserve() {
		return new Gson().toJson(visitService.selectVisitAllReserve());
	}
	
	/**
	 * 예약 목록 페이지로 이동하는 메소드
	 */
	@RequestMapping("list.visit")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(visitService.selectListCount(), currentPage, 5, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list",visitService.selectList(pi))
		  .setViewName("visit/visitListView");
		
		return mv;
		
	}
	
	/**
	 * 예약 목록 페이지 - 예약 종류
	 */
	@RequestMapping("categoryList.visit")
	public String selectCategoryList(@RequestParam(value="cpage", defaultValue="1")int currentPage, String category, Model model) {
		
		PageInfo pi = Pagination.getPageInfo(visitService.selectCategoryListCount(category), currentPage, 5, 10);
		
		ArrayList<Visit> cList = visitService.selectCategoryList(category, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("cList", cList);
		model.addAttribute("category", category);
		
		
		return "visit/visitListView";
		
	}
	
	/**
	 * 예약 상세 페이지로 이동하는 메소드
	 */
	@RequestMapping("detail.visit")
	public String detailVist(int vno, Model model) {
		
		model.addAttribute("v", visitService.selectVisit(vno));
		
		return "visit/visitDetailView";
	}
	
	
	/**
	 * 예약 승인
	 */
	@RequestMapping("okReserve.visit")
	public String okReserveStatus(int vno, String visitEmail, String aptNo, String visitValue, String visitDate, String visitTime, HttpServletRequest request, HttpSession session) throws MessagingException {
		
		
		int result = visitService.okReserveStatus(vno);
		
		if(result > 0) {
			
			String ip = request.getRemoteAddr();
			
			MimeMessage message = sender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setTo(visitEmail);
			helper.setSubject(visitValue + " 검침 방문 예약이 승인되셨습니다");
			helper.setText(aptNo + "의 " + visitValue + " 검침 방문 예약이 승인되셨습니다.<br>" +
					 "방문 예약 날짜와 시간은 " + visitDate + "&nbsp;" + visitTime + "입니다.", true);
			sender.send(message);
			
			
			session.setAttribute("alertMsg2", "예약이 승인 되었습니다");
			return "redirect:list.visit";
		} else {
			session.setAttribute("alertMsg1", "예약 승인 오류");
			return "redirect:detail.visit?vno=" + vno;
		}
		
	}
	
	
	/**
	 * 예약 거절
	 */
	@RequestMapping("noReserve.visit")
	public String noReserveStatus(int vno, String visitEmail, String aptNo, String visitValue, String visitDate, String visitTime, HttpServletRequest request, HttpSession session) throws MessagingException {
		
		int result = visitService.noReserveStatus(vno);
		
		if(result > 0) {
			
			String ip = request.getRemoteAddr();
			
			MimeMessage message = sender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setTo(visitEmail);
			helper.setSubject(visitValue + " 검침 방문 예약이 반려되셨습니다.");
			helper.setText(aptNo + "의 " + visitDate + "&nbsp;" + visitTime + "에 예약한 " +
						   visitValue + " 검침 방문 예약이 반려되셨습니다.<br>" +
						   "다른 날짜에 다시 예약해주시길 바랍니다.<br>", true);
			sender.send(message);
			
			
			session.setAttribute("alertMsg2", "예약이 반려 되었습니다");
			return "redirect:list.visit";
		} else {
			session.setAttribute("alertMsg1", "예약 승인 오류");
			return "redirect:detail.visit?vno=" + vno;
		}
		
	}
}
