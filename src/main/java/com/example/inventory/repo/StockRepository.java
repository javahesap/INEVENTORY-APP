package com.example.inventory.repo;

import com.example.inventory.model.Stock;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
import java.util.List;

public interface StockRepository extends JpaRepository<Stock, Long> {



}
