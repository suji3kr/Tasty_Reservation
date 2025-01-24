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

import com.company.domain.MemberDTO;
import com.company.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member/*")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memberService;
	
	@GetMapping("/")
	public String findAll(Model model) {
		List<MemberDTO> memberDTOList = memberService.findAll();
		model.addAttribute("memberList", memberDTOList);
		return "/member/list";
	}
	
	@GetMapping("/signup")
	public String signupFrom() {
		return "/member/signup";
	}
	
	@PostMapping("/signup")
	public String signup(@ModelAttribute MemberDTO memberDTO) {
		int saveResult = memberService.signup(memberDTO);
		if(saveResult > 0) {
			return "/member/login";
		}else {
			return "/member/signup";
		}
		
	}
	
	@GetMapping("/login")
	public String loginForm() {
		return "/member/login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session)
	{
		boolean loginResult = memberService.login(memberDTO);
		if(loginResult) {
			session.setAttribute("loginEmail", memberDTO.getEmail());
			return "/member/main";
		}else {
			return "/member/login";
		}
	}
	
	// �긽�꽭議고쉶/member?id=1
	@GetMapping
	  public String findById(@RequestParam("id") Long id, Model model){
	    MemberDTO memberDTO = memberService.findById(id);
	    model.addAttribute("member", memberDTO);
	    return "/member/detail";
	  }
	
	@GetMapping("/delete")
	  public String delete(@RequestParam("id") Long id){
	    memberService.delete(id);
	    return "/";
	  }
	
	@GetMapping("/update")
	  public String updateForm(HttpSession session, Model model){
	    String loginEmail = (String)session.getAttribute("loginEmail");
	    MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
	    model.addAttribute("member", memberDTO);
	    return "/member/update";
	  }
	
	@PostMapping("/update")
		public String update(@ModelAttribute MemberDTO memberDTO ){
	    boolean result = memberService.update(memberDTO);
	    if(result) {
	    	return "redirect:/member?id= " + memberDTO.getId();
	    }else {
	    	return "/member/index";
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
		return "/member/logout";
	}
}
