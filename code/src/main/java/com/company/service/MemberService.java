package com.company.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.company.domain.MemberDTO;

public interface MemberService {

	int signup(MemberDTO memberDTO);
	MemberDTO login(MemberDTO memberDTO, HttpSession session, Model model);
    List<MemberDTO> findAll();
    MemberDTO findById(Long id);
    void delete(Long id);
    MemberDTO findByMemberEmail(String loginEmail);
    boolean update(MemberDTO memberDTO);
    String emailCheck(String email);
}
