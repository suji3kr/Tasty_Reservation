package com.company.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.company.domain.Criteria;
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
        mapper.registerStore(store);
    }

    @Override
    public List<StoreDTO> getAllStores() {
        log.info("Fetching all stores...");
        return mapper.getAllStores();
    }


	// 특정 가게 조회 (추가)
    @Override
    public StoreDTO getStoreById(Long id) {
        log.info("Fetching store by ID: " + id);
        return mapper.getStoreById(id);
    }
    
    @Override
    public List<StoreDTO> getList(Criteria cri) {
        log.info("Fetching store list with criteria: " + cri);
        return mapper.getListWithPaging(cri);
    }

    // ✅ 총 가게 수 조회
    @Override
    public int getTotal(Criteria cri) {
        log.info("Fetching total store count with criteria: " + cri);
        return mapper.getTotalCount(cri);
    }
}
