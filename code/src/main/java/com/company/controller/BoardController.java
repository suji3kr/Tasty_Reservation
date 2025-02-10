package com.company.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.domain.PageDTO;
import com.company.domain.StoreDTO;
import com.company.service.BoardService;
import com.company.service.StoreService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

    private BoardService service;
    private BoardService boardservice;
    private StoreService storeService;

    /** ✅ 게시글 목록 조회 */
    @GetMapping("/list")
    public void list(Criteria cri, Model model) {
        log.info("list: " + cri);
        model.addAttribute("list", service.getList(cri));

        int total = service.getTotal(cri);
        log.info("total: " + total);

        model.addAttribute("pageMaker", new PageDTO(cri, total));
    }

    /** ✅ 게시글 등록 처리 */
    @PostMapping("/register")
    public String register(BoardVO vo, RedirectAttributes rttr) {
        log.info("register......." + vo);
        boardservice.register(vo);
        rttr.addFlashAttribute("result", vo.getBno());
        return "redirect:/board/list";
    }

    /** ✅ 게시글 상세 조회 & 수정 페이지 */
    @GetMapping({ "/get", "/modify" })
    public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
        log.info("/get or modify");
        model.addAttribute("board", boardservice.get(bno));
    }

    /** ✅ 게시글 수정 처리 */
    @PostMapping("/modify")
    public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
        log.info("modify: " + board);

        if (service.modify(board)) {
            rttr.addFlashAttribute("result", "success");
        }
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        rttr.addAttribute("type", cri.getType());
        rttr.addAttribute("keyword", cri.getKeyword());

        return "redirect:/board/list";
    }

    /** ✅ 게시글 삭제 처리 */
    @PostMapping("/remove")
    public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
        log.info("remove..." + bno);
        if (service.remove(bno)) {
            rttr.addFlashAttribute("result", "success");
        }
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        rttr.addAttribute("type", cri.getType());
        rttr.addAttribute("keyword", cri.getKeyword());

        return "redirect:/board/list";
    }

    /** ✅ 등록 입력 페이지 */
    @GetMapping("/register")
    public void register() {
    }

    /** ✅ 즐겨찾는 맛집 페이지 */
    @GetMapping("/favfood")
    public String getFavFood() {
        return "/board/favfood";
    }

    /** ✅ 가족 단체 예약 페이지 (페이징 추가) */
    @GetMapping("/familyreservation")
    public String familyReservation(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum,
                                    @RequestParam(name = "amount", required = false, defaultValue = "10") int amount, 
                                    Model model) {
        Criteria cri = new Criteria(pageNum, amount);
        log.info("familyreservation page: " + cri);

        List<StoreDTO> storeList = storeService.getList(cri);
        model.addAttribute("storeList", storeList);

        int total = storeService.getTotal(cri);
        log.info("total stores: " + total);
        model.addAttribute("pageMaker", new PageDTO(cri, total));

        return "/board/familyreservation";
    }

    /** ✅ 유아동반 가능한 맛집 페이지 */
    @GetMapping("/kidnokids")
    public String getKidnokids(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum,
                               @RequestParam(name = "amount", required = false, defaultValue = "10") int amount, 
                               Model model) {
        Criteria cri = new Criteria(pageNum, amount);
        log.info("kidnokids page: " + cri);

        List<StoreDTO> storeList = storeService.getList(cri);
        model.addAttribute("storeList", storeList);

        int total = storeService.getTotal(cri);
        log.info("total stores: " + total);
        model.addAttribute("pageMaker", new PageDTO(cri, total));

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
    public String reservationAdmin() {
        return "/board/reservation_admin";
    }

    @GetMapping("/reservation_user")
    public String reservationUser() {
        return "/board/reservation_user";
    }

    /** ✅ 로그인한 사용자에 따라 예약 관리 페이지 이동 */
    @GetMapping("/reservation")
    public String reservation(HttpSession session) {
        String role = (String) session.getAttribute("userRole");

        if ("admin".equals(role)) {
            return "redirect:/board/reservation_admin";  // 관리자 페이지 이동
        } else {
            return "redirect:/board/reservation_user";   // 사용자 페이지 이동
        }
    }
}
