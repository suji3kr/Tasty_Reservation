package com.company.controller;

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
import com.company.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

    private BoardService service;

    @GetMapping("/list")
    public void list(Criteria cri, Model model) {
        log.info("list: " + cri);
        model.addAttribute("list", service.getList(cri));
        
        int total = service.getTotal(cri);
        log.info("total: " + total);
        
        model.addAttribute("pageMaker", new PageDTO(cri, total));
    }

    @GetMapping("/register")
    public void register() {
        // 등록 페이지로 이동
    }

    @PostMapping("/register")
    public String register(BoardVO vo, RedirectAttributes rttr) {
       log.info("register: " + vo);
       service.register(vo);
       rttr.addFlashAttribute("result", vo.getBno());
       return "redirect:/board/list";
    }

    @GetMapping({"/get", "/modify"})
    public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
        log.info("/get or modify");
        model.addAttribute("board", service.get(bno));
    }

    @PostMapping("/modify")
    public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
        log.info("modify: " + board);
        if (service.modify(board)) {
            rttr.addFlashAttribute("result", "success");
        }
        addCriteriaAttributes(cri, rttr);
        return "redirect:/board/list";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
        log.info("remove: " + bno);
        if (service.remove(bno)) {
            rttr.addFlashAttribute("result", "success");
        }
        addCriteriaAttributes(cri, rttr);
        return "redirect:/board/list";
    }

    private void addCriteriaAttributes(Criteria cri, RedirectAttributes rttr) {
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        rttr.addAttribute("type", cri.getType());
        rttr.addAttribute("keyword", cri.getKeyword());
    }

    @GetMapping("/favfood")
    public String getFavFood() {
        return "/board/favfood";
    }
    
    @GetMapping("/familyreservation")
    public String getFamilyReservation() {
        return "/board/familyreservation";
    }
}
