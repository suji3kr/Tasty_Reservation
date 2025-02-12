package com.company.controller;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.MemberDTO;
import com.company.service.MemberService;

public class MemberControllerTests {

    @Mock
    private MemberService memberService;  // ✅ Mock 객체 생성

    @InjectMocks
    private MemberController memberController;  // ✅ Controller에 Mock 주입

    @Before
    public void setup() {
        MockitoAnnotations.initMocks(this);  // ✅ Mockito 초기화
    }

    /** ✅ 전체 회원 조회 테스트 */
    @Test
    public void testFindAll() {
        List<MemberDTO> mockMemberList = Arrays.asList(new MemberDTO(), new MemberDTO());

        when(memberService.findAll()).thenReturn(mockMemberList);

        Model model = mock(Model.class);
        String result = memberController.findAll(model);

        assertEquals("/member/list", result);
        verify(memberService, times(1)).findAll();
        verify(model, times(1)).addAttribute(eq("memberList"), any());
    }

    /** ✅ 회원가입 처리 테스트 */
    @Test
    public void testSignup() {
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setEmail("test@example.com");

        HttpSession session = mock(HttpSession.class);
        when(memberService.signup(any(MemberDTO.class))).thenReturn(1);

        String result = memberController.signup(memberDTO, null, session);
        assertEquals("redirect:/", result);
        verify(session, times(1)).setAttribute(eq("loginEmail"), anyString());
    }

    /** ✅ 로그인 처리 테스트 (성공) */
    @Test
    public void testLoginSuccess() {
        String email = "test@example.com";
        HttpSession session = mock(HttpSession.class);
        Model model = mock(Model.class);

        MemberDTO loginUser = new MemberDTO();
        loginUser.setEmail(email);
        loginUser.setUsername("Test User");
        loginUser.setRole("user");

        when(memberService.login(any(MemberDTO.class), eq(session), eq(model))).thenReturn(loginUser);

        String result = memberController.login(email, "password", session, model);
        assertEquals("redirect:/", result);
        verify(session, times(1)).setAttribute("loginEmail", email);
    }

    /** ✅ 회원 삭제 테스트 */
    @Test
    public void testDelete() {
        doNothing().when(memberService).delete(1L);

        String result = memberController.delete(1L);
        assertEquals("redirect:/", result);
        verify(memberService, times(1)).delete(1L);
    }

    /** ✅ 회원 정보 수정 처리 테스트 */
    @Test
    public void testUpdate() {
        MemberDTO memberDTO = new MemberDTO();
        RedirectAttributes redirectAttributes = mock(RedirectAttributes.class);

        when(memberService.update(memberDTO)).thenReturn(true);

        String result = memberController.update(memberDTO, redirectAttributes);
        assertEquals("redirect:/", result);
        verify(redirectAttributes, times(1)).addFlashAttribute("updateSuccess", true);
    }

    /** ✅ 로그아웃 테스트 */
    @Test
    public void testLogout() {
        HttpSession session = mock(HttpSession.class);
        String result = memberController.logout(session);
        assertEquals("redirect:/", result);
        verify(session, times(1)).invalidate();
    }
}
