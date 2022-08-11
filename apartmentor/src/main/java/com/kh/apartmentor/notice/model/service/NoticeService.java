package com.kh.apartmentor.notice.model.service;

import java.util.ArrayList;

import com.kh.apartmentor.common.model.vo.PageInfo;
import com.kh.apartmentor.notice.model.vo.Notice;
import com.kh.apartmentor.visit.model.vo.Visit;

public interface NoticeService {
	
	// 공지사항 입력
	int insertNotice(Notice n);
	
	// 공지사항 총 게시글 수 
	int selectListCount();
	
	// 공지사항 조회
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 공지사항 말머리 별 게시글 수
	int selectCategoryListCount(String category);
	
	// 공지사항 말머리 별 게시글 조회
	ArrayList<Notice> selectCategoryList(String category, PageInfo pi);
	

}
