package com.kh.apartmentor.vote.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VoteController {
	
	@RequestMapping("insert.vote")
	public String map() {
		return "vote/voteInsert";
	}
<<<<<<< HEAD
=======
	
	// 실제 넘어온 파일의 이름을 변경해서 서버에 업로드
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		// 날짜
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 5자리 랜덤값
		int ranNum = (int)(Math.random() * 90000) + 10000; 
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		// 수정된 첨부파일 명
		String changeName = currentTime + ranNum + ext;
		// 첨부파일 저장할 폴더의 물리적인 경로 
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		// 
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	@Scheduled(cron="1 00 00 * * ?")
	public void setVoteStatus() {
		int result = voteService.setVoteStatus();
		System.out.println("투표상태 업데이트 결과 :" + result + "개의 투표상태를 업데이트 하였습니다.");
	}
	
	@RequestMapping("detail.vote")
	public ModelAndView detailVist(ModelAndView mv, int vno) {
		
		Vote v = voteService.selectVote(vno);
		
		ArrayList<VoteItem> vi = voteService.selectVoteItem(vno);
		
		mv.addObject("v", v).setViewName("vote/voteDetail");
		mv.addObject("vi", vi).setViewName("vote/voteDetail");
		
		return mv;
	}
	
<<<<<<< HEAD
>>>>>>> parent of b1472ee (Merge branch 'main' of https://github.com/haveway/apartmentor)
=======
>>>>>>> parent of b1472ee (Merge branch 'main' of https://github.com/haveway/apartmentor)

}
