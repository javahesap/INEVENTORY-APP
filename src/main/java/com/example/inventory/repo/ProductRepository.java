package com.example.inventory.repo;

import com.example.inventory.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {

    Optional<Product> findByProductCode(String productCode);
    List<Product> findByCategoryId(Long categoryId);
}
