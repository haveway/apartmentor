package com.kh.apartmentor.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.apartmentor.chat.model.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	// 채팅 페이지로 포워딩
	@RequestMapping("chatForm.ch")
	public String chatForm() {
		return "chat/chatView";
	}
	
	
}
