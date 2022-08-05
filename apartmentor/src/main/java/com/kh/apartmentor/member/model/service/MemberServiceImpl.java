package com.kh.apartmentor.member.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.apartmentor.member.model.dao.MemberDao;
import com.kh.apartmentor.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao; 
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public Member findId(Member m) {
		return memberDao.findId(sqlSession, m);
	}

	@Override
	public Member findPwd(Member m) {
		return memberDao.findPwd(sqlSession, m);
	}

	@Override
	public int updatePwd(HashMap<String, String> map) {
		return memberDao.updatePwd(sqlSession, map);
	}

	@Override
	public int checkId1(String userId) {
		return  memberDao.checkId1(sqlSession, userId);
	}


}
