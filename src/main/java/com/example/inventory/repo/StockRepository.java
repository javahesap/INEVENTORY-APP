package com.example.inventory.repo;

import com.example.inventory.model.Stock;
import org.springframework.data.jpa.repository.JpaRepository;


import org.springframework.data.jpa.repository.*;
public interface StockRepository extends JpaRepository<Stock, Long>, JpaSpecificationExecutor<Stock> {
}