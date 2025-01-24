package com.company.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
		public void testInsert() {
		
			BoardVO board = new BoardVO();
			board.setTitle("새로 작성하는 글");
			board.setContent("새로 작성하는 내용");
			board.setWriter("newbie");
			
			mapper.insert(board);
			
			log.info(board);
	}
	
	@Test
	public void testInsertSelectKey() {
	
		BoardVO board = new BoardVO(); //Autowired하면 안해도 됨
		board.setTitle("새로 작성하는 글 select key");
		board.setContent("새로 작성하는 내용 select key");
		board.setWriter("newbie");
		
		mapper.insertSelectKey(board);
		
		log.info(board);
	}
	
	@Test
	public void testRead() {
		// 존재하는 게시물 번호로 테스트
		BoardVO board = mapper.read(6L);
		
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete(4L));
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO board = new BoardVO();
		//실행 전 존재하는 번호인지 확인할 것
		board.setBno(9L);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("user00");
		
		int count = mapper.update(board);		
		log.info("UPDATE COUNT: " + count);
	}
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		//10개씩 3페이지
		cri.setPageNum(3);
		cri.setPageNum(10);
		
		List<BoardVO> list= mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board.getBno()));
	}
	@Test
	public void testSearch() {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("T", "1");
		map.put("C", "테스트");
		map.put("W", "테스트");
		
		Map<String, Map<String, String>> outer = new HashMap<>();
		
		outer.put("map", map);
		
		List<BoardVO> list = mapper.searchTest(outer);
		log.info(list);
	}
	@Test
	public void testgetListWithPaging() {
		Criteria cri = new Criteria();
		
		//cri.setKeyword("user00");
		//cri.setType("TCW");
		
		mapper.getListWithPaging(cri)
		.forEach(list-> log.info(list));
	}

}
