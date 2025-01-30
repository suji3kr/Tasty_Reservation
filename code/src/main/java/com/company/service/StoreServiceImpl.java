package com.company.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.company.domain.StoreDTO;
import com.company.mapper.StoreMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class StoreServiceImpl implements StoreService {

    private StoreMapper mapper;

    @Override
    public void registerStore(StoreDTO store) {
        log.info("Registering store: " + store);
        mapper.insertStore(store);
    }

    @Override
    public List<StoreDTO> getAllStores() {
        log.info("Fetching all stores...");
        return mapper.getAllStores();
    }

	@Override
	public void insertStore(StoreDTO storeDTO) {
		// TODO Auto-generated method stub
		mapper.insertStore(storeDTO);
		
	}
}
