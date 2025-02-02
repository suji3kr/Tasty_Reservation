package com.company.mapper;


import java.util.List;
import com.company.domain.StoreDTO;

public interface StoreMapper {
    void insertStore(StoreDTO store);
    List<StoreDTO> getAllStores();
}
