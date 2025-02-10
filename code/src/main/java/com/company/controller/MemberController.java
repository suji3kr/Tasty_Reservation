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

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
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
	public String signup(@ModelAttribute MemberDTO memberDTO, 
	                     @RequestParam(required = false) String isAdmin, 
	                     HttpSession session) {
	    
	    // 관리자 체크 여부 확인 후 역할(role) 설정
	    if (isAdmin != null) {
	        memberDTO.setRole("admin");
	    } else {
	        memberDTO.setRole("user");
	    }

	    // 회원가입 처리
	    int saveResult = memberService.signup(memberDTO);

	    if (saveResult > 0) {
	        // 회원가입 성공 시 자동 로그인 처리
	        session.setAttribute("loginEmail", memberDTO.getEmail());
	        session.setAttribute("loginUserName", memberDTO.getUsername());
	        session.setAttribute("userRole", memberDTO.getRole());  // 역할 저장

	        // 디버깅 로그 출력
	        System.out.println("회원가입 완료 - 역할: " + memberDTO.getRole());
	        System.out.println("세션에 저장된 로그인 이메일: " + session.getAttribute("loginEmail"));
	        System.out.println("세션에 저장된 로그인 이름: " + session.getAttribute("loginUserName"));
	        System.out.println("세션에 저장된 사용자 역할: " + session.getAttribute("userRole"));

	        return "redirect:/";  // 회원가입 후 메인 페이지로 이동
	    } else {
	        return "/member/signup";  // 회원가입 실패 시 다시 회원가입 페이지로 이동
	    }
	}


	@GetMapping("/login")
	public String loginForm() {
		return "/member/login";
	}

	@PostMapping("/login")
	public String login(
	        @RequestParam("email") String email,
	        @RequestParam("password") String password,
	        HttpSession session,
	        Model model) {

		MemberDTO memberDTO = new MemberDTO();
	    memberDTO.setEmail(email);
	    memberDTO.setPassword(password);
	    
	    MemberDTO loginResult = memberService.login(memberDTO, session, model);

	    if (loginResult != null) {
	        // 세션에 로그인 정보 저장
	        session.setAttribute("loginEmail", loginResult.getEmail());
	        session.setAttribute("loginUserName", loginResult.getUsername());

	        // 사용자 역할(role) 저장 (예: "admin" 또는 "user")
	        session.setAttribute("userRole", loginResult.getRole());

	        // 디버깅 로그 출력
	        System.out.println("세션에 저장된 로그인 이메일: " + session.getAttribute("loginEmail"));
	        System.out.println("세션에 저장된 로그인 이름: " + session.getAttribute("loginUserName"));
	        System.out.println("세션에 저장된 사용자 역할: " + session.getAttribute("userRole"));
	        System.out.println("로그인되었습니다.");

	        return "redirect:/";  // 로그인 성공 시 메인 페이지로 이동
	    } else {
	        // 로그인 실패 시 에러 메시지 추가 후 로그인 페이지로 이동
	        model.addAttribute("errorMessage", "이메일 또는 비밀번호가 맞지 않습니다.");
	        return "/member/login";
	    }
	}



	@GetMapping
	public String findById(@RequestParam("id") Long id, Model model) {
		MemberDTO memberDTO = memberService.findById(id);
		model.addAttribute("member", memberDTO);
		return "/member/detail";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("id") Long id) {
		memberService.delete(id);
		return "redirect:/";
	}

	@GetMapping("/update")
	public String updateForm(HttpSession session, Model model) {
		String loginEmail = (String) session.getAttribute("loginEmail");
		MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
		model.addAttribute("member", memberDTO);
		return "/member/update";
	}
	/*
	 * @PostMapping("/update") public String update(@ModelAttribute MemberDTO
	 * memberDTO, RedirectAttributes redirectAttributes) { boolean result =
	 * memberService.update(memberDTO); if (result) {
	 * 
	 * System.out.println("수정완료되었습니다."); // 업데이트 성공을 나타내는 플래시 속성 추가
	 * redirectAttributes.addFlashAttribute("updateSuccess", true); // 홈페이지로 리다이렉트
	 * return "redirect:/"; } else { // 업데이트 실패 시 멤버 인덱스 페이지로 돌아감 return
	 * "/member/index"; } }
	 */

	@PostMapping("/update")
	public String update(@ModelAttribute MemberDTO memberDTO, RedirectAttributes redirectAttributes) {
		boolean result = memberService.update(memberDTO);
		if (result) {
			System.out.println("수정완료되었습니다."); // 업데이트 성공을 나타내는 플래시 속성 추가
			redirectAttributes.addFlashAttribute("updateSuccess", true);
			// 홈페이지로 리다이렉트
			return "redirect:/";} 
		else {
			System.out.println("수정실패하였습니다."); // 업데이트 실패를 나타내는 콘솔 로그 추가
			// 업데이트 실패 시 멤버 업데이트 페이지로 돌아감 return
			return "/member/update";
		}
	}

	@PostMapping("/email-check")
	public @ResponseBody String emailCheck(@RequestParam("email") String email) {
		System.out.println("email = " + email);
		String checkResult = memberService.emailCheck(email);
		return checkResult;
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/";
	}

}
