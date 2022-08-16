package com.kh.apartmentor.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.apartmentor.chat.model.vo.Chat;
import com.kh.apartmentor.member.model.vo.Member;

@Repository
public class ChatDao {

	public ArrayList<Chat> selectChatList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList");
	}

	public int insertChat(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.insert("chatMapper.insertChat", c);
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectMemberList");
	}

}
