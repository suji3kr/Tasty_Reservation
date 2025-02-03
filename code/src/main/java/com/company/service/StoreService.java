package com.company.service;

import java.util.List;

import com.company.domain.StoreDTO;

public interface StoreService {
	
    public void registerStore(StoreDTO store);
    
    public List<StoreDTO> getAllStores();
    
	public void insertStore(StoreDTO storeDTO);
}