package com.example.inventory.repo;

import com.example.inventory.model.Warehouse;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
import java.util.List;

public interface WarehouseRepository extends JpaRepository<Warehouse, Long> {



}
