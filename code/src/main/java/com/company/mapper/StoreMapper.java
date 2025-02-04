package com.company.mapper;


import java.util.List;
import com.company.domain.StoreDTO;

public interface StoreMapper {
	void registerStore(StoreDTO store);
//    void insertStore(StoreDTO store);
    List<StoreDTO> getAllStores();
	StoreDTO getStoreById(Long id);
}
