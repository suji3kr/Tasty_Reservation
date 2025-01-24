package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ranking")
public class RankingController {
	
	@GetMapping("/ranking1")
	public String getRanking1() {
		return "/ranking/ranking1"; // view 이름
	}
	
	@GetMapping("/ranking2")
	public String getRanking2() {
		return "/ranking/ranking2"; // view 이름
	}
	
	@GetMapping("/ranking3")
	public String getRanking3() {
		return "/ranking/ranking3"; // view 이름
	}

}

