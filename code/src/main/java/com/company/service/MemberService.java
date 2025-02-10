package com.company.service;

import java.util.List;

import org.springframework.stereotype.Service;

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

	public MemberDTO login(MemberDTO memberDTO) {
		return memberRepository.login(memberDTO);
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
		if(result >0) {
			return true;
		}else {
			return false;
		}
		
	}

	public String emailCheck(String email) {
		MemberDTO memberDTO = memberRepository.findByMemberEmail(email);
		if(memberDTO == null) {
			return "ok";
		}else {
			return "no";
		}
		
	}

}
