package com.example.inventory.web;

import com.example.inventory.model.StockMovement;
import com.example.inventory.repo.ProductRepository;
import com.example.inventory.repo.StockMovementRepository;
import com.example.inventory.repo.UserRepository;
import com.example.inventory.repo.WarehouseRepository;
import com.example.inventory.service.StockService;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/movements")
public class StockMovementController {

    private final StockMovementRepository repo;
    private final ProductRepository productRepo;
    private final WarehouseRepository warehouseRepo;
    private final UserRepository userRepo;
    private final StockService stockService;

    public StockMovementController(StockMovementRepository repo, ProductRepository productRepo,
                                   WarehouseRepository warehouseRepo, UserRepository userRepo,
                                   StockService stockService) {
        this.repo = repo;
        this.productRepo = productRepo;
        this.warehouseRepo = warehouseRepo;
        this.userRepo = userRepo;
        this.stockService = stockService;
    }

    @GetMapping public List<StockMovement> all() { return repo.findAll(); }

    @PostMapping
    public StockMovement create(@RequestBody StockMovement m, Authentication auth) {
        // attach references and current user
        m.setProduct(productRepo.findById(m.getProduct().getId()).orElseThrow());
        m.setWarehouse(warehouseRepo.findById(m.getWarehouse().getId()).orElseThrow());
        if (auth != null) {
            userRepo.findByUsername(auth.getName()).ifPresent(m::setUser);
        }
        return stockService.createMovement(m);
    }
}
