package com.company.controller;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.MemberDTO;
import com.company.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { 
    "file:src/main/webapp/WEB-INF/spring/root-context.xml",
    "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
    "file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
public class MemberControllerTests {

    @Mock
    private MemberService memberService; 

    @Mock
    private PasswordEncoder passwordEncoder;

    @InjectMocks
    private MemberController memberController; 

    @Before
    public void setup() {
        MockitoAnnotations.initMocks(this);
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
        SecurityContextHolder.getContext().setAuthentication(
            new UsernamePasswordAuthenticationToken("testUser", "password", 
                Arrays.asList(new SimpleGrantedAuthority("ROLE_USER")))
        );

        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setEmail("test@example.com");
        memberDTO.setPassword("password");

        HttpSession session = mock(HttpSession.class);
        when(passwordEncoder.encode(anyString())).thenReturn("encodedPassword");
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
        loginUser.setPassword("encodedPassword");
        loginUser.setUsername("Test User");
        loginUser.setRole("user");

        when(memberService.findByMemberEmail(anyString())).thenReturn(loginUser);
        when(passwordEncoder.matches(anyString(), anyString())).thenReturn(true);

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

    /** ✅ 회원 정보 수정 처리 테스트 (비밀번호 확인 로직 반영) */
    @Test
    public void testUpdate() {
        // ✅ 인증된 사용자 추가
        SecurityContextHolder.getContext().setAuthentication(
            new UsernamePasswordAuthenticationToken("testUser", "password", 
                Arrays.asList(new SimpleGrantedAuthority("ROLE_USER")))
        );

        HttpSession session = mock(HttpSession.class);
        when(session.getAttribute("loginEmail")).thenReturn("test@example.com");

        MemberDTO existingMember = new MemberDTO();
        existingMember.setEmail("test@example.com");
        existingMember.setPassword("encodedPassword");

        when(memberService.findByMemberEmail(anyString())).thenReturn(existingMember);
        when(passwordEncoder.matches(anyString(), anyString())).thenReturn(true);
        when(memberService.update(any(MemberDTO.class))).thenReturn(true);

        RedirectAttributes redirectAttributes = mock(RedirectAttributes.class);
        MemberDTO updatedMember = new MemberDTO();
        updatedMember.setEmail("test@example.com");

        String result = memberController.update(updatedMember, "password", redirectAttributes, session);
        assertEquals("redirect:/", result);
        verify(memberService, times(1)).update(any(MemberDTO.class));
        verify(redirectAttributes, times(1)).addFlashAttribute("updateSuccess", "true");
    }

    /** ✅ 로그아웃 테스트 */
    @Test
    public void testLogout() {
        HttpSession session = mock(HttpSession.class);
        String result = memberController.logout(session);
        assertEquals("redirect:/", result);
        verify(session, times(1)).invalidate();
    }

    /** ✅ 이메일 중복 확인 테스트 */
    @Test
    public void testEmailCheck() {
        when(memberService.emailCheck(anyString())).thenReturn("available");

        String response = memberController.emailCheck("test@example.com");
        assertEquals("available", response);
        verify(memberService, times(1)).emailCheck("test@example.com");
    }
}
