package com.company.controller;

import java.util.List;

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

//	@GetMapping("/list")
	//public void list(Model model) {
//
	//	log.info("list");
	//	model.addAttribute("list", service.getList());
//	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// 등록 처리
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
	       log.info("register......." +vo);
	       boardservice.register(vo);
	       // "result"라는 키로 vo.getBno() 값을 Flash 속성에 추가
	       rttr.addFlashAttribute("result", vo.getBno());
	       // "/board/list"로 리다이렉트
	        return "redirect:/board/list";
	}

	// 조회 처리
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		  log.info("/get or modify");
	      model.addAttribute("board", boardservice.get(bno));
	}

	/*
	 * @GetMapping({ "/get", "/modify" }) public void get(@RequestParam("bno") Long
	 * bno, Model model) { model.addAttribute("board", boardservice.get(bno)); }
	 */

	/*
	 * @GetMapping("/get") public void get(@RequestParam("bno") Long bno, Model
	 * model) {
	 * 
	 * log.info("/get"); model.addAttribute("board", service.get(bno)); }
	 */

	// 수정 처리
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

	// 삭제
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

	// 등록 입력 페이지와 등록 처리
	@GetMapping("/register")
	public void resister() {

	}
	
	@GetMapping("/favfood")
	public String getFavFood() {
		return "/board/favfood"; // view 이름
	}
	
	@GetMapping("/familyreservation")
	
	 public String familyReservation(Model model) {
        List<StoreDTO> storeList = storeService.getAllStores(); // 기존 Store 데이터 가져오기
        model.addAttribute("storeList", storeList); // 모델에 추가하여 JSP에서 사용 가능
        return "/board/familyreservation";
	}
	
	 // ✅ 가족 단체 예약 (페이징 추가)
    @GetMapping("/familyreservation")
    public String familyReservation(
    		@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum,
    		@RequestParam(name = "amount", required = false, defaultValue = "10") int amount,
    		Model model) {
    	Criteria cri = new Criteria(pageNum, amount);
        log.info("familyreservation page: " + cri);
        
        // 페이징된 가게 목록 가져오기
        List<StoreDTO> storeList = storeService.getList(cri);
        model.addAttribute("storeList", storeList);

        // 총 가게 수
        int total = storeService.getTotal(cri);
        log.info("total stores: " + total);
        model.addAttribute("pageMaker", new PageDTO(cri, total));

        return "/board/familyreservation";
    }
	 
}
