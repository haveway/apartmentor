package com.kh.apartmentor.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.apartmentor.board.model.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("list.bo")
	public String selectList() {
		
		
		
		return "board/boardListView";
	}
	
	
	
	
	
	
	
	
	
	
	
}
