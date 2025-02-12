package com.company.controller;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
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
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.domain.StoreDTO;
import com.company.service.BoardService;
import com.company.service.StoreService;

@RunWith(org.mockito.junit.MockitoJUnitRunner.class)  // ✅ JUnit 실행 설정
public class BoardControllerTests {

    @Mock
    private BoardService boardService;

    @Mock
    private StoreService storeService;

    @InjectMocks
    private BoardController boardController;

    @Before
    public void setup() {
        MockitoAnnotations.initMocks(this);  // ✅ Mockito 초기화
    }

    /** ✅ 게시글 목록 조회 테스트 */
    @Test
    public void testList() {
        Criteria cri = new Criteria();
        List<BoardVO> mockBoardList = Arrays.asList(new BoardVO(), new BoardVO());

        when(boardService.getList(cri)).thenReturn(mockBoardList);
        when(boardService.getTotal(cri)).thenReturn(10);

        Model model = mock(Model.class);
        boardController.list(cri, model);

        verify(boardService, times(1)).getList(cri);
        verify(boardService, times(1)).getTotal(cri);
        verify(model, times(1)).addAttribute(eq("list"), any());
        verify(model, times(1)).addAttribute(eq("pageMaker"), any());
    }

    /** ✅ 게시글 등록 테스트 */
    @Test
    public void testRegister() {
        BoardVO board = new BoardVO();
        board.setBno(1L);
        board.setTitle("테스트 제목");
        board.setContent("테스트 내용");

        doNothing().when(boardService).register(board);

        RedirectAttributes rttr = mock(RedirectAttributes.class);
        String result = boardController.register(board, rttr);

        assertEquals("redirect:/board/list", result);
        verify(boardService, times(1)).register(board);
    }

    /** ✅ 게시글 상세 조회 테스트 */
    @Test
    public void testGet() {
        BoardVO board = new BoardVO();
        board.setBno(1L);
        board.setTitle("테스트 제목");

        when(boardService.get(1L)).thenReturn(board);

        Model model = mock(Model.class);
        Criteria cri = new Criteria();
        String result = boardController.get(1L, cri, model);

        assertEquals("board/modify", result);
        verify(boardService, times(1)).get(1L);
        verify(model, times(1)).addAttribute(eq("board"), any());
    }

    /** ✅ 게시글 수정 테스트 */
    @Test
    public void testModify() {
        BoardVO board = new BoardVO();
        board.setBno(1L);
        board.setTitle("수정된 제목");

        when(boardService.modify(board)).thenReturn(true);

        RedirectAttributes rttr = mock(RedirectAttributes.class);
        Criteria cri = new Criteria();
        String result = boardController.modify(board, cri, rttr);

        assertEquals("redirect:/board/list", result);
        verify(boardService, times(1)).modify(board);
    }

    /** ✅ 게시글 삭제 테스트 */
    @Test
    public void testRemove() {
        when(boardService.remove(1L)).thenReturn(true);

        RedirectAttributes rttr = mock(RedirectAttributes.class);
        Criteria cri = new Criteria();
        String result = boardController.remove(1L, cri, rttr);

        assertEquals("redirect:/board/list", result);
        verify(boardService, times(1)).remove(1L);
    }

    /** ✅ 즐겨찾는 맛집 페이지 테스트 */
    @Test
    public void testFavFoodPage() {
        String result = boardController.getFavFood();
        assertEquals("/board/favfood", result);
    }

    /** ✅ 우리가게 추천 리스트 테스트 */
    @Test
    public void testFavFoodAdminPage() {
        String result = boardController.getFavFood_admin();
        assertEquals("/board/favfood_admin", result);
    }

    /** ✅ 가족 단체 예약 페이지 테스트 */
    @Test
    public void testFamilyReservation() {
        Criteria cri = new Criteria(1, 10);
        List<StoreDTO> mockStoreList = Arrays.asList(new StoreDTO(), new StoreDTO());

        when(storeService.getList(cri)).thenReturn(mockStoreList);
        when(storeService.getTotal(cri)).thenReturn(20);

        Model model = mock(Model.class);
        String result = boardController.familyReservation(1, 10, null, null, model);

        assertEquals("/board/familyreservation", result);
        verify(storeService, times(1)).getList(cri);
        verify(storeService, times(1)).getTotal(cri);
    }

    /** ✅ 예약 관리 페이지 (관리자) 테스트 */
    @Test
    public void testReservationAdminPage() {
        String result = boardController.showReservationAdminPage(null);
        assertEquals("/board/reservation_admin", result);
    }

    /** ✅ 예약 관리 페이지 (사용자) 테스트 */
    @Test
    public void testReservationUserPage() {
        String result = boardController.reservationUser();
        assertEquals("/board/reservation_user", result);
    }

    /** ✅ 로그인한 사용자에 따른 예약 관리 페이지 이동 테스트 */
    @Test
    public void testReservation() {
        HttpSession session = mock(HttpSession.class);
        when(session.getAttribute("userRole")).thenReturn("admin");

        String result = boardController.reservation(session);
        assertEquals("redirect:/board/reservation_admin", result);

        when(session.getAttribute("userRole")).thenReturn("user");
        result = boardController.reservation(session);
        assertEquals("redirect:/board/reservation_user", result);
    }
}
