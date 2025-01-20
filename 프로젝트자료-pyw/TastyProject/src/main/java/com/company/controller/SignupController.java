package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.company.dto.SignupForm;
import com.company.service.UserService;

@Controller
public class SignupController {

    @Autowired
    private UserService userService;

    @GetMapping("/signup")
    public ModelAndView showSignupForm() {
        ModelAndView mav = new ModelAndView("signup");
        mav.addObject("signupForm", new SignupForm());
        return mav;
    }

    @PostMapping("/signup")
    public ModelAndView processSignup(@Validated @ModelAttribute("signupForm") SignupForm signupForm, BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("signup");
        }

        userService.saveUser(signupForm);

        return new ModelAndView("redirect:/login");
    }
}