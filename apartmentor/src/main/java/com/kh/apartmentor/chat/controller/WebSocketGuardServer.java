package com.kh.apartmentor.chat.controller;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.apartmentor.member.model.vo.Member;

public class WebSocketGuardServer extends TextWebSocketHandler {

	
	// webSocket 연결 성공 시 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
	}

	// 메시지 
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// 인터셉터를 통해 HttpSession의 정보를 WebSocketSession에 담아왔기 때문에 접근해 사용 가능.
		Member loginUser = (Member)session.getAttributes().get("loginUser");
		
		TextMessage newMessage = new TextMessage(loginUser.getUserName() + "," + message.getPayload());
		
		session.sendMessage(newMessage);
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	
	}

}
