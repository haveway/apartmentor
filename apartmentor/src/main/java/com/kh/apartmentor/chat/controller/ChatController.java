package com.kh.apartmentor.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.apartmentor.chat.model.service.ChatService;
import com.kh.apartmentor.chat.model.vo.Chat;


@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	// 주민채팅방 페이지로 포워딩
	@RequestMapping("chatForm.ch")
	public String chatForm(Model model) {
		// 주민채팅리스트 조회(chatCode=1)
		ArrayList<Chat> chatList = chatService.selectChatList();
		model.addAttribute("chatList", chatList);
		return "chat/chatView";
	}
	
	
	// 채팅내역 DB저장
	@ResponseBody
	@RequestMapping("insertChat.ch")
	public String insertChat(Chat c) {
		return chatService.insertChat(c) > 0 ? "success" : "fail";
	}
	
	
	
}
