package com.kh.apartmentor.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.apartmentor.chat.model.service.ChatService;
import com.kh.apartmentor.chat.model.vo.Chat;


@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	// 채팅 페이지로 포워딩
	@RequestMapping("chatForm.ch")
	public String chatForm(Model model) {
		
		ArrayList<Chat> chatList = chatService.selectChatList();
		model.addAttribute("chatList", chatList);
		return "chat/chatView";
	}
	
	
}
