package com.kh.apartmentor.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
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
		Member loginUser = memberService.loginMember(m);
		if(loginUser != null && bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("main");
		} else {
			session.setAttribute("noLogin", "noLogin");
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
	@ResponseBody
	@RequestMapping(value = "findId.me", produces="application/json; charset=UTF-8")
	public String findId(String name,String birthday, String aptNo) {
		Member m = new Member();
		m.setUserName(name);
		m.setBirthday(birthday);
		m.setAptNo(aptNo);
		
		System.out.println(m);
		Member userId = memberService.findId(m);
		return new Gson().toJson(userId);
		
	}
	@ResponseBody
	@RequestMapping(value = "findPwd.me", produces="application/json; charset=UTF-8")
	public String findPwd(String id, String name,String birthday, String aptNo,HttpSession session) {
		Member m = new Member();
		m.setUserId(id);
		m.setUserName(name);
		m.setBirthday(birthday);
		m.setAptNo(aptNo);
		
		System.out.println(m);
		Member userPwd = memberService.findPwd(m);
		session.setAttribute("userId", id);
		return new Gson().toJson(userPwd);
		
	}
	
	@RequestMapping("update.pw")
	public int updatePw(String newPwd, String checkPwd, String userId) {
		System.out.println(userId);
		if(newPwd.equals(checkPwd)) {
			newPwd = checkPwd;
			
			String encPwd = bCryptPasswordEncoder.encode(newPwd);
			
			int result = memberService.updatePw(encPwd);
			
		} else {
			
			
		}
		
		return 0;
	}
	

}
