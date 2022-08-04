package com.kh.apartmentor.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.apartmentor.member.model.service.MemberService;
import com.kh.apartmentor.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder; 
	
	@RequestMapping("memberList.do")
	public String memeberList() {
		
		return "member/memberList";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m,HttpSession session,ModelAndView mv) {
		System.out.println(m);
		Member loginUser = memberService.loginMember(m);
		System.out.println(loginUser);
		System.out.println(m.getUserPwd());
		System.out.println(loginUser.getUserId());
		if(loginUser != null && bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("main");
		} else {
			session.setAttribute("NO", "NO");
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m,ModelAndView mv, HttpSession session) {
		System.out.println("평문" + m.getUserPwd());
		
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		
		System.out.println("암호문" + encPwd);
		
		m.setUserPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
			return "redirect:/";
		}else { 
			mv.addObject("alertMsg", "다시 확인해주세요.");
			return "NO";
		}
	}
	

}
