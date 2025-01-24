package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.Criteria;
import com.company.domain.ReplyVO;

public interface ReplyMapper {
	public int insert(ReplyVO vo);
	public ReplyVO read(Long rno);
	public int delete(Long rno);
	
	//reply, update만 수정가능
	public int update(ReplyVO reply);
	
	//특정 댓글 페이징 처리
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
	public int getCountByBno(Long bno); //bno에 해당하는 댓글 숫자 구하기
		
	

}
