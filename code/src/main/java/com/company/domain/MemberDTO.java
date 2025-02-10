package com.company.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
	    private Long id;
	    private String username;
	    private String password;
	    private String email;
	    private String phone;
	    private int age;
	    private String gender;
	    private String role;  // ✅ 역할 필드 추가 (admin, user 등)
	    
	    // 기본 생성자
	    public MemberDTO() {}

	    // 필요한 생성자
	    public MemberDTO(String email, String password) {
	        this.email = email;
	        this.password = password;
	    }

	    // ✅ Getter & Setter 추가
	    public String getRole() {
	        return role;
	    }

	    public void setRole(String role) {
	        this.role = role;
	    }
}
