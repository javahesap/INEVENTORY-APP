package com.example.inventory.repo;

import com.example.inventory.model.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
import java.util.List;

public interface SupplierRepository extends JpaRepository<Supplier, Long> {



}
