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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			System.out.println("로그인되었습니다.");
			return "redirect:/";
		}else {
			return "/member/login";
		}
	}
	
	@GetMapping
	  public String findById(@RequestParam("id") Long id, Model model){
	    MemberDTO memberDTO = memberService.findById(id);
	    model.addAttribute("member", memberDTO);
	    return "/member/detail";
	  }
	
	@GetMapping("/delete")
	  public String delete(@RequestParam("id") Long id){
	    memberService.delete(id);
	    return "redirect:/";
	  }
	
	@GetMapping("/update")
	  public String updateForm(HttpSession session, Model model){
	    String loginEmail = (String)session.getAttribute("loginEmail");
	    MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
	    model.addAttribute("member", memberDTO);	
	    return "/member/update";
	  }
	
//	@PostMapping("/update")
//		public String update(@ModelAttribute MemberDTO memberDTO ){
//	    boolean result = memberService.update(memberDTO);
//	    if(result) {
//			/* return "redirect:/member?id= " + memberDTO.getId(); */
//	    	return "redirect:/";
//	    }else {
//	    	return "/member/index";
//	    }
//	  }
	
	@PostMapping("/update")
	public String update(@ModelAttribute MemberDTO memberDTO, RedirectAttributes redirectAttributes) {
	    boolean result = memberService.update(memberDTO);
	    if (result) {
	    	
	    	System.out.println("수정완료되었습니다.");
	        // 업데이트 성공을 나타내는 플래시 속성 추가
	        redirectAttributes.addFlashAttribute("updateSuccess", true);
	        // 홈페이지로 리다이렉트
	        return "redirect:/";
	    } else {
	        // 업데이트 실패 시 멤버 인덱스 페이지로 돌아감
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
