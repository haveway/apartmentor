package com.kh.apartmentor.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.apartmentor.board.model.service.BoardService;
import com.kh.apartmentor.board.model.vo.Board;
import com.kh.apartmentor.board.model.vo.Reply;
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
	
	// 상세보기페이지 댓글 조회
	@ResponseBody
	@RequestMapping(value="replyList.bo", produces="application/json; charset=UTF-8")
	public String selectReplyList(int bno) {
		ArrayList<Reply> list = boardService.selectReplyList(bno);
		
		return new Gson().toJson(list);
	}
	
	// 제목 키워드 검색 조회
	@RequestMapping("search.bo")
	public String searchBoard(@RequestParam(value="cpage", defaultValue="1") int currentPage, String keyword, Model model) {
		
		// 검색한 게시글의 총 갯수로 검색결과에 따른 페이징바 다시 만들기
		PageInfo pi = Pagination.getPageInfo(boardService.selectSearchCount(keyword), currentPage, 10, 5);
		
		// 페이징바로 나눌 검색결과에 따른 리스트 조회 
		ArrayList<Board> list = boardService.selectSearchList(keyword, pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("keyword", keyword);
		return "board/boardListView";
	}
	
}
