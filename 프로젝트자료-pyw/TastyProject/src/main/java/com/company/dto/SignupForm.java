package com.company.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SignupForm {

    private String username;
    private String password;
    private String email;
    private String phone;
    private String gender;

    // 기본 생성자
    public SignupForm() {
    }
}