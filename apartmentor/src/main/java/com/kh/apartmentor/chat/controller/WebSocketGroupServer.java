package com.kh.apartmentor.chat.controller;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.apartmentor.chat.model.service.ChatService;
import com.kh.apartmentor.member.model.vo.Member;


/*
 * 접속한 사용자를 기억해두고 모두에 대한 처리를 수행하는 서버
 * 
 */

@Controller
public class WebSocketGroupServer extends TextWebSocketHandler {
	
	// 채팅내역 저장
	@Autowired
	private ChatService chatService;

	private Set<WebSocketSession> users = new CopyOnWriteArraySet<WebSocketSession>();

	
	
	// webSocket 연결 성공 시 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);
		System.out.println("사용자 접속! : 현재 : " + users.size() + "명");
		
	}

	
	// 메시지 
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Member loginUser = (Member)session.getAttributes().get("loginUser");
		
		TextMessage newMessage = new TextMessage(loginUser.getUserName() + " : " + message.getPayload());
		for(WebSocketSession ws : users) {
			ws.sendMessage(newMessage);
		}
	
	
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
		System.out.println("사용자 종료! 현재 : " + users.size() + "명");
	}

	
}
