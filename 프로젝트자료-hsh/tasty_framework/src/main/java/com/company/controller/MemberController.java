package com.company.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.dto.MemberDTO;
import com.company.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memberService;
	
	@GetMapping("/")
	public String findAll(Model model) {
		List<MemberDTO> memberDTOList = memberService.findAll();
		model.addAttribute("memberList", memberDTOList);
		return "list";
	}
	
	@GetMapping("/save")
	public String saveFrom() {
		return "save";
	}
	
	@PostMapping("/save")
	public String save(@ModelAttribute MemberDTO memberDTO) {
		int saveResult = memberService.save(memberDTO);
		if(saveResult > 0) {
			return "login";
		}else {
			return "save";
		}
		
	}
	
	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session)
	{
		boolean loginResult = memberService.login(memberDTO);
		if(loginResult) {
			session.setAttribute("username", memberDTO.getUsername());
			return "main";
		}else {
			return "login";
		}
	}
	
	// 상세조회/member?id=1
	@GetMapping
	  public String findById(@RequestParam("id") Long id, Model model){
	    MemberDTO memberDTO = memberService.findById(id);
	    model.addAttribute("member", memberDTO);
	    return "detail";
	  }
	
	@GetMapping("/delete")
	  public String delete(@RequestParam("id") Long id){
	    memberService.delete(id);
	    return "redirect:/member/";
	  }
	
	@GetMapping("/update")
	  public String updateForm(HttpSession session, Model model){
	    String loginEmail = (String)session.getAttribute("loginEmail");
	    MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
	    model.addAttribute("member", memberDTO);
	    return "update";
	  }
	@PostMapping("/update")
		public String update(@ModelAttribute MemberDTO memberDTO ){
	    boolean result = memberService.update(memberDTO);
	    if(result) {
	    	return "redirect:/member?id=" + memberDTO.getId();
	    }else {
	    	return "index";
	    }
	  }
	
	@PostMapping("/email-check")
	  public @ResponseBody String emailCheck(@RequestParam("email") String email){
	    System.out.println("email = " + email);
	    String checkResult = memberService.emailCheck(email);
	    return checkResult;
	  }
	
	@GetMapping("/logout")
	public String logout() {
		return "logout";
	}
}
