package com.company.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.Criteria;
import com.company.domain.StoreDTO;

public interface StoreMapper {
	void registerStore(StoreDTO store);
	List<StoreDTO> getListWithPaging(
		@Param("cri") Criteria cri
	);
	StoreDTO getStoreById(Long id);
	int getTotalCount(@Param("cri") Criteria cri);
	List<StoreDTO> getAllStores();
}
