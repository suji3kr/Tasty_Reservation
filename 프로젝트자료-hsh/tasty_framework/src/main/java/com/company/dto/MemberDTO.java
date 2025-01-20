package com.company.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
	    private int id;
	    private String username;
	    private String password;
	    private String email;
	    private String phone;
	    private int age;
	    private String gender;
}
