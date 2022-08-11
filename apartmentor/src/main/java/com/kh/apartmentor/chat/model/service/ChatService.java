package com.kh.apartmentor.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.apartmentor.chat.model.dao.ChatDao;
import com.kh.apartmentor.chat.model.vo.Chat;

@Service
public class ChatService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao chatDao;

	public ArrayList<Chat> selectChatList() {
		return chatDao.selectChatList(sqlSession);
	}

}
