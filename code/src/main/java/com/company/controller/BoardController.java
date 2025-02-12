package com.company.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.domain.PageDTO;
import com.company.domain.ReservationDTO;
import com.company.domain.StoreDTO;
import com.company.service.BoardService;
import com.company.service.ReservationService;
import com.company.service.StoreService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

<<<<<<< Updated upstream
    private BoardService service;
    private BoardService boardservice;
    private StoreService storeService;
    private ReservationService reservationService;
=======
    private final BoardService boardService;
    private final StoreService storeService;
>>>>>>> Stashed changes

    /** ✅ 게시글 목록 조회 */
    @GetMapping("/list")
    public void list(Criteria cri, Model model) {
        log.info("list: " + cri);
        model.addAttribute("list", boardService.getList(cri));
        int total = boardService.getTotal(cri);
        log.info("total: " + total);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
    }

    /** ✅ 게시글 등록 처리 */
    @PostMapping(value = "/register", consumes = "application/json")
    public String register(@RequestBody BoardVO vo, RedirectAttributes rttr) {
        log.info("register......." + vo);
        boardService.register(vo);
        rttr.addFlashAttribute("result", vo.getBno());
        return "redirect:/board/list";
    }

    /** ✅ 게시글 상세 조회 & 수정 페이지 */
    @GetMapping({ "/get", "/modify" })
    public String get(@RequestParam(name = "bno", required = false) Long bno, 
                      @ModelAttribute("cri") Criteria cri, 
                      Model model, RedirectAttributes rttr) {
        log.info("/get or modify");
        if (bno == null) {
            rttr.addFlashAttribute("error", "잘못된 접근입니다.");
            return "redirect:/board/list";
        }
        model.addAttribute("board", boardService.get(bno));
        model.addAttribute("cri", cri);
        return "board/modify";
    }

    /** ✅ 등록 입력 페이지 */
    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("board", new BoardVO());
        return "/board/register";
    }

    /** ✅ 검색 및 예약 페이지 */
    @GetMapping({ "/familyreservation", "/search" })
    public String searchStores(@RequestParam(name = "keyword", required = false) String keyword,
                               @RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum,
                               @RequestParam(name = "amount", required = false, defaultValue = "10") int amount,
                               @RequestParam(name = "store_category", required = false) List<String> storeCategories,
                               Model model) {

        Criteria cri = new Criteria(pageNum, amount);
        cri.setKeyword(keyword);
        log.info("🔍 검색 요청 - 키워드: " + keyword + ", 카테고리: " + storeCategories);

        List<StoreDTO> storeList;
        int total;

        if (storeCategories != null && !storeCategories.isEmpty()) {
            storeList = storeService.getStoresByCategories(cri, storeCategories);
            total = storeService.getTotalByCategories(cri, storeCategories);
        } else {
            storeList = storeService.getList(cri);
            total = storeService.getTotal(cri);
        }

        model.addAttribute("storeList", storeList);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
<<<<<<< Updated upstream

        return "/board/kidnokids";
    }

    /** ✅ 파티룸 맛집 페이지 */
    @GetMapping("/partyroom")
    public String getPartyroom(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum,
                               @RequestParam(name = "amount", required = false, defaultValue = "10") int amount, 
                               Model model) {
        Criteria cri = new Criteria(pageNum, amount);
        log.info("partyroom page: " + cri);

        List<StoreDTO> storeList = storeService.getList(cri);
        model.addAttribute("storeList", storeList);

        int total = storeService.getTotal(cri);
        log.info("total stores: " + total);
        model.addAttribute("pageMaker", new PageDTO(cri, total));

        return "/board/partyroom";
    }

    /** ✅ 프라이빗 룸 맛집 페이지 */
    @GetMapping("/privateroom")
    public String getPrivateRoom(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum,
                                 @RequestParam(name = "amount", required = false, defaultValue = "10") int amount, 
                                 Model model) {
        Criteria cri = new Criteria(pageNum, amount);
        log.info("privateroom page: " + cri);

        List<StoreDTO> storeList = storeService.getList(cri);
        model.addAttribute("storeList", storeList);

        int total = storeService.getTotal(cri);
        log.info("total stores: " + total);
        model.addAttribute("pageMaker", new PageDTO(cri, total));

        return "/board/privateroom";
    }

    /** ✅ 예약 관리 페이지 (관리자 & 사용자 구분) */
    @GetMapping("/reservation_admin")
    public String showReservationAdminPage(Model model) {
        System.out.println("🔍 [BoardController] 예약 관리자 페이지 접근");

        // ✅ 전체 예약 조회 (날짜 필터링 없이)
        List<ReservationDTO> reservations = reservationService.getAllReservations();
        model.addAttribute("reservationList", reservations);

        System.out.println("🔍 [BoardController] 전체 예약 개수: " + reservations.size());

        return "/board/reservation_admin";
    }


    @GetMapping("/reservation_user")
    public String reservationUser() {
        return "/board/reservation_user";
=======
        model.addAttribute("keyword", keyword);
        model.addAttribute("selectedCategories", storeCategories);
        return "/board/familyreservation";
>>>>>>> Stashed changes
    }

    /** ✅ 로그인한 사용자에 따라 예약 관리 페이지 이동 */
    @GetMapping("/reservation")
    public String reservation(HttpSession session) {
        String role = (String) session.getAttribute("userRole");
        if ("admin".equals(role)) {
            return "redirect:/board/reservation_admin";
        } else {
            return "redirect:/board/reservation_user";
        }
    }
}
   
