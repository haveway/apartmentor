package com.kh.apartmentor.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.apartmentor.chat.model.vo.Chat;

@Repository
public class ChatDao {

	public ArrayList<Chat> selectChatList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList");
	}

}
