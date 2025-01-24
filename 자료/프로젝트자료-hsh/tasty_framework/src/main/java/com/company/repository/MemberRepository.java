package com.company.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.company.dto.MemberDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberRepository {
	
	private final SqlSessionTemplate sql;
	
	public int save(MemberDTO memberDTO) {
		System.out.println("memberDTO=" + memberDTO);
		return sql.insert("Member.save", memberDTO);
	}

	public MemberDTO login(MemberDTO memberDTO) {
		return sql.selectOne("Member.login", memberDTO);
	}

	 public List<MemberDTO> findAll() {
		    return sql.selectList("Member.findAll");
	}

	 public MemberDTO findById(Long id) {
		    return sql.selectOne("Member.findById", id);
		  }

	public void delete(Long id) {
		sql.delete("Member.delete", id);
	}

	public MemberDTO findByMemberEmail(String loginEmail) {
		return sql.selectOne("Member.findByMemberEmail", loginEmail);
	}

	public int update(MemberDTO memberDTO) {
		return sql.update("Member.update", memberDTO);
	}
	

}
