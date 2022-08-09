package com.kh.apartmentor.main.model.Service;

import java.util.ArrayList;

import com.kh.apartmentor.board.model.vo.Board;
import com.kh.apartmentor.notice.vo.Notice;

public interface MainService {
	
	// 자유게시판
	ArrayList<Board> boardList();
	
	// 공지
	ArrayList<Notice> noticeList();

	

}
