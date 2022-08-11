package com.kh.apartmentor.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.apartmentor.common.model.vo.PageInfo;
import com.kh.apartmentor.common.template.Pagination;
import com.kh.apartmentor.notice.model.service.NoticeService;
import com.kh.apartmentor.notice.model.vo.Notice;
import com.kh.apartmentor.visit.model.vo.Visit;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 공지사항 추가 메소드
	 */
	@RequestMapping("insert.notice")
	public String insertNotice(Notice n, MultipartFile upfile, HttpSession session, Model model) {
	
		if(!upfile.getOriginalFilename().equals("")) { // 전달될 파일이 있을 경우
			
			String changeName = saveFile(upfile, session);
			
			n.setOriginName(upfile.getOriginalFilename());
			n.setChangeName("resources/uploadFiles/" + changeName);
			
		}
		
		int result = noticeService.insertNotice(n); 
		
		if(result > 0) { // 성공 => 목록 페이지로
			session.setAttribute("alertMsg2", "공지 작성에 성공하셨습니다");
			return "redirect:list.notice";
		} else { // 실패 => 작성 페이지 다시 보여주기
			model.addAttribute("alertMsg1", "공지 작성에 실패하셨습니다");
			return "redirect:enrollForm.notice";
		}
		
	}
	

	/**
	 * 실제 넘어온 파일을 변경해서 서버에 업로드 해주는 메소드
	 */
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename(); 
		
		// 년월일시분초
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 5자리 랜덤값
		int ranNum = (int)(Math.random() * 90000) + 10000;
		
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로를 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	
	/**
	 * 공지사항 목록 페이지로 이동하는 메소드
	 */
	@RequestMapping("list.notice")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(noticeService.selectListCount(), currentPage, 5, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list",noticeService.selectList(pi))
		  .setViewName("notice/noticeListView");
		
		return mv;
	}
	
	/**
	 * 공지사항 목록 페이지 - 공지 종류
	 */
	@RequestMapping("categoryList.notice")
	public String selectCategoryList(@RequestParam(value="cpage", defaultValue="1")int currentPage, String category, Model model) {
		
		PageInfo pi = Pagination.getPageInfo(noticeService.selectCategoryListCount(category), currentPage, 5, 10);
		
		ArrayList<Notice> list = noticeService.selectCategoryList(category, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		
		
		return "notice/noticeListView";
		
	}
	

	/**
	 * 공지사항 작성 페이지로 이동하는 메소드
	 */
	@RequestMapping("enrollForm.notice")
	public String enrollFormNotice() {
		return "notice/noticeEnrollForm";
	}

	
		
}
