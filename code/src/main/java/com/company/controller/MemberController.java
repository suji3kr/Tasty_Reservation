package com.company.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private final MemberService memberService;
	private final PasswordEncoder passwordEncoder;

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
	public String signup(@ModelAttribute MemberDTO memberDTO, @RequestParam(required = false) String isAdmin,
			HttpSession session) {
		if (isAdmin != null) {
			memberDTO.setRole("admin");
		} else {
			memberDTO.setRole("user");
		}

		// 비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(memberDTO.getPassword());
		memberDTO.setPassword(encodedPassword);

		int saveResult = memberService.signup(memberDTO);

		if (saveResult > 0) {
			session.setAttribute("loginEmail", memberDTO.getEmail());
			session.setAttribute("loginUserName", memberDTO.getUsername());
			session.setAttribute("userRole", memberDTO.getRole());

			return "redirect:/";
		} else {
			return "/member/signup";
		}
	}

	@GetMapping("/login")
	public String loginForm() {
		return "/member/login";
	}

	@PostMapping("/login")
	public String login(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session, Model model) {

		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setEmail(email);

		// 로그인 시 비밀번호 확인
		MemberDTO loginResult = memberService.findByMemberEmail(email);
		if (loginResult != null && passwordEncoder.matches(password, loginResult.getPassword())) {
			session.setAttribute("loginEmail", loginResult.getEmail());
			session.setAttribute("loginUserName", loginResult.getUsername());
			session.setAttribute("userRole", loginResult.getRole());

			return "redirect:/";
		} else {
			model.addAttribute("errorMessage", "이메일 또는 비밀번호가 맞지 않습니다.");
			return "/member/login";
		}
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

	@PostMapping("/update")
	public String update(@ModelAttribute MemberDTO memberDTO, @RequestParam("currentPassword") String currentPassword,
			RedirectAttributes redirectAttributes, HttpSession session) {
		String loginEmail = (String) session.getAttribute("loginEmail");
		MemberDTO existingMember = memberService.findByMemberEmail(loginEmail);

		if (existingMember == null) {
			redirectAttributes.addFlashAttribute("errorMessage", "회원 정보를 찾을 수 없습니다.");
			return "redirect:/member/update";
		}

		// 현재 비밀번호 확인
		if (!passwordEncoder.matches(currentPassword, existingMember.getPassword())) {
			redirectAttributes.addFlashAttribute("errorMessage", "현재 비밀번호가 일치하지 않습니다.");
			return "redirect:/member/update";
		}

		// 기존 비밀번호 유지 (비밀번호 변경 없음)
		memberDTO.setPassword(existingMember.getPassword());

		boolean result = memberService.update(memberDTO);

		if (result) {
			redirectAttributes.addFlashAttribute("updateSuccess", "true"); // 수정 성공 메시지 추가
			return "redirect:/"; // 메인 페이지 또는 마이페이지로 리디렉트
		} else {
			return "/member/update";
		}
	}

	/*
	 * @PostMapping("/update") public String update(@ModelAttribute MemberDTO
	 * memberDTO, RedirectAttributes redirectAttributes) { boolean result =
	 * memberService.update(memberDTO); if (result) {
	 * redirectAttributes.addFlashAttribute("updateSuccess", true); return
	 * "redirect:/"; } else { return "/member/update"; } }
	 */

	@PostMapping("/email-check")
	public @ResponseBody String emailCheck(@RequestParam("email") String email) {
		return memberService.emailCheck(email);
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}