package com.company.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.company.domain.MemberDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberRepository {
	
	private final SqlSessionTemplate sql;
	
	public int signup(MemberDTO memberDTO) {
		System.out.println("memberDTO=" + memberDTO);
		return sql.insert("member.signup", memberDTO);
	}

	public MemberDTO login(MemberDTO memberDTO) {
		return sql.selectOne("member.login", memberDTO);
	}

	 public List<MemberDTO> findAll() {
		    return sql.selectList("member.findAll");
	}

	 public MemberDTO findById(Long id) {
		    return sql.selectOne("member.findById", id);
		  }

	public void delete(Long id) {
		sql.delete("member.delete", id);
	}

	public MemberDTO findByMemberEmail(String loginEmail) {
		return sql.selectOne("member.findByMemberEmail", loginEmail);
	}

	public int update(MemberDTO memberDTO) {
		return sql.update("member.update", memberDTO);
	}
	

}
