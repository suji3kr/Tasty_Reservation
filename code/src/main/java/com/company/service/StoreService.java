package com.company.service;

import java.util.List;

import com.company.domain.StoreDTO;

public interface StoreService {
    void registerStore(StoreDTO store);
    List<StoreDTO> getAllStores();
	void insertStore(StoreDTO storeDTO);
}