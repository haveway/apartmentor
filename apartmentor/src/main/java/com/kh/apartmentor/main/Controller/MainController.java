package com.kh.apartmentor.main.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.apartmentor.board.model.vo.Board;
import com.kh.apartmentor.main.model.Service.MainService;
import com.kh.apartmentor.notice.vo.Notice;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("main.do")
	public String main(Model m) {
		
		ArrayList<Board> bList = mainService.boardList();
		ArrayList<Notice> nList = mainService.noticeList();
		
		m.addAttribute("bList",bList);
		m.addAttribute("nList",nList);
		return "main";
	}
}
