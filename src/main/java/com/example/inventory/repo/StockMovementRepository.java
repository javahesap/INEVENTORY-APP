package com.example.inventory.repo;

import com.example.inventory.model.StockMovement;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
import java.util.List;

public interface StockMovementRepository extends JpaRepository<StockMovement, Long> {



}
