package com.company.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.company.domain.MemberDTO;
import com.company.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
    
    private final MemberRepository memberRepository;
    
    public int signup(MemberDTO memberDTO) {
        return memberRepository.signup(memberDTO);
    }

    public MemberDTO login(MemberDTO memberDTO, HttpSession session, Model model) {
        // 기존 findByEmailAndPassword() 대신 login() 메서드 사용
        MemberDTO loginResult = memberRepository.login(memberDTO);

        if (loginResult != null) {
            session.setAttribute("loginEmail", loginResult.getEmail());
            session.setAttribute("loginUserName", loginResult.getUsername());

            // ✅ Null 체크 후 기본값 설정
            String role = (loginResult.getRole() != null) ? loginResult.getRole() : "user";
            session.setAttribute("userRole", role);

            System.out.println("세션에 저장된 사용자 역할: " + session.getAttribute("userRole"));
            return loginResult;  // 로그인 성공 시 MemberDTO 반환
        } else {
            model.addAttribute("errorMessage", "이메일 또는 비밀번호가 맞지 않습니다.");
            return null;  // 로그인 실패 시 null 반환
        }
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }

    public MemberDTO findByMemberEmail(String loginEmail) {
        return memberRepository.findByMemberEmail(loginEmail);
    }

    public boolean update(MemberDTO memberDTO) {
        int result = memberRepository.update(memberDTO);
        return result > 0;
    }

    public String emailCheck(String email) {
        MemberDTO memberDTO = memberRepository.findByMemberEmail(email);
        return (memberDTO == null) ? "ok" : "no";
    }
}
