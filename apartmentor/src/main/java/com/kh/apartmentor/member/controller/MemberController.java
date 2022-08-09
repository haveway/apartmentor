package com.kh.apartmentor.member.controller;

import java.util.HashMap;

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
	public String insertMember(Member m,ModelAndView mv, HttpSession session, String aptNo1, String aptNo2) {
		System.out.println("1         "+m);
		String aptNo = aptNo1 + "동" + aptNo2 + "호";
		m.setAptNo(aptNo);
		System.out.println("2           "+m);
		System.out.println("평문" + m.getUserPwd());
		
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		
		System.out.println("암호문" + encPwd);
		
		m.setUserPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg2", "성공적으로 회원가입이 되었습니다.");
			return "redirect:/";
		}else { 
			mv.addObject("alertMsg1", "다시 확인해주세요.");
			return "NO";
		}
	}
	@ResponseBody
	@RequestMapping(value = "findId.me", produces="application/json; charset=UTF-8")
	public String findId(String name,String birthday, String aptNo1, String aptNo2) {

		Member m = new Member();
		String aptNo = aptNo1 + "동" + aptNo2 + "호";
		m.setUserName(name);
		m.setBirthday(birthday);
		m.setAptNo(aptNo);
		
		System.out.println(m);
		Member userId = memberService.findId(m);
		return new Gson().toJson(userId);
		
	}
	@ResponseBody
	@RequestMapping(value = "findPwd.me", produces="application/json; charset=UTF-8")
	public String findPwd(String id, String name,String birthday, String aptNo1, String aptNo2,HttpSession session) {
		String aptNo = aptNo1 + "동" + aptNo2 + "호";
		Member m = new Member();
		m.setUserId(id);
		m.setUserName(name);
		m.setBirthday(birthday);
		m.setAptNo(aptNo);
		
		System.out.println(m);
		Member userPwd = memberService.findPwd(m);
		userPwd.setUserId(id);
		
		return new Gson().toJson(userPwd);
		
	}
	@RequestMapping(value = "update.pw")
	public String updatePw(String newPwd, String checkPwd, String pwdId, HttpSession session) {
		
		System.out.println(pwdId);
		
		if(newPwd.equals(checkPwd)) {
			newPwd = checkPwd;
			
			String encPwd = bCryptPasswordEncoder.encode(newPwd);
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("encPwd", encPwd);
			map.put("pwdId", pwdId);
			
			int result = memberService.updatePwd(map);
			
			System.out.println(result);
			
			if(result > 0) {
				session.setAttribute("alertMsg2", "비밀번호 변경완료.");
			} else {
				session.setAttribute("alertMsg1", "비밀번호 변경실패.");
			}
		} else {
			session.setAttribute("alertMsg1", "비밀번호가 동일하지 않습니다.");
		}
		return "login";
	}
	@ResponseBody
	@RequestMapping(value = "checkId.me" , produces="application/json; charset=UTF-8")
	public int checkId1(String userId) {
		int count = memberService.checkId1(userId);
		if(count > 0) {
			return 0 ;
		} else {
			return 1;
		}
		
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
	@RequestMapping("update.me")
	public String updateMember(Member m, HttpSession session) {
		System.out.println(m);
		
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		int result = memberService.updateMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg2", "회원정보 변경성공!");
		} else {
			session.setAttribute("alertMsg1", "회원정보 변경실패!");
		}
		return "main";
	}

}
