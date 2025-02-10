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
	// ✅ 선택된 카테고리에 맞는 가게 조회 (페이징 포함)
	List<StoreDTO> getStoresByCategories(
	    @Param("amount") int amount, 
	    @Param("offset") int offset, 
	    @Param("keyword") String keyword, 
	    @Param("storeCategories") List<String> storeCategories
	);

	// ✅ 선택된 카테고리에 맞는 총 가게 개수 조회
	int getTotalByCategories(
	    @Param("keyword") String keyword, 
	    @Param("storeCategories") List<String> storeCategories
	);

}
