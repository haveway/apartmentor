package com.kh.apartmentor.member.model.service;

import com.kh.apartmentor.member.model.vo.Member;

public interface MemberService {
	
	// 로그인
	Member loginMember(Member m);
	
	// 회원가입
	int insertMember(Member m);

}
