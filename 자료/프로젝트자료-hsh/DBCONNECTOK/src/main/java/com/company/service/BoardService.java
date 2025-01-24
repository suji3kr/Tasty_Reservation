package com.company.service;

import java.util.List;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board);
	
	public BoardVO get (Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	//public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

}
