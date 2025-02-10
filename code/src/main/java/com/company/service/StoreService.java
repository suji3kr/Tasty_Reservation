package com.company.service;

import java.util.List;
import com.company.domain.Criteria;
import com.company.domain.StoreDTO;

public interface StoreService {

    // ✅ 가게 등록
    void registerStore(StoreDTO store);

    // ✅ 모든 가게 조회 (페이징 없이)
    List<StoreDTO> getAllStores();

    // ✅ 특정 ID로 가게 조회
    StoreDTO getStoreById(Long id);

    // ✅ 페이징된 가게 리스트 조회 (검색어 포함)
    List<StoreDTO> getList(Criteria cri);

    // ✅ 총 가게 개수 조회 (검색어 포함)
    int getTotal(Criteria cri);


 // ✅ 선택된 카테고리 기준으로 가게 리스트 조회 (검색어 포함)
    List<StoreDTO> getStoresByCategories(Criteria cri, List<String> storeCategories);


    // 
 // ✅ 선택된 카테고리 기준으로 총 가게 개수 조회 (검색어 포함)
    int getTotalByCategories(Criteria cri, List<String> storeCategories);

}
