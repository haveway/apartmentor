package com.kh.apartmentor.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.apartmentor.member.model.service.MemberService;
import com.kh.apartmentor.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("memberList.do")
	public String memeberList() {
		
		return "member/memberList";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m,HttpSession session,ModelAndView mv) {
		
		Member loginUser = memberService.loginMember(m);
		return null;
		
	}

}
