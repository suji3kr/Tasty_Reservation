package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.company.domain.Criteria;
import com.company.domain.ReplyPageDTO;
import com.company.domain.ReplyVO;
import com.company.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/*")
@AllArgsConstructor
@NoArgsConstructor
@Log4j
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	@GetMapping("/test")
	public String testReply() {
		return "test";
	}
	// 입력은 json 출력은 test
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(
			@RequestBody ReplyVO vo
	){ //클라이언트가 json 타입으로 보내주면 Reply vo 자바타입으로 변환해라
		log.info("ReplyVO: " + vo);
		int insertCount = service.register(vo);
		return insertCount == 1 ?
				new ResponseEntity<String>("success", HttpStatus.OK) :
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	@GetMapping(value = "/pages/{bno}/{page}" , produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(
		@PathVariable("bno") Long bno,
		@PathVariable("page") int page){
	log.info("getList....");
	Criteria cri = new Criteria(page, 10);
	
	return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	
}
	@GetMapping(value = "/{rno}",
			produces = {MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<ReplyVO> get(@PathVariable("rno")Long rno){
		log.info("get: " + rno);
		
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
		
		log.info("remove: " + rno);
		
		return service.remove(rno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@RequestMapping(method = RequestMethod.PUT, value = "/{rno}", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO vo,
			@PathVariable("rno") Long rno) {
		vo.setRno(rno);
		log.info("rno: " + rno);
		log.info("modify: "+ vo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
		

}
