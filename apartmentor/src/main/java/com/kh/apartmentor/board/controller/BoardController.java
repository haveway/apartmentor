package com.kh.apartmentor.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.apartmentor.board.model.service.BoardService;
import com.kh.apartmentor.board.model.vo.Board;
import com.kh.apartmentor.common.model.vo.PageInfo;
import com.kh.apartmentor.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	// 게시글 조회 
	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		// 페이징바 처리
		PageInfo pi = Pagination.getPageInfo(boardService.selectListCount(), currentPage, 10, 5);
		
		ArrayList<Board> list = boardService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "board/boardListView";
	}
	
	// 게시글 상세조회
	@RequestMapping("detail.bo")
	public String selectBoard(int bno, Model model) {
		
		// 해당 게시글 조회수 증가
		int result = boardService.increaseCount(bno);
		
		// 해당 게시글 상세조회
		if(result > 0) { // 게시글 조회수 증가 성공
			Board b = boardService.selectBoard(bno);
			model.addAttribute("b", b);
			return "board/boardDetailView";
		} else { // 게시글 조회수 증가 실패
			return "redirect:/";
		}
		
	}
	
	
	
	
	
	
	
	
}
