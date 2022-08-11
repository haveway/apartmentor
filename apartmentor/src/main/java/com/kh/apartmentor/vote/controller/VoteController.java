package com.kh.apartmentor.vote.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VoteController {
	
	@RequestMapping("insert.vote")
	public String map() {
		return "vote/voteInsert";
	}

}
